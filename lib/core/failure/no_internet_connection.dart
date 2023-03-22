//

import 'package:epsilon_app/core/failure/failure.dart';
import 'package:epsilon_app/core/localization/language_constants.dart';
import 'package:flutter/src/widgets/framework.dart';

class NoInternetConnection extends Failure {
  @override
  String message(BuildContext context) =>
      Translator.translation(context).no_internet_connection;
}
