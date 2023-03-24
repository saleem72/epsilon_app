//

import 'package:epsilon_app/core/usecases/validation_status.dart';
import 'package:epsilon_app/core/utils/app_constants.dart';

class ValidateUsername {
  ValidationStatus call(String username) {
    if (username.trim().isEmpty) {
      return ValidationStatus.emptyUsername;
    }
    if (username.length < AppConstants.usernameMinLength) {
      return ValidationStatus.shortUsername;
    }
    return ValidationStatus.valid;
  }
}
