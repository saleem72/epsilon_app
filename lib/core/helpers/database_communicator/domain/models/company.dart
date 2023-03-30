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
}
