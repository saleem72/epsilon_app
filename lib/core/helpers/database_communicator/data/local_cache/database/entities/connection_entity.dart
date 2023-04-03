//

import 'package:drift/drift.dart';

class ConnectionEntity extends Table {
  @override
  String get tableName => 'connections';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get host => text()();
  TextColumn get port => text()();
  TextColumn get database => text()();
  TextColumn get username => text()();
  TextColumn get password => text()();
  IntColumn get company => integer()();
}

/*

 host: 'epsilondemo.dyndns.org',
        port: '1433',
        database: 'amndbtest1',
        username: 'sa',
        password: 'H123456789h',

class CategoryEntity extends Table {
  @override
  String get tableName => 'categories';

  IntColumn get id => integer()();
  TextColumn get name => text()();
  BoolColumn get isActive => boolean()();
  IntColumn get restaurantId => integer()();
  IntColumn get sort => integer()();
}
*/