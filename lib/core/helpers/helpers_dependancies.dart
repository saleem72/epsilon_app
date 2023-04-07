//

import 'package:epsilon_app/core/helpers/database_communicator/data/connection_manager/connection_manager.dart';
import 'package:epsilon_app/core/helpers/database_communicator/data/sql_statements_provider/local_sql_statment_provider.dart';
import 'package:epsilon_app/core/helpers/database_communicator/domain/sql_statements_provider/sql_statement_provider.dart';
import 'package:epsilon_app/core/helpers/safe.dart';
import 'package:get_it/get_it.dart';

import 'api_helper/data/http_api_helper.dart';
import 'api_helper/domain/api_helper.dart';
import 'database_communicator/data/local_cache/database/app_database.dart';
import 'database_communicator/data/usecases/cached_connection_getter.dart';
import 'network_info/network_info.dart';

initHelpers(GetIt locator) {
  // SqlStatmentProvider
  locator.registerLazySingleton<SqlStatmentProvider>(
      () => LocalSqlStamentProvider());

  // ConnectionManager
  locator.registerLazySingleton(
    () => ConnectionManager(),
  );

  // database
  locator.registerSingleton(AppDatabase());
  locator.registerLazySingleton(
    () => CachedConnectionGetter(db: locator()),
  );

  // NetworkInfo
  locator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(checker: locator()));

  // ApiHelper
  locator.registerLazySingleton<ApiHelper>(
    () => HttpApiHelper(client: locator()),
  );

  // Safe
  locator.registerLazySingleton(
    () => Safe(storage: locator()),
  );
}
