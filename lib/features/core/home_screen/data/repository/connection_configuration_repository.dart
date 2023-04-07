//

import 'package:epsilon_app/core/helpers/database_communicator/data/connection_manager/connection_manager.dart';
import 'package:epsilon_app/core/helpers/database_communicator/data/local_cache/database/app_database.dart';
import 'package:epsilon_app/core/helpers/network_info/network_info.dart';

import 'package:epsilon_app/core/helpers/database_communicator/domain/models/failures/check_connection_failure.dart';

import 'package:epsilon_app/core/helpers/database_communicator/domain/models/connection_params.dart';

import 'package:dartz/dartz.dart';

import '../../../../../core/errors/exceptions/sql_exception.dart';
import '../../../../../core/helpers/database_communicator/data/models/connection_params_dto.dart';
import '../../../../../core/helpers/database_communicator/data/usecases/cached_connection_getter.dart';
import '../../../../../core/helpers/database_communicator/domain/models/failures/cached_connection_failure.dart';
import '../../domain/repository/i_connection_configuration_repository.dart';

class ConnectionConfigurationRepository
    implements IConnectionConfigurationRepository {
  final NetworkInfo _networkInfo;
  final ConnectionManager _connectionManager;
  final AppDatabase _db;
  final CachedConnectionGetter _connectionGetter;

  ConnectionConfigurationRepository({
    required NetworkInfo networkInfo,
    required ConnectionManager connectionManager,
    required CachedConnectionGetter connectionGetter,
    required AppDatabase db,
  })  : _networkInfo = networkInfo,
        _connectionManager = connectionManager,
        _db = db,
        _connectionGetter = connectionGetter;

  @override
  Future<Either<CheckConnectionFailure, bool>> checkConnection(
      ConnectionParams params) async {
    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      return Left(CheckConnectionFailure.noInternt());
    }

    try {
      final _ = await _connectionManager.checkConnection(params: params);
      final connectionEntity =
          ConnectionParamsDTO.fromDomain(params).toEntity();
      _db.connectionsDAO.updateConnection(connectionEntity);
      return const Right(true);
    } on InvalidConnectionHostException {
      return Left(CheckConnectionFailure.hostFailure());
    } on InvalidConnectionPortException {
      return Left(CheckConnectionFailure.portFailure());
    } on InvalidConnectionDatabaseException {
      return Left(CheckConnectionFailure.databaseFailure());
    } on InvalidConnectionUsernameOrPasswordException {
      return Left(CheckConnectionFailure.usernameOrPasswordFailure());
    } catch (e) {
      return Left(CheckConnectionFailure.unExpected(message: e.toString()));
    }
  }

  @override
  Future<Either<CachedConnectionFailure, ConnectionParams>>
      fetchCachedConnections() async {
    return await _connectionGetter.get();
  }
}
