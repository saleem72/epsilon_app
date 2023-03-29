//
import 'package:epsilon_app/dependancy_injection.dart' as di;
import 'package:epsilon_app/features/pre_launch/epsilon_app.dart';
import 'package:epsilon_app/features/pre_launch/main_controller/main_controller_bloc/main_controller_bloc.dart';
import 'package:flutter/material.dart';
import 'package:epsilon_app/core/utils/styling/colors/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/core/home_screen/presentation/connection_manager/database_provider/database_provider.dart';

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
        BlocProvider<MainControllerBloc>(
          create: (context) => di.locator(),
        ),
        BlocProvider<DatabaseProvider>(
          create: (context) =>
              di.locator()..add(DatabaseProviderFetchConnections()),
        )
      ],
      child: const EpsilonApp(),
    );
  }
}
