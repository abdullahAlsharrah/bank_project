import 'package:dio/dio.dart';

class Client {
  static final dio =
      Dio(BaseOptions(baseUrl: "https://coded-bank-api.herokuapp.com"));
}
