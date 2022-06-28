import 'dart:convert';

import 'package:bank_project/models/user.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/auth_services.dart';

class AuthProviders extends ChangeNotifier {
  User? user;
  late String token = "";
  void signUp(User user) async {
    token = await AuthServices().signUp(user);

    notifyListeners();
  }

  void signIn(User user) async {
    token = await AuthServices().signIn(user);
    setToken(token);
    notifyListeners();
  }

  void signOut() {
    token = "";
    notifyListeners();
  }

  void setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
    notifyListeners();
  }

  void getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token") ?? "";
    notifyListeners();
  }

  bool get isAuth {
    if (token.isNotEmpty && Jwt.getExpiryDate(token)!.isAfter(DateTime.now())) {
      var json = Jwt.parseJwt(token);
      user = User.fromJson2(json);
      print(user);
      return true;
    }
    logout();
    return false;
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
    print("Logout");
    token = "";
    notifyListeners();
  }
}
