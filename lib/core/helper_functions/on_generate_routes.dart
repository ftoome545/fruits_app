import 'package:flutter/material.dart';
import 'package:fruits_hub/features/auth/peresntation/views/login_view.dart';
import 'package:fruits_hub/features/auth/peresntation/views/signup_view.dart';
import 'package:fruits_hub/features/onBoarding/persentation/view/on_boarding_view.dart';
import 'package:fruits_hub/features/splash/persentation/view/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());

    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());

    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());

    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
