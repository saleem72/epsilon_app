//

import 'package:epsilon_app/core/helpers/api_helper/data/http_api_helper.dart';
import 'package:epsilon_app/core/helpers/api_helper/domain/api_helper.dart';
import 'package:epsilon_app/core/helpers/network_info/network_info.dart';
import 'package:epsilon_app/core/helpers/safe.dart';
import 'package:epsilon_app/core/usecases/validate_password.dart';
import 'package:epsilon_app/core/usecases/validate_username.dart';
import 'package:epsilon_app/features/auth/login_screen/login_dependancies.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'core/helpers/database_communicator/data/connection_manager/connection_manager.dart';
import 'core/helpers/database_communicator/data/sql_statements_provider/local_sql_statment_provider.dart';
import 'core/helpers/database_communicator/domain/sql_statements_provider/sql_statement_provider.dart';
import 'core/helpers/database_communicator/presentation/connection_manager/database_communicator/database_communicator.dart';
import 'features/core/query_product/product_details_screen/usecases/product_details_mapper.dart';
import 'features/pre_launch/main_controller/main_controller_bloc/main_controller_bloc.dart';

final locator = GetIt.instance;

Future<void> initDependancies() async {
  // Features
  initLoginDependancies(locator);

  // DatabaseProvider Bloc
  locator.registerLazySingleton(
    () => DatabaseCommunicator(
      connectionManager: locator(),
      productDetailsMapper: locator(),
      sqlProvider: locator(),
    ),
  );
  locator.registerLazySingleton<SqlStatmentProvider>(
      () => LocalSqlStamentProvider());
  locator.registerLazySingleton(() => ConnectionManager());
  locator.registerLazySingleton(() => ProductDetailsMapper());

  // Core
  locator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(checker: locator()));
  locator.registerLazySingleton(() => ValidateUsername());
  locator.registerLazySingleton(() => ValidatePassword());
  locator
      .registerLazySingleton<ApiHelper>(() => HttpApiHelper(client: locator()));
  locator.registerLazySingleton(() => Safe(storage: locator()));

  locator.registerLazySingleton(() => MainControllerBloc(safe: locator()));

  // External
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(sharedPreferences);

  locator.registerLazySingleton(() => http.Client());

  locator.registerLazySingleton(() => InternetConnectionChecker());
}
