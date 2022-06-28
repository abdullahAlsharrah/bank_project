import 'package:dio/dio.dart';

class Client {
  static final dio =
      Dio(BaseOptions(baseUrl: "https://coded-pets-api-auth.herokuapp.com"));
}
