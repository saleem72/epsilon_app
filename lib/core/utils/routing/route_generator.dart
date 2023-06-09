//

import 'package:epsilon_app/core/utils/routing/app_screens.dart';
import 'package:epsilon_app/core/utils/routing/routing_error.dart';
import 'package:epsilon_app/features/auth/login_screen/login_screen.dart';
import 'package:epsilon_app/features/core/customer_account/customer_search/customer_search.dart';
import 'package:epsilon_app/features/core/home_screen/home_screen.dart';
import 'package:epsilon_app/features/core/operations_screen/operations_screen.dart';
import 'package:epsilon_app/features/pre_launch/landing_screen.dart';
import 'package:flutter/material.dart';

import '../../../features/core/query_product/query_product_screen/query_product_screen.dart';

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic>? generate(RouteSettings settings) {
    // final arguments = settings.arguments;
    switch (settings.name) {
      case AppScreens.initial:
        return MaterialPageRoute(
          builder: (context) => const LandingScreen(),
        );
      case AppScreens.home:
        return MaterialPageRoute(
          builder: (context) => const ConnectionConfigurationScreen(),
        );
      case AppScreens.login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case AppScreens.operationsScreen:
        return MaterialPageRoute(
          builder: (context) => const OperationsScreen(),
        );
      case AppScreens.querySubjectScreen:
        return MaterialPageRoute(
          builder: (context) => const QueryProductScreen(),
        );
      case AppScreens.customerSearch:
        return MaterialPageRoute(
          builder: (context) => const CustomerSearch(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) =>
              RoutingError(errorMessage: "Unknow route ${settings.name}"),
        );
    }
  }
}
