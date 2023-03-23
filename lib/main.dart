//
import 'package:epsilon_app/dependancy_injection.dart' as di;
import 'package:epsilon_app/features/pre_launch/epsilon_app.dart';
import 'package:flutter/material.dart';
import 'package:epsilon_app/core/utils/styling/colors/app_theme.dart';

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
    return const EpsilonApp();
  }
}
