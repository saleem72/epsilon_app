//

import 'package:epsilon_app/features/pre_launch/main_controller.dart';
import 'package:epsilon_app/features/pre_launch/splash_screen.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late bool procced = false;

  @override
  Widget build(BuildContext context) {
    return procced == true
        ? const MainController()
        : SplashScreen(
            onFinish: () {
              setState(() {
                procced = true;
              });
            },
          );
  }
}
