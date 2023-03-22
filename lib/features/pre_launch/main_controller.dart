//

import 'package:epsilon_app/core/localization/language_constants.dart';
import 'package:epsilon_app/features/auth/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class MainController extends StatefulWidget {
  const MainController({super.key});

  @override
  State<MainController> createState() => _MainControllerState();
}

class _MainControllerState extends State<MainController> {
  bool goHome = false;
  @override
  Widget build(BuildContext context) {
    return goHome
        ? Container(
            color: Colors.green,
          )
        : LoginScreen(
            onLoginSuccess: () {
              setState(() {
                goHome = true;
              });
            },
          );
  }
}
