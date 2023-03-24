//

import 'package:epsilon_app/core/helpers/localization/language_constants.dart';
import 'package:flutter/material.dart';

enum Companies {
  epsilon,
  alameen,
  almanarah;

  String title(BuildContext context) {
    switch (this) {
      case Companies.epsilon:
        return Translator.translation(context).epsilon;
      case Companies.alameen:
        return Translator.translation(context).alameen;
      case Companies.almanarah:
        return Translator.translation(context).almanarah;
    }
  }
}
