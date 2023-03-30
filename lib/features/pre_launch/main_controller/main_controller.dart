//

import 'package:epsilon_app/features/auth/login_screen/login_screen.dart';
import 'package:epsilon_app/features/core/home_screen/home_screen.dart';
import 'package:epsilon_app/features/pre_launch/main_controller/main_controller_bloc/main_controller_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainController extends StatefulWidget {
  const MainController({super.key});

  @override
  State<MainController> createState() => _MainControllerState();
}

class _MainControllerState extends State<MainController> {
  bool goHome = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainControllerBloc, MainControllerStatus>(
      builder: (context, state) {
        return state == MainControllerStatus.home
            ? const HomeScreen()
            : LoginScreen(
                onLoginSuccess: () {
                  context
                      .read<MainControllerBloc>()
                      .add(MainControllerGoHome());
                },
              );
      },
    );
  }
}
