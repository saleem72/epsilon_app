// ignore_for_file: depend_on_referenced_packages, invalid_use_of_visible_for_testing_member

import 'dart:isolate';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:epsilon_app/features/core/home_screen/domain/models/companies.dart';
import 'package:epsilon_app/features/core/home_screen/presentation/connection_manager/failures/connection_manager_failures.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../core/errors/failure/failure.dart';
import '../connection_helper.dart';
import '../connection_manager.dart';
import '../models/connection_params.dart';

part 'connection_manager_event.dart';
part 'connection_manager_state.dart';

/*
        host: 'epsilondemo.dyndns.org',
        port: '1433',
        database: 'amndbtest1',
        username: 'sa',
        password: 'H123456789h',
        query:
            "select mm.code as code,mm.Name as name ,mm.enduser a,mm.unity as unit1 , mm.unit2 as unit2 , mm.enduser2 as enduser2, bb.barcode as barcode , bb.matunit as unit , st.name as st_name ,bm.name as bm_name from mt000 mm inner join MatExBarcode000 bb on mm.guid=bb.Matguid inner join ms000 ms on ms.matguid=mm.guid inner join st000 st on st.guid=ms.StoreGUID left join bm000 bm on bm.guid=mm.PictureGUID where bb.BarCode='1002002'",
        connectionManager: ConnectionManager(),
*/

class ConnectionManagerBloc
    extends Bloc<ConnectionManagerEvent, ConnectionManagerState> {
  String host = '';
  String port = '';
  String database = '';
  String username = '';
  String password = '';
  String query = '';
  Companies? company;

  static const platform = MethodChannel('coders.com/connect_database');

  final ConnectionManager _connectionManager;

  ConnectionManagerBloc({
    required ConnectionManager connectionManager,
  })  : _connectionManager = connectionManager,
        super(ConnectionManagerInitial()) {
    on<ConnectionManagerHostHasChange>(_onHostHasChange);
    on<ConnectionManagerPortHasChange>(_onPortHasChange);
    on<ConnectionManagerDatabaseHasChange>(_onDatabaseHasChange);
    on<ConnectionManagerUsernameHasChange>(_onUsernameHasChange);
    on<ConnectionManagerPasswordHasChange>(_onPasswordHasChange);
    on<ConnectionManagerCompanyHasChange>(_onCompanyHasChange);
    on<ConnectionManagerConnect>(_onConnect);
    on<ConnectionManagerIsolatedConnect>(_onIsolatedConnect);
    on<ConnetionManagerFetchConnections>(_onFetchConnections);
  }

  _onFetchConnections(ConnetionManagerFetchConnections event,
      Emitter<ConnectionManagerState> emit) {
    host = 'epsilondemo.dyndns.org';
    port = '1433';
    database = 'amndbtest1';
    username = 'sa';
    password = 'H123456789h';
    company = Companies.alameen;
    emit(
      ConnectioManagerSetParams(
        host: host,
        port: port,
        database: database,
        username: username,
        password: password,
        company: company!,
      ),
    );
  }

  _onPasswordHasChange(ConnectionManagerPasswordHasChange event,
      Emitter<ConnectionManagerState> emit) {
    password = event.password;
  }

  _onCompanyHasChange(ConnectionManagerCompanyHasChange event,
      Emitter<ConnectionManagerState> emit) {
    company = event.company;
  }

  _onUsernameHasChange(ConnectionManagerUsernameHasChange event,
      Emitter<ConnectionManagerState> emit) {
    username = event.username;
  }

  _onDatabaseHasChange(ConnectionManagerDatabaseHasChange event,
      Emitter<ConnectionManagerState> emit) {
    database = event.database;
  }

  _onHostHasChange(ConnectionManagerHostHasChange event,
      Emitter<ConnectionManagerState> emit) {
    host = event.host;
  }

  _onPortHasChange(ConnectionManagerPortHasChange event,
      Emitter<ConnectionManagerState> emit) {
    port = event.port;
  }

  void _onConnect(ConnectionManagerConnect event,
      Emitter<ConnectionManagerState> emit) async {
    if (query.isEmpty) {
      emit(
        ConnectionManagerFailure(
          failure: EmptyQueryFailure(),
        ),
      );
      return;
    }
    emit(ConnectionManagerLoading());

    final params = ConnectionParams(
      host: host,
      port: port,
      database: database,
      username: username,
      password: password,
      query: query,
    );
    final result =
        await _connectionManager.connect(query: query, params: params);
    result.fold(
      (failure) {
        emit(ConnectionManagerFailure(failure: failure));
      },
      (records) {
        emit(ConnectionManagerSuccess(records: records));
      },
    );
  }

  void _onIsolatedConnect(ConnectionManagerIsolatedConnect event,
      Emitter<ConnectionManagerState> emit) async {
    if (query.isEmpty) {
      emit(ConnectionManagerFailure(failure: EmptyQueryFailure()));
      return;
    }
    emit(ConnectionManagerLoading());

    final params = ConnectionParams(
      host: host,
      port: port,
      database: database,
      username: username,
      password: password,
      query: query,
    );

    ReceivePort receivePort = ReceivePort();

    final Map<String, String> arguments = <String, String>{
      'host': params.host,
      'port': params.port,
      'database': params.database,
      'username': params.username,
      'password': params.password,
      'query': query
    };
    WidgetsFlutterBinding.ensureInitialized();
    DartPluginRegistrant.ensureInitialized();
    final isolate = await Isolate.spawn(
      ConnectionHelper.executeSql,
      [receivePort.sendPort, platform, arguments],
    );

    final isolateResult = await receivePort.first;

    isolate.kill(priority: Isolate.immediate);
    if (isolateResult is List<Map<String, String>>) {
      emit(ConnectionManagerSuccess(records: isolateResult));
    } else if (isolateResult is Failure) {
      print(isolateResult.message);
      emit(ConnectionManagerFailure(failure: isolateResult));
    } else {
      emit(ConnectionManagerFailure(failure: ConnectionUnExpectedFailure()));
    }
  }
}
