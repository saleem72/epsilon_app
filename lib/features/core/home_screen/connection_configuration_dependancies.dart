//

import 'package:epsilon_app/features/core/home_screen/presentation/connection_configuration_bloc/connection_configuration_bloc.dart';
import 'package:epsilon_app/features/core/home_screen/presentation/connection_configuration_monitor_bloc/connection_configuration_monitor_bloc.dart';
import 'package:get_it/get_it.dart';

import 'data/repository/connection_configuration_repository.dart';
import 'domain/repository/i_connection_configuration_repository.dart';

initConnectionConfiguration(GetIt locator) {
  // Monitor bloc
  locator.registerFactory(() => ConnectionConfigurationMonitorBloc(
        repository: locator(),
      ));

  //
  locator.registerFactory(
    () => ConnectionConfigurationBloc(
      repository: locator(),
    ),
  );

  locator.registerLazySingleton<IConnectionConfigurationRepository>(
      () => ConnectionConfigurationRepository(
            networkInfo: locator(),
            connectionGetter: locator(),
            connectionManager: locator(),
            db: locator(),
          ));
}
