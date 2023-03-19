//\\

import 'package:epsilon_app/core/routing/app_screens.dart';
import 'package:epsilon_app/core/routing/route_generator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../core/styling/colors/app_theme.dart';

class EpsilonApp extends StatelessWidget {
  const EpsilonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      theme: appLightTheme,
      onGenerateRoute: RouteGenerator.generate,
      initialRoute: AppScreens.initial,
    );
  }
}
