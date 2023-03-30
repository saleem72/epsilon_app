//

import 'package:dartz/dartz.dart';
import 'package:epsilon_app/core/errors/exception_to_failure.dart';
import 'package:epsilon_app/core/errors/failure/failure.dart';
import 'package:epsilon_app/core/helpers/network_info/network_info.dart';
import 'package:epsilon_app/features/auth/login_screen/data/data_source/login_service.dart';
import 'package:epsilon_app/features/auth/login_screen/domain/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final NetworkInfo networkInfo;
  final LoginService service;

  LoginRepositoryImpl({
    required this.networkInfo,
    required this.service,
  });

  @override
  Future<Either<Failure, String>> login(
      {required String username, required String password}) async {
    final isConnected = await networkInfo.isConnected;
    if (!isConnected) {
      return Left(NoInternetConnection());
    }
    try {
      final response =
          await service.login(username: username, password: password);
      return const Right('it is ok');
    } catch (error) {
      final failure = ExceptionToFailure().call(error);
      return Left(failure);
    }
  }
}
