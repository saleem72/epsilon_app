// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'connection_manager_bloc.dart';

@immutable
abstract class ConnectionManagerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ConnectionManagerHostHasChange extends ConnectionManagerEvent {
  final String host;

  ConnectionManagerHostHasChange({
    required this.host,
  });

  @override
  List<Object?> get props => [host];
}

class ConnectionManagerPortHasChange extends ConnectionManagerEvent {
  final String port;

  ConnectionManagerPortHasChange({
    required this.port,
  });

  @override
  List<Object?> get props => [port];
}

class ConnectionManagerDatabaseHasChange extends ConnectionManagerEvent {
  final String database;

  ConnectionManagerDatabaseHasChange({
    required this.database,
  });

  @override
  List<Object?> get props => [database];
}

class ConnectionManagerUsernameHasChange extends ConnectionManagerEvent {
  final String username;

  ConnectionManagerUsernameHasChange({
    required this.username,
  });

  @override
  List<Object?> get props => [username];
}

class ConnectionManagerPasswordHasChange extends ConnectionManagerEvent {
  final String password;

  ConnectionManagerPasswordHasChange({
    required this.password,
  });

  @override
  List<Object?> get props => [password];
}

class ConnectionManagerQueryHasChange extends ConnectionManagerEvent {
  final String query;

  ConnectionManagerQueryHasChange({
    required this.query,
  });

  @override
  List<Object?> get props => [query];
}

class ConnectionManagerCompanyHasChange extends ConnectionManagerEvent {
  final Companies company;

  ConnectionManagerCompanyHasChange({
    required this.company,
  });

  @override
  List<Object?> get props => [company];
}

class ConnectionManagerConnect extends ConnectionManagerEvent {}

class ConnectionManagerIsolatedConnect extends ConnectionManagerEvent {}

class ConnetionManagerFetchConnections extends ConnectionManagerEvent {}
