import 'package:epsilon_app/core/failure/failure.dart';
import 'package:epsilon_app/core/localization/language_constants.dart';
import 'package:flutter/src/widgets/framework.dart';

class GeneralFailure extends Failure {
  final String error;

  GeneralFailure({required this.error});

  @override
  String message(BuildContext context) {
    return Translator.translation(context).general_failure;
  }
}
