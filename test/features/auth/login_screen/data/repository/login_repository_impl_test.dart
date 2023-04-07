//

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:epsilon_app/core/errors/exceptions/app_exceptions.dart';
import 'package:epsilon_app/features/auth/login_screen/data/data_source/dtos/login_data_dto.dart';
import 'package:epsilon_app/features/auth/login_screen/data/repository/login_repository_impl.dart';
import 'package:epsilon_app/features/auth/login_screen/domain/failures/login_failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../../fixtures/fixture_reader.dart';
import '../../dependancies/mock_login_service/login_service_impl_test.mocks.dart';
import '../../dependancies/mock_network_info/network_info_test.mocks.dart';

void main() {
  late MockNetworkInfoImpl networkInfo;
  late MockLoginServiceImpl loginService;
  late LoginRepositoryImpl repository;

  setUp(() {
    networkInfo = MockNetworkInfoImpl();
    loginService = MockLoginServiceImpl();
    repository =
        LoginRepositoryImpl(networkInfo: networkInfo, service: loginService);
  });

  group('LoginRepository Behaviour', () {
    final tSuccessFixture = fixture('login_data.json');
    final tSuccessResponse = json.decode(tSuccessFixture);
    final tLoginData = LoginDataDTO.fromMap(tSuccessResponse);

    const tUsername = 'user';
    const tPassword = 'password';
    test('Should return [Either<String>] when login credentials are valid',
        () async {
      // arrange
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      when(loginService.login(
              username: anyNamed('username'), password: anyNamed('password')))
          .thenAnswer((_) async => 'it is ok');
      // act
      final response =
          await repository.login(username: tUsername, password: tPassword);
      // assert
      expect(response, equals(const Right('it is ok'))); // tLoginData
    });

    test('Should return [Either<Failure>] when login credentials are invalid',
        () async {
      // arrange
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      when(loginService.login(
              username: anyNamed('username'), password: anyNamed('password')))
          .thenThrow(InvalidUsernameOrPasswordException());
      // act
      final response =
          await repository.login(username: tUsername, password: tPassword);
      // assert
      expect(response, equals(Left(LoginFailure.invalidUsernameOrPassword())));
    });

    test(
        'Should return [Either<NoInternetConnection>] when there is no internet connection',
        () async {
      // arrange
      when(networkInfo.isConnected).thenAnswer((_) async => false);
      when(loginService.login(
              username: anyNamed('username'), password: anyNamed('password')))
          .thenThrow(InvalidUsernameOrPasswordException());
      // act
      final response =
          await repository.login(username: tUsername, password: tPassword);
      // assert
      expect(response, equals(Left(LoginFailure.noInternet())));
      verifyZeroInteractions(loginService);
    });
  });
}
