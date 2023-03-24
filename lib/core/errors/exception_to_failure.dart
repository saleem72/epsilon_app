//

import 'package:epsilon_app/core/errors/exceptions/app_exceptions.dart';
import 'package:epsilon_app/core/errors/failure/failure.dart';

// class ValidatePassword {
//   ValidationStatus call(String password) {
//     if (password.isEmpty) {
//       return ValidationStatus.emptyPassword;
//     }
//     if (password.length < AppConstants.passwordMinLength) {
//       return ValidationStatus.shortPassword;
//     }
//     return ValidationStatus.valid;
//   }
// }

class ExceptionToFailure {
  Failure call(Object error) {
    if (error is InvalidUsernameOrPasswordException) {
      return InvalidUserNameOrPassword();
    }
    if (error is ConnectionException) {
      return ConnectionFailure();
    }

    if (error is TypeError) {
      return DecodingFailure();
    }

    if (error is BadResponseException) {}

    // bad response status code 400
    if (error is BadRequestException) {}

    // Status code
    if (error is UnauthorisedException) {}
    if (error is NotExsitsRouteException) {}
    if (error is ServerException) {}

    // if (error is UnExpectedException) {}
    return UnExpectedFailure(error: error.toString());
  }
}
