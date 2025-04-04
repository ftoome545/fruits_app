import 'package:flutter/material.dart';
import 'package:fruits_hub/features/auth/peresntation/views/singin_view.dart';
import 'package:fruits_hub/features/auth/peresntation/views/signup_view.dart';
import 'package:fruits_hub/features/home/presentation/view/home_view.dart';
import 'package:fruits_hub/features/onBoarding/persentation/view/on_boarding_view.dart';
import 'package:fruits_hub/features/splash/persentation/view/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());

    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());

    case SigninView.routeName:
      return MaterialPageRoute(builder: (context) => const SigninView());

    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());

    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
