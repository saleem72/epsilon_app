// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'connection_manager_bloc.dart';

@immutable
abstract class ConnectionManagerState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ConnectionManagerEmptyState extends ConnectionManagerState {}

class ConnectionManagerLoading extends ConnectionManagerState {}

class ConnectioManagerSetParams extends ConnectionManagerState {
  final String host;
  final String port;
  final String database;
  final String username;
  final String password;
  final Companies company;
  ConnectioManagerSetParams({
    required this.host,
    required this.port,
    required this.database,
    required this.username,
    required this.password,
    required this.company,
  });
  @override
  List<Object?> get props =>
      [host, port, database, username, password, company];
}

class ConnectionManagerExecutionFailure extends ConnectionManagerState {
  final Failure failure;
  ConnectionManagerExecutionFailure({
    required this.failure,
  });
  @override
  List<Object?> get props => [failure];
}

class ConnectionManagerCheckingFailure extends ConnectionManagerState {
  final Failure failure;
  ConnectionManagerCheckingFailure({
    required this.failure,
  });
  @override
  List<Object?> get props => [failure];
}

class ConnectionManagerSuccess extends ConnectionManagerState {
  final List<Map<String, String>> records;

  ConnectionManagerSuccess({
    required this.records,
  });

  @override
  List<Object?> get props => [records];
}

class ConnectionManagerConnectSuccessfully extends ConnectionManagerState {}
