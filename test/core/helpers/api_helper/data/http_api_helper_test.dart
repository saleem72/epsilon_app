import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:epsilon_app/core/errors/exceptions/app_exceptions.dart';
import 'package:epsilon_app/core/helpers/api_helper/data/http_api_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:http/http.dart' as http;

import '../../../../features/auth/login_screen/dependancies/mock_client/http_client_test.mocks.dart';

void main() {
  late MockClient client;
  late HttpApiHelper apiHelper;

  setUp(() {
    client = MockClient();
    apiHelper = HttpApiHelper(client: client);
  });
  group('Api helper Behaviour', () {
    const tUrl = 'https://jsonplaceholder.typicode.com/';
    const tEndPoint = 'users';
    final tUri = Uri.parse(tUrl + tEndPoint);
    const tResult = {"data": "It is ok"};
    final tResponse = json.encode(tResult);
    test(
      'should preform a GET request on a URL with right endpoint and with application/json header',
      () {
        //arrange
        when(client.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response(tResponse, 200),
        );
        // act
        apiHelper.get(
            url: tUrl,
            endPoint: tEndPoint,
            headers: {'Content-Type': 'application/json'});
        // assert
        verify(client.get(
          tUri,
          headers: {'Content-Type': 'application/json'},
        ));
      },
    );

    test('Should return good response when every thing is ok', () async {
      //arrange
      when(client.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(tResponse, 200),
      );
      // act
      final result = await apiHelper.get(url: tUrl, endPoint: tEndPoint);
      // assert
      expect(result, tResult);
    });
  });
  group('Api helper Handle exceptions', () {
    const tUrl = 'https://jsonplaceholder.typicode.com/';
    const tEndPoint = 'users';
    test(
        'Should throw [ConnectionException] when client throws SocketException',
        () async {
      // arrange
      when(client.get(any)).thenThrow(const SocketException(''));

      // when(client.get(any)).thenThrow(
      //   (_) async => throwsA(const SocketException('')),
      // );

      // act
      final call = apiHelper.get;
      // assert

      expect(() => call(url: tUrl, endPoint: tEndPoint),
          throwsA(const TypeMatcher<ConnectionException>()));
      // expectLater(call(url: tUrl, endPoint: tEndPoint),
      //     throwsA(const TypeMatcher<AppException>()));
    });

    test(
        'Should throw [ConnectionException] when client throws TimeoutException',
        () async {
      // arrange
      when(client.get(any)).thenThrow(TimeoutException(''));

      // when(client.get(any)).thenThrow(
      //   (_) async => throwsA(const SocketException('')),
      // );

      // act
      final call = apiHelper.get;
      // assert

      expect(() => call(url: tUrl, endPoint: tEndPoint),
          throwsA(const TypeMatcher<ConnectionException>()));
      // expectLater(call(url: tUrl, endPoint: tEndPoint),
      //     throwsA(const TypeMatcher<AppException>()));
    });

    /*
    test('Should throw [BadRequestException] when response status code 400',
        () async {
      // arrange
      when(client.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response('Something went wrong', 400),
      );
      // act
      final call = apiHelper.get;
      // assert
      expectLater(call(url: tUrl, endPoint: tEndPoint),
          throwsA(const TypeMatcher<BadRequestException>()));
    });
    */

    test('Should throw [UnauthorisedException] when response status code 401',
        () async {
      // arrange
      when(client.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response('Something went wrong', 401),
      );
      // act
      final call = apiHelper.get;
      // assert
      expectLater(call(url: tUrl, endPoint: tEndPoint),
          throwsA(const TypeMatcher<UnauthorisedException>()));
    });

    test('Should throw [ServerException] when response status code 500',
        () async {
      // arrange
      when(client.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response('Something went wrong', 500),
      );
      // act
      final call = apiHelper.get;
      // assert
      expectLater(call(url: tUrl, endPoint: tEndPoint),
          throwsA(const TypeMatcher<ServerException>()));
    });
    /*
    test('Should throw [NotExsitsRouteException] when end point not found',
        () async {
      // arrange
      when(client.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response('Something went wrong', 404),
      );
      // act
      final call = apiHelper.get;
      // assert
      expectLater(call(url: tUrl, endPoint: tEndPoint),
          throwsA(const TypeMatcher<NotExsitsRouteException>()));
    });
    */
  });
}
