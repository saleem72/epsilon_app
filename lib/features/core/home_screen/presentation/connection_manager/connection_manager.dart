// ignore_for_file: public_member_api_docs, sort_constructors_first, depend_on_referenced_packages
//

import 'package:flutter/services.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure/failure.dart';
import 'failures/connection_manager_failures.dart';
import 'models/connection_params.dart';

class ConnectionManager {
  static const platform = MethodChannel('coders.com/connect_database');

  Future<Either<ConnectionFailureWithError, bool>> checkConnection({
    required ConnectionParams params,
  }) async {
    try {
      print('ConnectionManager: checkConnection');
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
        return Right(methodResult);
      } else {
        return const Right(false);
      }
    } on PlatformException catch (e) {
      return Left(ConnectionFailureWithError(error: e.message ?? ''));
    } catch (error) {
      return Left(ConnectionFailureWithError(error: error.toString()));
    }
  }

  Future<Either<ConnectionFailureWithError, List<Map<String, String>>>>
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
      return Left(ConnectionFailureWithError(error: e.message ?? ''));
    } catch (error) {
      return Left(ConnectionFailureWithError(error: error.toString()));
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
} // SELECT * FROM mt000
