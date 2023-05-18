import 'package:flutter/material.dart';
import 'package:login_demo/presentation/router/routes.dart';
import 'package:login_demo/presentation/screens/home/home.dart';
import 'package:login_demo/presentation/screens/login/login.dart';
import 'package:login_demo/presentation/screens/signup/signup.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppRoutes.signUp:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}
