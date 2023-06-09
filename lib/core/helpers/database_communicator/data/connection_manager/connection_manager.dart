// ignore_for_file: public_member_api_docs, sort_constructors_first, depend_on_referenced_packages
//

import 'package:dartz/dartz.dart';
import 'package:epsilon_app/core/extensions/platform_exception_extension.dart';
import 'package:flutter/services.dart';

import '../../domain/models/connection_params.dart';
import '../../domain/models/failures/sql_execution_failure.dart';

/// class create connection to remote sql server database
///
/// then execute any (sql statement) on that database
class ConnectionManager {
  static const platform = MethodChannel('coders.com/connect_database');

  /// check if a connection to remote database can be created
  ///
  /// if the creation was successfull it returns true
  /// if there was any error on creation connection it returns failure
  Future<bool> checkConnection({
    required ConnectionParams params,
  }) async {
    try {
      final Map<String, String> arguments = <String, String>{
        'host': params.host,
        'port': params.port,
        'database': params.database,
        'username': params.username,
        'password': params.password
      };

      final bool? methodResult =
          await platform.invokeMethod<bool>('checkConnection', arguments);

      if (methodResult != null) {
        return methodResult;
      } else {
        return false;
      }
    } on PlatformException catch (e) {
      throw e.toConnectionException();
    }
  }

  /// preform (sql statement) on a remote database
  ///
  /// when success it returns array of hash map as result
  /// when error it return failure
  Future<Either<SQLExecutionFailure, List<Map<String, String>>>>
      executeStatmet({
    required String query,
    required ConnectionParams params,
  }) async {
    // Isolate.
    try {
      final Map<String, String> arguments = <String, String>{
        'host': params.host,
        'port': params.port,
        'database': params.database,
        'username': params.username,
        'password': params.password,
        'query': query
      };

      final List<dynamic>? methodResult = await platform
          .invokeMethod<List<dynamic>>('executeSQLStatement', arguments);

      if (methodResult != null) {
        return Right(_decodeResult(methodResult));
      } else {
        return const Right([]);
      }
    } on PlatformException catch (e) {
      return left(e.toSQLExecutionFailure());
    }
  }

  static List<Map<String, String>> _decodeResult(List<dynamic>? result) {
    if (result != null) {
      final outcome =
          result.map((record) => Map<String, dynamic>.from(record)).toList();
      final other = outcome.map((e) {
        return e.map((key, value) => MapEntry(key, value?.toString() ?? ''));
      }).toList();
      return other;
    }
    return <Map<String, String>>[];
  }
}
