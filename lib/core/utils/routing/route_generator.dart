//

import 'package:epsilon_app/core/utils/routing/app_screens.dart';
import 'package:epsilon_app/core/utils/routing/routing_error.dart';
import 'package:epsilon_app/features/core/operations_screen/operations_screen.dart';
import 'package:epsilon_app/features/core/query_subject_screen/query_subject_screen.dart';
import 'package:epsilon_app/features/core/subject_details_screen/subject_details_screen.dart';
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
      case AppScreens.operationsScreen:
        return MaterialPageRoute(
          builder: (context) => const OperationsScreen(),
        );
      case AppScreens.querySubjectScreen:
        return MaterialPageRoute(
          builder: (context) => const QuerySubjectScreen(),
        );
      case AppScreens.subjectDetailsScreen:
        return MaterialPageRoute(
          builder: (context) => const SubjectDetailsScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) =>
              RoutingError(errorMessage: "Unknow route ${settings.name}"),
        );
    }
  }
}
