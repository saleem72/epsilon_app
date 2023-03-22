//

import 'package:epsilon_app/core/exceptions/app_exceptions.dart';
import 'package:epsilon_app/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:epsilon_app/core/failure/general_failure.dart';
import 'package:epsilon_app/core/failure/invalid_username_or_password.dart';
import 'package:epsilon_app/core/failure/no_internet_connection.dart';
import 'package:epsilon_app/core/network_info/network_info.dart';
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
      return Right(response);
    } on InvalidUsernameOrPasswordException catch (_) {
      return Left(InvalidUserNameOrPassword());
    } catch (error) {
      return Left(GeneralFailure(error: error.toString()));
    }
  }
}
