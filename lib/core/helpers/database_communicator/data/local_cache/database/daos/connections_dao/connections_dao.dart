//

import 'package:drift/drift.dart';
import 'package:epsilon_app/core/helpers/database_communicator/data/local_cache/database/entities/connection_entity.dart';

import '../../app_database.dart';

part 'connections_dao.g.dart';

@DriftAccessor(tables: [ConnectionEntity])
class ConnectionsDAO extends DatabaseAccessor<AppDatabase>
    with _$ConnectionsDAOMixin {
  ConnectionsDAO(AppDatabase db) : super(db);

  Future<int> _addConnection(ConnectionEntityCompanion connection) async {
    final id = await into(connectionEntity).insertOnConflictUpdate(connection);
    return id;
  }

  Future _clearProducts() async {
    await batch((batch) {
      batch.deleteAll(connectionEntity);
    });
  }

  Future<int> updateConnection(ConnectionEntityCompanion connection) async {
    await _clearProducts();
    return _addConnection(connection);
  }

  Future<ConnectionEntityData> getLastInUseOrNull() {
    return (select(connectionEntity)..limit(1)).getSingle();
  }
}
