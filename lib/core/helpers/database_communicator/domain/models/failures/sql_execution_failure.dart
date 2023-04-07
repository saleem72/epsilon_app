//

import 'package:freezed_annotation/freezed_annotation.dart';

part 'sql_execution_failure.freezed.dart';

@freezed
class SQLExecutionFailure with _$SQLExecutionFailure {
  factory SQLExecutionFailure.noInternt() = _NoInternt;
  factory SQLExecutionFailure.connectionFailure() = _ConnectionFailure;
  factory SQLExecutionFailure.syntaxFailure() = _SyntaxFailure;
  factory SQLExecutionFailure.unExpected({required String message}) =
      _UnExpected;
}
