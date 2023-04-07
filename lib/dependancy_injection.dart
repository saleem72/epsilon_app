//
import 'package:epsilon_app/core/helpers/helpers_dependancies.dart';
import 'package:epsilon_app/features/auth/login_screen/login_dependancies.dart';
import 'package:epsilon_app/features/core/home_screen/connection_configuration_dependancies.dart';
import 'package:epsilon_app/features/core/query_product/product_details_dependancies.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> initDependancies() async {
  // Features
  // Login
  initLoginDependancies(locator);

  // ConnectionConfiguration
  initConnectionConfiguration(locator);

  // Product Details
  initProductDetails(locator);

  // App common Helpers
  initHelpers(locator);

  // External
  // Shared Preferences
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(sharedPreferences);

  // http.Client
  locator.registerLazySingleton(() => http.Client());

  // Internet Checker
  locator.registerLazySingleton(() => InternetConnectionChecker());
}
