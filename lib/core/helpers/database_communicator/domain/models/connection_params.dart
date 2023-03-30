//

import 'company.dart';

class ConnectionParams {
  final String host;
  final String port;
  final String database;
  final String username;
  final String password;
  final Company? company;

  ConnectionParams({
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
}
