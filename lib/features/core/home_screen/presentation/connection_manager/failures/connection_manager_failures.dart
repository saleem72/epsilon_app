//

import 'package:epsilon_app/core/errors/failure/failure.dart';
import 'package:epsilon_app/core/helpers/localization/language_constants.dart';
import 'package:flutter/src/widgets/framework.dart';

class EmptyQueryFailure extends Failure {
  @override
  String message(BuildContext context) {
    // TODO: implement message
    throw UnimplementedError();
  }
}

class ConnectionUnExpectedFailure extends Failure {
  @override
  String message(BuildContext context) {
    // TODO: implement message
    throw UnimplementedError();
  }
}

class ConnectionFailureWithError extends Failure {
  final String error;

  ConnectionFailureWithError({required this.error});

  @override
  String message(BuildContext context) {
    return '${Translator.translation(context).fail_to_connect_db}\n$error';
  }

  @override
  List<Object?> get props => [error];

  @override
  String toString() {
    return error;
  }
}

class ConnectionManagerFailToConnect extends Failure {
  final String? error;

  ConnectionManagerFailToConnect({this.error});

  @override
  String message(BuildContext context) {
    return Translator.translation(context).fail_to_connect_db;
  }

  @override
  List<Object?> get props => [error];

  @override
  String toString() {
    return error ?? 'Unexpected error';
  }
}
