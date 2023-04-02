//

import 'package:epsilon_app/core/helpers/api_helper/data/http_api_helper.dart';
import 'package:epsilon_app/core/helpers/api_helper/domain/api_helper.dart';
import 'package:epsilon_app/core/helpers/database_communicator/data/repository/database_communicator_repository_impl.dart';
import 'package:epsilon_app/core/helpers/network_info/network_info.dart';
import 'package:epsilon_app/core/helpers/safe.dart';
import 'package:epsilon_app/core/usecases/validate_password.dart';
import 'package:epsilon_app/core/usecases/validate_username.dart';
import 'package:epsilon_app/features/auth/login_screen/login_dependancies.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/helpers/database_communicator/data/connection_manager/connection_manager.dart';
import 'core/helpers/database_communicator/data/sql_statements_provider/local_sql_statment_provider.dart';
import 'core/helpers/database_communicator/domain/repository/database_communicator_repository.dart';
import 'core/helpers/database_communicator/domain/sql_statements_provider/sql_statement_provider.dart';
import 'core/helpers/database_communicator/presentation/bloc/database_communicator.dart';
import 'features/auth/login_screen/presentation/auth_bloc/auth_bloc.dart';
import 'features/core/query_product/product_details_screen/usecases/product_details_mapper.dart';

final locator = GetIt.instance;

Future<void> initDependancies() async {
  // Features
  initLoginDependancies(locator);

  // DatabaseProvider Bloc
  locator.registerLazySingleton(
    () => DatabaseCommunicator(
      repository: locator(),
    ),
  );
  locator.registerLazySingleton<SqlStatmentProvider>(
      () => LocalSqlStamentProvider());
  locator.registerLazySingleton(() => ConnectionManager());
  locator.registerLazySingleton(() => ProductDetailsMapper());
  locator.registerLazySingleton<DatabaseCommunicatorRepository>(
    () => DatabaseCommunicatorRepositoryImpl(
      networkInfo: locator(),
      connectionManager: locator(),
      sqlProvider: locator(),
      productDetailsMapper: locator(),
    ),
  );

  // Core
  locator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(checker: locator()));
  locator.registerLazySingleton(() => ValidateUsername());
  locator.registerLazySingleton(() => ValidatePassword());
  locator
      .registerLazySingleton<ApiHelper>(() => HttpApiHelper(client: locator()));
  locator.registerLazySingleton(() => Safe(storage: locator()));

  locator.registerLazySingleton(() => AuthBloc(safe: locator()));

  // External
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(sharedPreferences);

  locator.registerLazySingleton(() => http.Client());

  locator.registerLazySingleton(() => InternetConnectionChecker());
}
