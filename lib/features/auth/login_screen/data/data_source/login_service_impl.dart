// ignore_for_file: public_member_api_docs, sort_constructors_first
//

import 'dart:convert';

import 'package:epsilon_app/core/errors/exceptions/app_exceptions.dart';
import 'package:epsilon_app/core/helpers/api_helper/domain/api_helper.dart';
import 'package:epsilon_app/core/helpers/api_helper/domain/models/coders_response.dart';
import 'package:epsilon_app/core/utils/api_end_points.dart';
import 'package:epsilon_app/features/auth/login_screen/data/data_source/dtos/login_data.dart';
import 'package:epsilon_app/features/auth/login_screen/data/data_source/login_service.dart';

class LoginServiceImpl implements LoginService {
  final ApiHelper apiHelper;

  const LoginServiceImpl({required this.apiHelper});
  @override
  Future<LoginData> login(
      {required String username, required String password}) async {
    const String baseURL = ApiEndPoints.baseURL;
    const String endPoint = ApiEndPoints.login;
    final params = LoginParams(email: username, password: password);

    final response = await apiHelper.post(
      url: baseURL,
      endPoint: endPoint,
      body: params.toMap(),
      printResult: false,
    );
    final loginDataResponse =
        CodersResponse<LoginData>.fromMap(response, (map) {
      return LoginData.fromMap(map);
    });

    final loginData = loginDataResponse.getData();

    return loginData;
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({
    required this.email,
    required this.password,
  });

  Map<String, String> toMap() {
    return <String, String>{
      'email': email,
      'password': password,
    };
  }
}
