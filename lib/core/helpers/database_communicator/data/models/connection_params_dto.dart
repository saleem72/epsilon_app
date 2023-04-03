//

import 'package:drift/drift.dart';
import 'package:epsilon_app/core/helpers/database_communicator/domain/models/connection_params.dart';

import '../../domain/models/company.dart';
import '../local_cache/database/app_database.dart';

class ConnectionParamsDTO {
  final String host;
  final String port;
  final String database;
  final String username;
  final String password;
  final Company? company;

  const ConnectionParamsDTO({
    required this.host,
    required this.port,
    required this.database,
    required this.username,
    required this.password,
    this.company,
  });

  factory ConnectionParamsDTO.fromDomain(ConnectionParams model) {
    return ConnectionParamsDTO(
      host: model.host,
      port: model.port,
      database: model.database,
      username: model.username,
      password: model.password,
      company: model.company,
    );
  }

  factory ConnectionParamsDTO.fromEntity(ConnectionEntityData model) {
    return ConnectionParamsDTO(
      host: model.host,
      port: model.port,
      database: model.database,
      username: model.username,
      password: model.password,
      company: Company.fromValue(model.company),
    );
  }

  ConnectionEntityCompanion toEntity() {
    return ConnectionEntityCompanion(
      host: Value(host),
      port: Value(port),
      database: Value(database),
      username: Value(username),
      password: Value(password),
      company: Value(company?.value ?? 0),
    );
  }

  ConnectionParams toDomain() {
    return ConnectionParams(
      host: host,
      port: port,
      database: database,
      username: username,
      password: password,
      company: company,
    );
  }
}
