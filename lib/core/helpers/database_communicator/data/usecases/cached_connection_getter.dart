//

import 'package:dartz/dartz.dart';

import '../../domain/models/connection_params.dart';
import '../../domain/models/failures/cached_connection_failure.dart';
import '../local_cache/database/app_database.dart';
import '../models/connection_params_dto.dart';

class CachedConnectionGetter {
  final AppDatabase _db;

  CachedConnectionGetter({
    required AppDatabase db,
  }) : _db = db;

  Future<Either<CachedConnectionFailure, ConnectionParams>> get() async {
    try {
      final connectionEntity = await _db.connectionsDAO.getLastInUseOrNull();
      final newParams =
          ConnectionParamsDTO.fromEntity(connectionEntity).toDomain();
      return Right(newParams);
    } catch (e) {
      return Left(CachedConnectionFailure.noCache());
    }
  }
}
