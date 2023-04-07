//

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_failure.freezed.dart';

@freezed
class LoginFailure with _$LoginFailure {
  factory LoginFailure.noInternet() = _NoInternet;
  factory LoginFailure.connectionFailure() = _ConnectionFailure;
  factory LoginFailure.unAuthorized() = _UnAuthorized;
  factory LoginFailure.serverError() = _ServerError;
  factory LoginFailure.decodingError() = _DecodingError;
  factory LoginFailure.invalidUsernameOrPassword() = _invalidUsernameOrPassword;
  factory LoginFailure.unExpected({required String message}) = _UnExpected;
}
