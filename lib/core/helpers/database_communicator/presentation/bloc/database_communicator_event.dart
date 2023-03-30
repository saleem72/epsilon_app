// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'database_communicator.dart';

@immutable
abstract class DatabaseCommunicatorEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class DatabaseCommunicatorHostHasChange extends DatabaseCommunicatorEvent {
  final String host;

  DatabaseCommunicatorHostHasChange({
    required this.host,
  });

  @override
  List<Object?> get props => [host];
}

class DatabaseCommunicatorPortHasChange extends DatabaseCommunicatorEvent {
  final String port;

  DatabaseCommunicatorPortHasChange({
    required this.port,
  });

  @override
  List<Object?> get props => [port];
}

class DatabaseCommunicatorDatabaseNameHasChange
    extends DatabaseCommunicatorEvent {
  final String database;

  DatabaseCommunicatorDatabaseNameHasChange({
    required this.database,
  });

  @override
  List<Object?> get props => [database];
}

class DatabaseCommunicatorUsernameHasChange extends DatabaseCommunicatorEvent {
  final String username;

  DatabaseCommunicatorUsernameHasChange({
    required this.username,
  });

  @override
  List<Object?> get props => [username];
}

class DatabaseCommunicatorPasswordHasChange extends DatabaseCommunicatorEvent {
  final String password;

  DatabaseCommunicatorPasswordHasChange({
    required this.password,
  });

  @override
  List<Object?> get props => [password];
}

class DatabaseCommunicatorCompanyHasChange extends DatabaseCommunicatorEvent {
  final Company company;

  DatabaseCommunicatorCompanyHasChange({
    required this.company,
  });

  @override
  List<Object?> get props => [company];
}

class GetProductByBarCode extends DatabaseCommunicatorEvent {
  final String barcode;

  GetProductByBarCode({required this.barcode});

  @override
  List<Object?> get props => [barcode];
}

class GetProductBySerial extends DatabaseCommunicatorEvent {
  final String serial;

  GetProductBySerial({required this.serial});

  @override
  List<Object?> get props => [serial];
}

class DatabaseCommunicatorCheckConnection extends DatabaseCommunicatorEvent {}

class DatabaseCommunicatorFetchConnections extends DatabaseCommunicatorEvent {}

class DatabaseCommunicatorClearError extends DatabaseCommunicatorEvent {}
