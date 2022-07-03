import 'dart:convert';
import 'dart:io';

import 'package:bank_project/models/user.dart';
import 'package:bank_project/providers/trans_providers.dart';
import 'package:bank_project/services/client.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/auth_services.dart';

class AuthProviders extends ChangeNotifier {
  User? user;
  late String token = "";
  Future<void> signUp(User user) async {
    token = await AuthServices().signUp(user);
    await setToken(token);
    notifyListeners();
  }

  Future<void> update(User user) async {
    await AuthServices().update(user);
    this.user = user;
    notifyListeners();
  }

  Future<void> signIn(User user) async {
    token = await AuthServices().signIn(user);
    setToken(token);
    notifyListeners();
  }

  void signOut() {
    token = "";
    notifyListeners();
  }

  Future<void> setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
    var json = Jwt.parseJwt(token);
    user = User.fromJson2(json);
    Client.dio.options.headers = {
      HttpHeaders.authorizationHeader: 'Bearer $token',
    };
    notifyListeners();
  }

  void getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token") ?? "";

    notifyListeners();
  }

  Future<void> addBalance(String balance) async {
    int addedBalance = int.parse(balance);
    await AuthServices().addBalanceSer(addedBalance);
    user?.balance = ((user?.balance ?? 0) + addedBalance);
    TransProviders().getTransactions();

    notifyListeners();
  }

  Future<void> withdraw(String balance) async {
    int widthdrawnBalance = int.parse(balance);
    int? currentBalance = user?.balance ?? 0;
    if (widthdrawnBalance <= currentBalance && currentBalance != 0) {
      await AuthServices().withdraw(widthdrawnBalance);
      user?.balance = ((currentBalance) - widthdrawnBalance);
      TransProviders().getTransactions();
      notifyListeners();
    }
  }

  Future<void> send(String balance, String username) async {
    int widthdrawnBalance = int.parse(balance);
    int? currentBalance = user?.balance ?? 0;
    if (widthdrawnBalance <= currentBalance && currentBalance != 0) {
      await AuthServices().send(widthdrawnBalance, username);
      user?.balance = ((currentBalance) - widthdrawnBalance);
    }
    TransProviders().getTransactions();

    notifyListeners();
  }

  bool get isAuth {
    if (token.isNotEmpty && Jwt.getExpiryDate(token)!.isAfter(DateTime.now())) {
      var json = Jwt.parseJwt(token);
      user = User.fromJson2(json);
      return true;
    }
    logout();
    return false;
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
    token = "";
    notifyListeners();
  }
}
