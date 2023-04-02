// ignore_for_file: public_member_api_docs, sort_constructors_first
//

import 'package:equatable/equatable.dart';

import 'company.dart';

class ConnectionParams extends Equatable {
  final String host;
  final String port;
  final String database;
  final String username;
  final String password;
  final Company? company;

  const ConnectionParams({
    required this.host,
    required this.port,
    required this.database,
    required this.username,
    required this.password,
    this.company,
  });

  Map<String, String> toMap() {
    return <String, String>{
      'host': host,
      'port': port,
      'database': database,
      'username': username,
      'password': password,
    };
  }

  @override
  List<Object?> get props =>
      [host, port, database, username, password, company];
}

class ConnectionInfo {
  final int id;
  final bool lastInUse;
  final String host;
  final String port;
  final String database;
  final String username;
  final String password;
  final Company company;

  ConnectionInfo({
    required this.id,
    required this.lastInUse,
    required this.host,
    required this.port,
    required this.database,
    required this.username,
    required this.password,
    required this.company,
  });

  ConnectionParams get params => ConnectionParams(
        host: host,
        port: port,
        database: database,
        username: username,
        password: password,
        company: company,
      );
}
