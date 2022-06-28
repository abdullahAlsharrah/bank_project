import 'package:bank_project/services/client.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bank_project/models/user.dart';
import 'package:bank_project/services/auth_services.dart';

class AuthServices {
  // final _dio = Dio();

  Future<String> signUp(User user) async {
    Response res = await Client.dio.post("/signup/", data: user.toJson());
    return res.data["token"];
  }

  Future<String> signIn(User user) async {
    Response res = await Client.dio.post("/signin", data: user.toJson());

    return res.data["token"];
  }
}
