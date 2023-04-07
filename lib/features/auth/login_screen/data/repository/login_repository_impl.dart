//

import 'package:dartz/dartz.dart';
import 'package:epsilon_app/core/helpers/network_info/network_info.dart';
import 'package:epsilon_app/features/auth/login_screen/data/data_source/login_service.dart';
import 'package:epsilon_app/features/auth/login_screen/domain/failures/login_failure.dart';
import 'package:epsilon_app/features/auth/login_screen/domain/repository/login_repository.dart';

import '../../../../../core/errors/exceptions/app_exceptions.dart';

class LoginRepositoryImpl implements LoginRepository {
  final NetworkInfo networkInfo;
  final LoginService service;

  LoginRepositoryImpl({
    required this.networkInfo,
    required this.service,
  });

  @override
  Future<Either<LoginFailure, String>> login(
      {required String username, required String password}) async {
    final isConnected = await networkInfo.isConnected;
    if (!isConnected) {
      return Left(LoginFailure.noInternet());
    }
    try {
      final response =
          await service.login(username: username, password: password);
      return const Right('it is ok');
    } on InvalidUsernameOrPasswordException {
      return Left(LoginFailure.invalidUsernameOrPassword());
    } catch (error) {
      final failure = mapError(error);
      return Left(failure);
    }
  }

  LoginFailure mapError(Object error) {
    if (error is ConnectionException) {
      return LoginFailure.connectionFailure();
    }

    if (error is TypeError) {
      return LoginFailure.decodingError();
    }

    if (error is BadResponseException) {}

    // bad response status code 400
    if (error is BadRequestException) {}

    // Status code
    if (error is UnauthorisedException) {
      return LoginFailure.unAuthorized();
    }
    if (error is NotExsitsRouteException) {}
    if (error is ServerException) {
      return LoginFailure.serverError();
    }

    // if (error is UnExpectedException) {}
    return LoginFailure.unExpected(message: error.toString());
  }
}
