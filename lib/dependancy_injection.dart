//

import 'package:epsilon_app/core/helpers/api_helper/data/http_api_helper.dart';
import 'package:epsilon_app/core/helpers/api_helper/domain/api_helper.dart';
import 'package:epsilon_app/core/helpers/network_info/network_info.dart';
import 'package:epsilon_app/core/usecases/validate_password.dart';
import 'package:epsilon_app/core/usecases/validate_username.dart';
import 'package:epsilon_app/features/auth/login_screen/login_dependancies.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

Future<void> initDependancies() async {
  // Features
  initLoginDependancies(locator);

  // Core
  locator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(checker: locator()));
  locator.registerLazySingleton(() => ValidateUsername());
  locator.registerLazySingleton(() => ValidatePassword());
  locator
      .registerLazySingleton<ApiHelper>(() => HttpApiHelper(client: locator()));

  // External
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  locator.registerSingleton(sharedPreferences);

  locator.registerLazySingleton(() => http.Client());

  locator.registerLazySingleton(() => InternetConnectionChecker());
}
