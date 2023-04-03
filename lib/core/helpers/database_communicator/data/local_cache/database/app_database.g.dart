// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ConnectionEntityTable extends ConnectionEntity
    with TableInfo<$ConnectionEntityTable, ConnectionEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConnectionEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _hostMeta = const VerificationMeta('host');
  @override
  late final GeneratedColumn<String> host = GeneratedColumn<String>(
      'host', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _portMeta = const VerificationMeta('port');
  @override
  late final GeneratedColumn<String> port = GeneratedColumn<String>(
      'port', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _databaseMeta =
      const VerificationMeta('database');
  @override
  late final GeneratedColumn<String> database = GeneratedColumn<String>(
      'database', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _companyMeta =
      const VerificationMeta('company');
  @override
  late final GeneratedColumn<int> company = GeneratedColumn<int>(
      'company', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, host, port, database, username, password, company];
  @override
  String get aliasedName => _alias ?? 'connections';
  @override
  String get actualTableName => 'connections';
  @override
  VerificationContext validateIntegrity(
      Insertable<ConnectionEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('host')) {
      context.handle(
          _hostMeta, host.isAcceptableOrUnknown(data['host']!, _hostMeta));
    } else if (isInserting) {
      context.missing(_hostMeta);
    }
    if (data.containsKey('port')) {
      context.handle(
          _portMeta, port.isAcceptableOrUnknown(data['port']!, _portMeta));
    } else if (isInserting) {
      context.missing(_portMeta);
    }
    if (data.containsKey('database')) {
      context.handle(_databaseMeta,
          database.isAcceptableOrUnknown(data['database']!, _databaseMeta));
    } else if (isInserting) {
      context.missing(_databaseMeta);
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('company')) {
      context.handle(_companyMeta,
          company.isAcceptableOrUnknown(data['company']!, _companyMeta));
    } else if (isInserting) {
      context.missing(_companyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ConnectionEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ConnectionEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      host: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}host'])!,
      port: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}port'])!,
      database: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}database'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
      company: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}company'])!,
    );
  }

  @override
  $ConnectionEntityTable createAlias(String alias) {
    return $ConnectionEntityTable(attachedDatabase, alias);
  }
}

class ConnectionEntityData extends DataClass
    implements Insertable<ConnectionEntityData> {
  final int id;
  final String host;
  final String port;
  final String database;
  final String username;
  final String password;
  final int company;
  const ConnectionEntityData(
      {required this.id,
      required this.host,
      required this.port,
      required this.database,
      required this.username,
      required this.password,
      required this.company});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['host'] = Variable<String>(host);
    map['port'] = Variable<String>(port);
    map['database'] = Variable<String>(database);
    map['username'] = Variable<String>(username);
    map['password'] = Variable<String>(password);
    map['company'] = Variable<int>(company);
    return map;
  }

  ConnectionEntityCompanion toCompanion(bool nullToAbsent) {
    return ConnectionEntityCompanion(
      id: Value(id),
      host: Value(host),
      port: Value(port),
      database: Value(database),
      username: Value(username),
      password: Value(password),
      company: Value(company),
    );
  }

  factory ConnectionEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ConnectionEntityData(
      id: serializer.fromJson<int>(json['id']),
      host: serializer.fromJson<String>(json['host']),
      port: serializer.fromJson<String>(json['port']),
      database: serializer.fromJson<String>(json['database']),
      username: serializer.fromJson<String>(json['username']),
      password: serializer.fromJson<String>(json['password']),
      company: serializer.fromJson<int>(json['company']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'host': serializer.toJson<String>(host),
      'port': serializer.toJson<String>(port),
      'database': serializer.toJson<String>(database),
      'username': serializer.toJson<String>(username),
      'password': serializer.toJson<String>(password),
      'company': serializer.toJson<int>(company),
    };
  }

  ConnectionEntityData copyWith(
          {int? id,
          String? host,
          String? port,
          String? database,
          String? username,
          String? password,
          int? company}) =>
      ConnectionEntityData(
        id: id ?? this.id,
        host: host ?? this.host,
        port: port ?? this.port,
        database: database ?? this.database,
        username: username ?? this.username,
        password: password ?? this.password,
        company: company ?? this.company,
      );
  @override
  String toString() {
    return (StringBuffer('ConnectionEntityData(')
          ..write('id: $id, ')
          ..write('host: $host, ')
          ..write('port: $port, ')
          ..write('database: $database, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('company: $company')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, host, port, database, username, password, company);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ConnectionEntityData &&
          other.id == this.id &&
          other.host == this.host &&
          other.port == this.port &&
          other.database == this.database &&
          other.username == this.username &&
          other.password == this.password &&
          other.company == this.company);
}

class ConnectionEntityCompanion extends UpdateCompanion<ConnectionEntityData> {
  final Value<int> id;
  final Value<String> host;
  final Value<String> port;
  final Value<String> database;
  final Value<String> username;
  final Value<String> password;
  final Value<int> company;
  const ConnectionEntityCompanion({
    this.id = const Value.absent(),
    this.host = const Value.absent(),
    this.port = const Value.absent(),
    this.database = const Value.absent(),
    this.username = const Value.absent(),
    this.password = const Value.absent(),
    this.company = const Value.absent(),
  });
  ConnectionEntityCompanion.insert({
    this.id = const Value.absent(),
    required String host,
    required String port,
    required String database,
    required String username,
    required String password,
    required int company,
  })  : host = Value(host),
        port = Value(port),
        database = Value(database),
        username = Value(username),
        password = Value(password),
        company = Value(company);
  static Insertable<ConnectionEntityData> custom({
    Expression<int>? id,
    Expression<String>? host,
    Expression<String>? port,
    Expression<String>? database,
    Expression<String>? username,
    Expression<String>? password,
    Expression<int>? company,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (host != null) 'host': host,
      if (port != null) 'port': port,
      if (database != null) 'database': database,
      if (username != null) 'username': username,
      if (password != null) 'password': password,
      if (company != null) 'company': company,
    });
  }

  ConnectionEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? host,
      Value<String>? port,
      Value<String>? database,
      Value<String>? username,
      Value<String>? password,
      Value<int>? company}) {
    return ConnectionEntityCompanion(
      id: id ?? this.id,
      host: host ?? this.host,
      port: port ?? this.port,
      database: database ?? this.database,
      username: username ?? this.username,
      password: password ?? this.password,
      company: company ?? this.company,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (host.present) {
      map['host'] = Variable<String>(host.value);
    }
    if (port.present) {
      map['port'] = Variable<String>(port.value);
    }
    if (database.present) {
      map['database'] = Variable<String>(database.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (company.present) {
      map['company'] = Variable<int>(company.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConnectionEntityCompanion(')
          ..write('id: $id, ')
          ..write('host: $host, ')
          ..write('port: $port, ')
          ..write('database: $database, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('company: $company')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $ConnectionEntityTable connectionEntity =
      $ConnectionEntityTable(this);
  late final ConnectionsDAO connectionsDAO =
      ConnectionsDAO(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [connectionEntity];
}
