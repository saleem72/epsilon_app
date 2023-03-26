//

import 'package:epsilon_app/core/errors/failure/failure.dart';
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
    // TODO: implement message
    throw UnimplementedError();
  }

  @override
  List<Object?> get props => [error];
}
