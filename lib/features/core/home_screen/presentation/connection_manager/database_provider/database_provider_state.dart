// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'database_provider.dart';

@immutable
abstract class DatabaseProviderState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DatabaseProviderEmptyState extends DatabaseProviderState {}

class DatabaseProviderLoading extends DatabaseProviderState {}

class DatabaseProviderSetParams extends DatabaseProviderState {
  final String host;
  final String port;
  final String database;
  final String username;
  final String password;
  final Companies company;
  DatabaseProviderSetParams({
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

class DatabaseProviderExecutionFailure extends DatabaseProviderState {
  final Failure failure;
  DatabaseProviderExecutionFailure({
    required this.failure,
  });
  @override
  List<Object?> get props => [failure];
}

class DatabaseProviderCheckingFailure extends DatabaseProviderState {
  final Failure failure;
  DatabaseProviderCheckingFailure({
    required this.failure,
  });
  @override
  List<Object?> get props => [failure];
}

class DatabaseProviderSuccess extends DatabaseProviderState {
  final List<Map<String, String>> records;

  DatabaseProviderSuccess({
    required this.records,
  });

  @override
  List<Object?> get props => [records];
}

class DatabaseProviderConnectSuccessfully extends DatabaseProviderState {}

class GettingProductWithSuccess extends DatabaseProviderState {
  final ProductDetails product;

  GettingProductWithSuccess({
    required this.product,
  });

  @override
  List<Object?> get props => [product];
}
