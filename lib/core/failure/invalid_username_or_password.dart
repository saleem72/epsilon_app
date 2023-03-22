//

import 'package:epsilon_app/core/failure/failure.dart';
import 'package:epsilon_app/core/localization/language_constants.dart';
import 'package:flutter/material.dart';

class InvalidUserNameOrPassword extends Failure {
  @override
  String message(BuildContext context) =>
      Translator.translation(context).invalid_username_or_password;
}
