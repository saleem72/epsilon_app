// ignore_for_file: depend_on_referenced_packages, invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:epsilon_app/features/core/home_screen/domain/models/companies.dart';
import 'package:epsilon_app/features/core/home_screen/presentation/connection_manager/failures/connection_manager_failures.dart';
import 'package:epsilon_app/features/core/home_screen/presentation/connection_manager/models/sql_statements.dart';
import 'package:epsilon_app/features/core/subject_details_screen/models/product_datails.dart';
import 'package:epsilon_app/features/core/subject_details_screen/usecases/product_details_mapper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/errors/failure/failure.dart';
import '../../../data/connection_manager/connection_manager.dart';
import '../models/connection_params.dart';

part 'database_provider_event.dart';
part 'database_provider_state.dart';

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

class DatabaseProvider
    extends Bloc<DatabaseProviderEvent, DatabaseProviderState> {
  final ConnectionManager _connectionManager;
  final ProductDetailsMapper _productDetailsMapper;

  DatabaseProvider({
    required ConnectionManager connectionManager,
    required ProductDetailsMapper productDetailsMapper,
  })  : _connectionManager = connectionManager,
        _productDetailsMapper = productDetailsMapper,
        super(DatabaseProviderEmptyState()) {
    on<DatabaseProviderHostHasChange>(_onHostHasChange);
    on<DatabaseProviderPortHasChange>(_onPortHasChange);
    on<DatabaseProviderDatabaseNameHasChange>(_onDatabaseHasChange);
    on<DatabaseProviderUsernameHasChange>(_onUsernameHasChange);
    on<DatabaseProviderPasswordHasChange>(_onPasswordHasChange);
    on<DatabaseProviderCompanyHasChange>(_onCompanyHasChange);
    // on<ConnectionManagerExecuteStatment>(_onExecuteStatment);
    on<DatabaseProviderFetchConnections>(_onFetchConnections);
    on<DatabaseProviderQueryHasChange>(_onQueryHasChange);
    on<DatabaseProviderCheckConnection>(_onCheckConnection);
    on<DatabaseProviderClearError>(_onClearError);
    on<GetProductBySerial>(_onGetProductBySerial);
    on<GetProductByBarCode>(_onGetProductByBarCode);
  }

  String host = '';
  String port = '';
  String database = '';
  String username = '';
  String password = '';
  String query = '';
  Companies? company;

  _onGetProductByBarCode(
      GetProductByBarCode event, Emitter<DatabaseProviderState> emit) async {
    query = SQLStatements.statementForBarcode(event.barcode);
    emit(DatabaseProviderLoading());
    final result = await _preformStatment();
    result.fold(
      (failure) {
        emit(DatabaseProviderExecutionFailure(failure: failure));
      },
      (records) {
        final mappingResult = _productDetailsMapper(records);
        mappingResult.fold((failure) {
          emit(DatabaseProviderExecutionFailure(failure: failure));
        }, (product) {
          emit(GettingProductWithSuccess(product: product));
        });
      },
    );
  }

  _onGetProductBySerial(
      GetProductBySerial event, Emitter<DatabaseProviderState> emit) async {
    query = SQLStatements.statementForSerial(event.serial);
    emit(DatabaseProviderLoading());
    final result = await _preformStatment();
    result.fold(
      (failure) {
        emit(DatabaseProviderExecutionFailure(failure: failure));
      },
      (records) {
        final mappingResult = _productDetailsMapper(records);
        mappingResult.fold((failure) {
          emit(DatabaseProviderExecutionFailure(failure: failure));
        }, (product) {
          emit(GettingProductWithSuccess(product: product));
        });
      },
    );
  }

  _onClearError(
      DatabaseProviderClearError event, Emitter<DatabaseProviderState> emit) {
    emit(DatabaseProviderEmptyState());
  }

  _onFetchConnections(DatabaseProviderFetchConnections event,
      Emitter<DatabaseProviderState> emit) {
    host = 'epsilondemo.dyndns.org';
    port = '1433';
    database = 'amndbtest1';
    username = 'sa';
    password = 'H123456789h';
    company = Companies.alameen;
    emit(
      DatabaseProviderSetParams(
        host: host,
        port: port,
        database: database,
        username: username,
        password: password,
        company: company!,
      ),
    );
  }

  _onPasswordHasChange(DatabaseProviderPasswordHasChange event,
      Emitter<DatabaseProviderState> emit) {
    password = event.password;
  }

  _onQueryHasChange(DatabaseProviderQueryHasChange event,
      Emitter<DatabaseProviderState> emit) {
    query = event.query;
  }

  _onCompanyHasChange(DatabaseProviderCompanyHasChange event,
      Emitter<DatabaseProviderState> emit) {
    company = event.company;
  }

  _onUsernameHasChange(DatabaseProviderUsernameHasChange event,
      Emitter<DatabaseProviderState> emit) {
    username = event.username;
  }

  _onDatabaseHasChange(DatabaseProviderDatabaseNameHasChange event,
      Emitter<DatabaseProviderState> emit) {
    database = event.database;
  }

  _onHostHasChange(DatabaseProviderHostHasChange event,
      Emitter<DatabaseProviderState> emit) {
    host = event.host;
  }

  _onPortHasChange(DatabaseProviderPortHasChange event,
      Emitter<DatabaseProviderState> emit) {
    port = event.port;
  }

  _onCheckConnection(DatabaseProviderCheckConnection event,
      Emitter<DatabaseProviderState> emit) async {
    print('_onCheckConnection');
    emit(DatabaseProviderLoading());

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
        emit(DatabaseProviderCheckingFailure(
            failure: ConnectionManagerFailToConnect(error: failure.error)));
      },
      (success) {
        if (success) {
          emit(DatabaseProviderConnectSuccessfully());
        } else {
          emit(DatabaseProviderCheckingFailure(
              failure: ConnectionManagerFailToConnect()));
        }
      },
    );
  }

  /*
  void _onExecuteStatment(ConnectionManagerExecuteStatment event,
      Emitter<DatabaseProviderState> emit) async {
    query = event.query;
    emit(DatabaseProviderLoading());

    final result = await _preformStatment();
    result.fold(
      (failure) {
        print(failure.toString());
        emit(DatabaseProviderExecutionFailure(failure: failure));
      },
      (records) {
        for (final rec in records) {
          rec.beautify();
        }
        emit(DatabaseProviderSuccess(records: records));
      },
    );
  }
  */

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
