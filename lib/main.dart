//
import 'package:epsilon_app/core/utils/styling/colors/app_theme.dart';
import 'package:epsilon_app/dependancy_injection.dart' as di;
import 'package:epsilon_app/features/pre_launch/epsilon_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/login_screen/presentation/auth_bloc/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setStatusBarAndNavigationBarColor(ThemeMode.dark);
  await di.initDependancies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) =>
              di.locator()..add(const AuthEvent.checkAuthStatus()),
        ),
      ],
      child: const EpsilonApp(),
    );
  }
}
