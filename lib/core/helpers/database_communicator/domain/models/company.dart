//

import 'package:epsilon_app/core/helpers/localization/language_constants.dart';
import 'package:flutter/material.dart';

enum Company {
  epsilon,
  alameen,
  almanarah;

  String title(BuildContext context) {
    switch (this) {
      case Company.epsilon:
        return Translator.translation(context).epsilon;
      case Company.alameen:
        return Translator.translation(context).alameen;
      case Company.almanarah:
        return Translator.translation(context).almanarah;
    }
  }

  int get value {
    switch (this) {
      case Company.epsilon:
        return 1;
      case Company.alameen:
        return 2;
      case Company.almanarah:
        return 3;
    }
  }

  factory Company.fromValue(int value) {
    switch (value) {
      case 1:
        return Company.epsilon;
      case 2:
        return Company.alameen;
      case 3:
        return Company.almanarah;
      default:
        return Company.epsilon;
    }
  }
}
