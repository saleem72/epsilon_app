//
import 'package:epsilon_app/core/utils/styling/colors/app_theme.dart';
import 'package:epsilon_app/dependancy_injection.dart' as di;
import 'package:epsilon_app/features/pre_launch/epsilon_app.dart';
import 'package:epsilon_app/features/pre_launch/main_controller/main_controller_bloc/main_controller_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/helpers/database_communicator/presentation/bloc/database_communicator.dart';

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
        BlocProvider<DatabaseCommunicator>(
          create: (context) =>
              di.locator()..add(DatabaseCommunicatorFetchConnections()),
        )
      ],
      child: const EpsilonApp(),
    );
  }
}
