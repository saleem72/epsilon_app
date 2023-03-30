// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'database_provider.dart';

@immutable
abstract class DatabaseProviderEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class DatabaseProviderHostHasChange extends DatabaseProviderEvent {
  final String host;

  DatabaseProviderHostHasChange({
    required this.host,
  });

  @override
  List<Object?> get props => [host];
}

class DatabaseProviderPortHasChange extends DatabaseProviderEvent {
  final String port;

  DatabaseProviderPortHasChange({
    required this.port,
  });

  @override
  List<Object?> get props => [port];
}

class DatabaseProviderDatabaseNameHasChange extends DatabaseProviderEvent {
  final String database;

  DatabaseProviderDatabaseNameHasChange({
    required this.database,
  });

  @override
  List<Object?> get props => [database];
}

class DatabaseProviderUsernameHasChange extends DatabaseProviderEvent {
  final String username;

  DatabaseProviderUsernameHasChange({
    required this.username,
  });

  @override
  List<Object?> get props => [username];
}

class DatabaseProviderPasswordHasChange extends DatabaseProviderEvent {
  final String password;

  DatabaseProviderPasswordHasChange({
    required this.password,
  });

  @override
  List<Object?> get props => [password];
}

class DatabaseProviderQueryHasChange extends DatabaseProviderEvent {
  final String query;

  DatabaseProviderQueryHasChange({
    required this.query,
  });

  @override
  List<Object?> get props => [query];
}

class DatabaseProviderCompanyHasChange extends DatabaseProviderEvent {
  final Companies company;

  DatabaseProviderCompanyHasChange({
    required this.company,
  });

  @override
  List<Object?> get props => [company];
}

class GetProductByBarCode extends DatabaseProviderEvent {
  final String barcode;

  GetProductByBarCode({required this.barcode});

  @override
  List<Object?> get props => [barcode];
}

class GetProductBySerial extends DatabaseProviderEvent {
  final String serial;

  GetProductBySerial({required this.serial});

  @override
  List<Object?> get props => [serial];
}

class DatabaseProviderCheckConnection extends DatabaseProviderEvent {}

class DatabaseProviderFetchConnections extends DatabaseProviderEvent {}

class DatabaseProviderClearError extends DatabaseProviderEvent {}
