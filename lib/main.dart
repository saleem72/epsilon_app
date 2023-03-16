import 'package:epsilon_app/features/pre_launch/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    // statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemStatusBarContrastEnforced: false,
    systemNavigationBarColor: Color(0xFFF1F1F1),
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // appBarTheme: const AppBarTheme(
        //   systemOverlayStyle: SystemUiOverlayStyle(
        //     // Status bar color
        //     statusBarColor: Colors.transparent,

        //     // Status bar brightness (optional)
        //     statusBarIconBrightness:
        //         Brightness.dark, // For Android (dark icons)
        //     statusBarBrightness: Brightness.light, // For iOS (dark icons)
        //   ),
        // ),
      ),
      home: const LandingScreen(),
    );
  }
}
