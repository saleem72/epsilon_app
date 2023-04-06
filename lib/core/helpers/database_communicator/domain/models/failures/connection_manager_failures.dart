//

import 'package:epsilon_app/core/errors/failure/failure.dart';
import 'package:epsilon_app/core/helpers/localization/language_constants.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'connection_manager_failures.freezed.dart';

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
