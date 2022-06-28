import 'package:bank_project/pages/home_page.dart';
import 'package:bank_project/pages/login_page.dart';
import 'package:bank_project/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

final _router = GoRouter(routes: [
  GoRoute(path: "/", builder: (context, state) => const HomePage()),
  GoRoute(path: "/signin", builder: (context, state) => LoginScreen()),
  GoRoute(path: "/signup", builder: (context, state) => const SignupPage()),
]);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      routeInformationProvider: _router.routeInformationProvider,
    );
  }
}
