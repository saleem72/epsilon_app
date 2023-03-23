//

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../helpers/localization/language_constants.dart';

abstract class Failure extends Equatable {
  String message(BuildContext context);

  @override
  List<Object?> get props => [];
}

/// failure returned by login service when the login credentials are invalid
class InvalidUserNameOrPassword extends Failure {
  @override
  String message(BuildContext context) =>
      Translator.translation(context).invalid_username_or_password;
}

/// failure occure when timeout or bad url or any related to connection
class ConnectionFailure extends Failure {
  @override
  String message(BuildContext context) {
    // TODO: implement message
    throw UnimplementedError();
  }
}

class NoInternetConnection extends Failure {
  @override
  String message(BuildContext context) =>
      Translator.translation(context).no_internet_connection;
}

class UnExpectedFailure extends Failure {
  final String error;
  UnExpectedFailure({
    required this.error,
  });
  @override
  String message(BuildContext context) {
    return '${Translator.translation(context).unexpected_failure}\n$error';
  }
}
