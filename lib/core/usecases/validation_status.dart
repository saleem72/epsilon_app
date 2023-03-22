//

import 'package:epsilon_app/core/localization/language_constants.dart';
import 'package:flutter/material.dart';

enum ValidationStatus {
  valid,
  emptyUsername,
  shortUsername,
  emptyPassword,
  shortPassword;

  String message(BuildContext context) {
    switch (this) {
      case ValidationStatus.valid:
        return '';
      case ValidationStatus.emptyUsername:
        return Translator.translation(context).empty_username;
      case ValidationStatus.shortUsername:
        return Translator.translation(context).short_username;
      case ValidationStatus.emptyPassword:
        return Translator.translation(context).empty_password;
      case ValidationStatus.shortPassword:
        return Translator.translation(context).short_password;
    }
  }
}
