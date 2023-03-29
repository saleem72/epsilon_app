// ignore_for_file: depend_on_referenced_packages, invalid_use_of_visible_for_testing_member

import 'dart:convert';
import 'dart:isolate';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:epsilon_app/core/extensions/map_string_string_extension.dart';
import 'package:epsilon_app/features/core/home_screen/domain/models/companies.dart';
import 'package:epsilon_app/features/core/home_screen/presentation/connection_manager/failures/connection_manager_failures.dart';
import 'package:epsilon_app/features/core/home_screen/presentation/connection_manager/models/sql_statements.dart';
import 'package:epsilon_app/features/core/subject_details_screen/models/product_datails.dart';
import 'package:epsilon_app/features/core/subject_details_screen/usecases/product_details_mapper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../core/errors/failure/failure.dart';
import '../../../data/connection_manager/connection_manager.dart';
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
  final ProductDetailsMapper _productDetailsMapper;

  ConnectionManagerBloc({
    required ConnectionManager connectionManager,
    required ProductDetailsMapper productDetailsMapper,
  })  : _connectionManager = connectionManager,
        _productDetailsMapper = productDetailsMapper,
        super(ConnectionManagerEmptyState()) {
    on<ConnectionManagerHostHasChange>(_onHostHasChange);
    on<ConnectionManagerPortHasChange>(_onPortHasChange);
    on<ConnectionManagerDatabaseHasChange>(_onDatabaseHasChange);
    on<ConnectionManagerUsernameHasChange>(_onUsernameHasChange);
    on<ConnectionManagerPasswordHasChange>(_onPasswordHasChange);
    on<ConnectionManagerCompanyHasChange>(_onCompanyHasChange);
    on<ConnectionManagerExecuteStatment>(_onExecuteStatment);
    on<ConnetionManagerFetchConnections>(_onFetchConnections);
    on<ConnectionManagerQueryHasChange>(_onQueryHasChange);
    on<ConnectionManagerCheckConnection>(_onCheckConnection);
    on<ConnetionManagerClearError>(_onClearError);
    on<GetProductBySerial>(_onGetProductBySerial);
    on<GetProductByBarCode>(_onGetProductByBarCode);
  }

  _onGetProductByBarCode(
      GetProductByBarCode event, Emitter<ConnectionManagerState> emit) async {
    query = SQLStatements.statementForBarcode(event.barcode);
    emit(ConnectionManagerLoading());
    final result = await _preformStatment();
    result.fold(
      (failure) {
        emit(ConnectionManagerExecutionFailure(failure: failure));
      },
      (records) {
        final mappingResult = _productDetailsMapper(records);
        mappingResult.fold((failure) {
          emit(ConnectionManagerExecutionFailure(failure: failure));
        }, (product) {
          emit(GettingProductWithSuccess(product: product));
        });
      },
    );
  }

  _onGetProductBySerial(
      GetProductBySerial event, Emitter<ConnectionManagerState> emit) async {
    query = SQLStatements.statementForSerial(event.serial);
    emit(ConnectionManagerLoading());
    final result = await _preformStatment();
    result.fold(
      (failure) {
        emit(ConnectionManagerExecutionFailure(failure: failure));
      },
      (records) {
        final mappingResult = _productDetailsMapper(records);
        mappingResult.fold((failure) {
          emit(ConnectionManagerExecutionFailure(failure: failure));
        }, (product) {
          emit(GettingProductWithSuccess(product: product));
        });
      },
    );
  }

  _onClearError(
      ConnetionManagerClearError event, Emitter<ConnectionManagerState> emit) {
    emit(ConnectionManagerEmptyState());
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

  _onQueryHasChange(ConnectionManagerQueryHasChange event,
      Emitter<ConnectionManagerState> emit) {
    query = event.query;
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

  _onCheckConnection(ConnectionManagerCheckConnection event,
      Emitter<ConnectionManagerState> emit) async {
    print('_onCheckConnection');
    emit(ConnectionManagerLoading());

    final params = ConnectionParams(
      host: host,
      port: port,
      database: database,
      username: username,
      password: password,
      query: query,
    );
    final result = await _connectionManager.checkConnection(params: params);
    result.fold(
      (failure) {
        print(failure.toString);
        emit(ConnectionManagerCheckingFailure(
            failure: ConnectionManagerFailToConnect(error: failure.error)));
      },
      (success) {
        if (success) {
          emit(ConnectionManagerConnectSuccessfully());
        } else {
          emit(ConnectionManagerCheckingFailure(
              failure: ConnectionManagerFailToConnect()));
        }
      },
    );
  }

  void _onExecuteStatment(ConnectionManagerExecuteStatment event,
      Emitter<ConnectionManagerState> emit) async {
    query = event.query;
    emit(ConnectionManagerLoading());

    final result = await _preformStatment();
    result.fold(
      (failure) {
        print(failure.toString());
        emit(ConnectionManagerExecutionFailure(failure: failure));
      },
      (records) {
        for (final rec in records) {
          rec.beautify();
        }
        emit(ConnectionManagerSuccess(records: records));
      },
    );
  }

  Future<Either<ConnectionFailureWithError, List<Map<String, String>>>>
      _preformStatment() async {
    final params = ConnectionParams(
      host: host,
      port: port,
      database: database,
      username: username,
      password: password,
      query: query,
    );
    return await _connectionManager.executeStatmet(
        query: query, params: params);
  }
}

const temp = [
  {
    "barcode": "*****134",
    "code": "020501038",
    "Name": "طقم طاولات جيكون لويكنز تركي جوزي"
  },
  {"barcode": "*****74", "code": "020502006", "Name": "طقم طربيزات جلد"},
  {"barcode": "****1313", "code": "020501021", "Name": "طقم طاولات جلد وطني"},
  {
    "barcode": "****312",
    "code": "0115071",
    "Name": "شفاط 90 سنتم ايطالي اسود elica concord - WR"
  },
  {
    "barcode": "****36",
    "code": "020501108",
    "Name": "طقم طاولات اجر مضفرة وطني"
  }
];
