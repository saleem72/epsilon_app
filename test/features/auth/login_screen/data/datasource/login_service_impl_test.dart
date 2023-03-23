//
import 'dart:convert';

import 'package:epsilon_app/core/errors/exceptions/app_exceptions.dart';
import 'package:epsilon_app/core/utils/api_end_points.dart';
import 'package:epsilon_app/features/auth/login_screen/data/data_source/dtos/login_data.dart';
import 'package:epsilon_app/features/auth/login_screen/data/data_source/login_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// import '../../dependancies/mock_client/http_client_test.mocks.dart';
import '../../../../../fixtures/fixture_reader.dart';
import '../../dependancies/mock_api_helper/api_helper_test.mocks.dart';

void main() {
  // late MockClient client;
  late MockHttpApiHelper apiHelper;
  late LoginServiceImpl service;

  setUp(() {
    apiHelper = MockHttpApiHelper();
    service = LoginServiceImpl(apiHelper: apiHelper);
  });

  group('LoginService Behaviour', () {
    final tSuccessFixture = fixture('login_success_response.json');
    final tSuccessResponse = json.decode(tSuccessFixture);
    final tFailureFixture = fixture('login_failure_response.json');
    final tFailureResponse = jsonDecode(tFailureFixture);

    const tUsername = 'user';
    const tPassword = 'password';

    void prepareSuccessPost() {
      when(apiHelper.post(
        url: anyNamed('url'),
        endPoint: anyNamed('endPoint'),
        body: anyNamed('body'),
        printResult: anyNamed('printResult'),
        headers: anyNamed('headers'),
        params: anyNamed('params'),
      )).thenAnswer(
        (_) async => tSuccessResponse,
      );
    }

    void prepareFailurePost() {
      when(apiHelper.post(
        url: anyNamed('url'),
        endPoint: anyNamed('endPoint'),
        body: anyNamed('body'),
        printResult: anyNamed('printResult'),
        headers: anyNamed('headers'),
        params: anyNamed('params'),
      )).thenAnswer(
        (_) async => tFailureResponse,
      );
    }

    test('Should send right arguments when calling api helper', () {
      // arrange
      prepareSuccessPost();
      //  act
      service.login(username: tUsername, password: tPassword);

      // assert
      final expectedBody = {"email": tUsername, "password": tPassword};
      verify(apiHelper.post(
        url: ApiEndPoints.baseURL,
        endPoint: ApiEndPoints.login,
        headers: null,
        params: null,
        body: expectedBody,
        printResult: false,
      ));
    });

    test('Should return [LoginData] when credentials are valid', () async {
      // arrange
      prepareSuccessPost();
      //  act
      final loginData =
          await service.login(username: tUsername, password: tPassword);

      // assert
      expect(loginData, isA<LoginData>());
    });

    test(
        'Should throw [InvalidUsernameOrPasswordException] when credentials are invalid',
        () async {
      // arrange
      prepareFailurePost();
      // act
      final call = service.login;
      // assert

      expect(() => call(username: tUsername, password: tPassword),
          throwsA(const TypeMatcher<InvalidUsernameOrPasswordException>()));
    });
  });
}
