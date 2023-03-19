//

import 'package:epsilon_app/core/routing/app_screens.dart';
import 'package:epsilon_app/core/routing/routing_error.dart';
import 'package:epsilon_app/features/pre_launch/landing_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic>? generate(RouteSettings settings) {
    // final arguments = settings.arguments;
    switch (settings.name) {
      case AppScreens.initial:
        return MaterialPageRoute(
          builder: (context) => const LandingScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) =>
              RoutingError(errorMessage: "Unknow route ${settings.name}"),
        );
    }
  }
}
