// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'database_communicator.dart';

@immutable
abstract class DatabaseCommunicatorState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DatabaseCommunicatorEmptyState extends DatabaseCommunicatorState {}

class DatabaseCommunicatorLoading extends DatabaseCommunicatorState {}

class DatabaseCommunicatorSetParams extends DatabaseCommunicatorState {
  final String host;
  final String port;
  final String database;
  final String username;
  final String password;
  final Company company;
  DatabaseCommunicatorSetParams({
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

class DatabaseCommunicatorExecutionFailure extends DatabaseCommunicatorState {
  final Failure failure;
  DatabaseCommunicatorExecutionFailure({
    required this.failure,
  });
  @override
  List<Object?> get props => [failure];
}

class DatabaseCommunicatorCheckingFailure extends DatabaseCommunicatorState {
  final Failure failure;
  DatabaseCommunicatorCheckingFailure({
    required this.failure,
  });
  @override
  List<Object?> get props => [failure];
}

class DatabaseCommunicatorSuccess extends DatabaseCommunicatorState {
  final List<Map<String, String>> records;

  DatabaseCommunicatorSuccess({
    required this.records,
  });

  @override
  List<Object?> get props => [records];
}

class DatabaseCommunicatorConnectSuccessfully
    extends DatabaseCommunicatorState {}

class GettingProductWithSuccess extends DatabaseCommunicatorState {
  final ProductDetails product;

  GettingProductWithSuccess({
    required this.product,
  });

  @override
  List<Object?> get props => [product];
}
