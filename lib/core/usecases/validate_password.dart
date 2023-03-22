//

import 'package:epsilon_app/core/usecases/validation_status.dart';
import 'package:epsilon_app/core/utils/app_constants.dart';

class ValidatePassword {
  ValidationStatus call(String password) {
    if (password.isEmpty) {
      return ValidationStatus.emptyPassword;
    }
    if (password.length < AppConstants.passwordMinLength) {
      return ValidationStatus.shortPassword;
    }
    return ValidationStatus.valid;
  }
}
