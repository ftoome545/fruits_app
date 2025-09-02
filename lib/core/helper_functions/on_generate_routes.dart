import 'package:flutter/material.dart';
import 'package:fruits_hub/features/auth/peresntation/views/singin_view.dart';
import 'package:fruits_hub/features/auth/peresntation/views/signup_view.dart';
import 'package:fruits_hub/features/best_selling_fruits/presentation/view/best_selling_view.dart';
import 'package:fruits_hub/features/checkout/presentation/view/checkout_view.dart';
import 'package:fruits_hub/features/home/presentation/view/main_view.dart';
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

    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());

    case BestSellingView.routeName:
      return MaterialPageRoute(builder: (context) => const BestSellingView());

    case CheckoutView.routeName:
      return MaterialPageRoute(builder: (context) => const CheckoutView());

    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
