//

import 'package:dartz/dartz.dart';
import 'package:epsilon_app/core/helpers/database_communicator/domain/models/connection_params.dart';

import '../../../../../core/helpers/database_communicator/domain/models/failures/cached_connection_failure.dart';
import '../../../../../core/helpers/database_communicator/domain/models/failures/check_connection_failure.dart';

abstract class IConnectionConfigurationRepository {
  Future<Either<CheckConnectionFailure, bool>> checkConnection(
      ConnectionParams params);
  Future<Either<CachedConnectionFailure, ConnectionParams>>
      fetchCachedConnections();
}
