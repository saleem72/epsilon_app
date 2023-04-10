//

import 'dart:math';

import 'package:flutter/services.dart';

import '../errors/exceptions/sql_exception.dart';
import '../helpers/database_communicator/domain/models/failures/sql_execution_failure.dart';

extension ConnectionExceptionStrings on PlatformException {
  SQLException toConnectionException() {
    if ((message ?? '').startsWith('The syntax of the connection URL')) {
      return InvalidConnectionPortException();
    }
    if ((message ?? '').startsWith('Unknown server host name')) {
      return InvalidConnectionHostException();
    }
    if ((message ?? '').startsWith('Cannot open database')) {
      return InvalidConnectionDatabaseException();
    }
    if ((message ?? '').startsWith('Login failed for user')) {
      return InvalidConnectionUsernameOrPasswordException();
    }
    if ((message ?? '').startsWith('Could not find stored procedure')) {
      return SQLSyntaxException(message);
    }
    if ((message ?? '').startsWith('Incorrect syntax near')) {
      return SQLSyntaxException(message);
    }

    return UnExpectedConnectionException(message);
  }

  SQLExecutionFailure toSQLExecutionFailure() {
    print(message);
    if ((message ?? '').startsWith('The syntax of the connection URL')) {
      return SQLExecutionFailure.connectionFailure();
    }
    if ((message ?? '').startsWith('Unknown server host name')) {
      return SQLExecutionFailure.connectionFailure();
    }
    if ((message ?? '').startsWith('Cannot open database')) {
      return SQLExecutionFailure.connectionFailure();
    }
    if ((message ?? '').startsWith('Login failed for user')) {
      return SQLExecutionFailure.connectionFailure();
    }
    if ((message ?? '').startsWith('Could not find stored procedure')) {
      return SQLExecutionFailure.syntaxFailure();
    }
    if ((message ?? '').startsWith('Incorrect syntax near')) {
      return SQLExecutionFailure.syntaxFailure();
    }

    return SQLExecutionFailure.unExpected(message: message ?? '');
  }
}
