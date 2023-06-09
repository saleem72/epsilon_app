//

import 'package:epsilon_app/features/auth/login_screen/data/data_source/login_service_impl.dart';
import 'package:epsilon_app/features/auth/login_screen/data/repository/login_repository_impl.dart';
import 'package:epsilon_app/features/auth/login_screen/domain/repository/login_repository.dart';
import 'package:epsilon_app/features/auth/login_screen/presentation/auth_bloc/auth_bloc.dart';
import 'package:epsilon_app/features/auth/login_screen/presentation/login_bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../core/usecases/validate_password.dart';
import '../../../core/usecases/validate_username.dart';
import 'data/data_source/login_service.dart';

initLoginDependancies(GetIt locator) {
  // Bloc
  locator.registerFactory(() => LoginBloc(
        repository: locator(),
        usernameValidator: locator(),
        passwordValidator: locator(),
      ));

  // Repository
  locator.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(
        networkInfo: locator(),
        service: locator(),
      ));

  // Service
  locator.registerLazySingleton<LoginService>(
      () => LoginServiceImpl(apiHelper: locator()));

  locator.registerLazySingleton(() => ValidateUsername());
  locator.registerLazySingleton(() => ValidatePassword());

  locator.registerLazySingleton(() => AuthBloc(safe: locator()));
}
