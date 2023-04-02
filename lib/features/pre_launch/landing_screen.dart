//

import 'package:epsilon_app/core/helpers/safe.dart';
import 'package:epsilon_app/core/utils/routing/app_screens.dart';
import 'package:epsilon_app/features/pre_launch/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/login_screen/presentation/auth_bloc/auth_bloc.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  bool procced = false;
  AuthOption target = AuthOption.none;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthStatus>(
      listener: (context, state) {
        state.map(
          empty: (_) {},
          home: (_) {
            setState(() {
              target = AuthOption.home;
              _handleNavigation(context);
            });
          },
          login: (_) {
            setState(() {
              target = AuthOption.login;
              _handleNavigation(context);
            });
          },
        );
      },
      child: SplashScreen(
        onFinish: () {
          setState(() {
            procced = true;
            _handleNavigation(context);
          });
        },
      ),
    );
  }

  _handleNavigation(BuildContext context) {
    if (!procced) {
      return;
    }
    if (target == AuthOption.home) {
      Navigator.of(context).pushReplacementNamed(AppScreens.home);
    }
    if (target == AuthOption.login) {
      Navigator.of(context).pushReplacementNamed(AppScreens.login);
    }
  }
}
