//

import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_connection_failure.freezed.dart';

@freezed
class CheckConnectionFailure with _$CheckConnectionFailure {
  factory CheckConnectionFailure.noInternt() = _NoInternt;
  factory CheckConnectionFailure.portFailure() = _PortFailure;
  factory CheckConnectionFailure.hostFailure() = _HostFailure;
  factory CheckConnectionFailure.databaseFailure() = _databaseFailure;
  factory CheckConnectionFailure.usernameOrPasswordFailure() =
      _UsernameOrPasswordFailure;
  factory CheckConnectionFailure.unExpected({required String message}) =
      _UnExpected;
}
