// ignore_for_file: depend_on_referenced_packages, invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/errors/failure/failure.dart';
import '../../../../../../features/core/query_product/product_details_screen/models/product_datails.dart';
import '../../../../../../features/core/query_product/product_details_screen/usecases/product_details_mapper.dart';
import '../../../data/connection_manager/connection_manager.dart';
import '../../../domain/models/company.dart';
import '../../../domain/sql_statements_provider/sql_statement_provider.dart';
import '../failures/connection_manager_failures.dart';
import '../models/connection_params.dart';

part 'database_communicator_event.dart';
part 'database_communicator_state.dart';

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

class DatabaseCommunicator
    extends Bloc<DatabaseCommunicatorEvent, DatabaseCommunicatorState> {
  final ConnectionManager _connectionManager;
  final ProductDetailsMapper _productDetailsMapper;
  final SqlStatmentProvider _sqlProvider;

  DatabaseCommunicator({
    required ConnectionManager connectionManager,
    required ProductDetailsMapper productDetailsMapper,
    required SqlStatmentProvider sqlProvider,
  })  : _connectionManager = connectionManager,
        _productDetailsMapper = productDetailsMapper,
        _sqlProvider = sqlProvider,
        super(DatabaseCommunicatorEmptyState()) {
    on<DatabaseCommunicatorHostHasChange>(_onHostHasChange);
    on<DatabaseCommunicatorPortHasChange>(_onPortHasChange);
    on<DatabaseCommunicatorDatabaseNameHasChange>(_onDatabaseHasChange);
    on<DatabaseCommunicatorUsernameHasChange>(_onUsernameHasChange);
    on<DatabaseCommunicatorPasswordHasChange>(_onPasswordHasChange);
    on<DatabaseCommunicatorCompanyHasChange>(_onCompanyHasChange);
    // on<ConnectionManagerExecuteStatment>(_onExecuteStatment);
    on<DatabaseCommunicatorFetchConnections>(_onFetchConnections);
    on<DatabaseCommunicatorQueryHasChange>(_onQueryHasChange);
    on<DatabaseCommunicatorCheckConnection>(_onCheckConnection);
    on<DatabaseCommunicatorClearError>(_onClearError);
    on<GetProductBySerial>(_onGetProductBySerial);
    on<GetProductByBarCode>(_onGetProductByBarCode);
  }

  String host = '';
  String port = '';
  String database = '';
  String username = '';
  String password = '';
  String query = '';
  Company? company;

  _onGetProductByBarCode(GetProductByBarCode event,
      Emitter<DatabaseCommunicatorState> emit) async {
    query = await _sqlProvider.statementForBarcode(event.barcode);
    emit(DatabaseCommunicatorLoading());
    final result = await _preformStatment();
    result.fold(
      (failure) {
        emit(DatabaseCommunicatorExecutionFailure(failure: failure));
      },
      (records) {
        final mappingResult = _productDetailsMapper(records);
        mappingResult.fold((failure) {
          emit(DatabaseCommunicatorExecutionFailure(failure: failure));
        }, (product) {
          emit(GettingProductWithSuccess(product: product));
        });
      },
    );
  }

  _onGetProductBySerial(
      GetProductBySerial event, Emitter<DatabaseCommunicatorState> emit) async {
    query = await _sqlProvider.statementForSerial(event.serial);
    emit(DatabaseCommunicatorLoading());
    final result = await _preformStatment();
    result.fold(
      (failure) {
        emit(DatabaseCommunicatorExecutionFailure(failure: failure));
      },
      (records) {
        final mappingResult = _productDetailsMapper(records);
        mappingResult.fold((failure) {
          emit(DatabaseCommunicatorExecutionFailure(failure: failure));
        }, (product) {
          emit(GettingProductWithSuccess(product: product));
        });
      },
    );
  }

  _onClearError(DatabaseCommunicatorClearError event,
      Emitter<DatabaseCommunicatorState> emit) {
    emit(DatabaseCommunicatorEmptyState());
  }

  _onFetchConnections(DatabaseCommunicatorFetchConnections event,
      Emitter<DatabaseCommunicatorState> emit) {
    host = 'epsilondemo.dyndns.org';
    port = '1433';
    database = 'amndbtest1';
    username = 'sa';
    password = 'H123456789h';
    company = Company.alameen;
    emit(
      DatabaseCommunicatorSetParams(
        host: host,
        port: port,
        database: database,
        username: username,
        password: password,
        company: company!,
      ),
    );
  }

  _onPasswordHasChange(DatabaseCommunicatorPasswordHasChange event,
      Emitter<DatabaseCommunicatorState> emit) {
    password = event.password;
  }

  _onQueryHasChange(DatabaseCommunicatorQueryHasChange event,
      Emitter<DatabaseCommunicatorState> emit) {
    query = event.query;
  }

  _onCompanyHasChange(DatabaseCommunicatorCompanyHasChange event,
      Emitter<DatabaseCommunicatorState> emit) {
    company = event.company;
  }

  _onUsernameHasChange(DatabaseCommunicatorUsernameHasChange event,
      Emitter<DatabaseCommunicatorState> emit) {
    username = event.username;
  }

  _onDatabaseHasChange(DatabaseCommunicatorDatabaseNameHasChange event,
      Emitter<DatabaseCommunicatorState> emit) {
    database = event.database;
  }

  _onHostHasChange(DatabaseCommunicatorHostHasChange event,
      Emitter<DatabaseCommunicatorState> emit) {
    host = event.host;
  }

  _onPortHasChange(DatabaseCommunicatorPortHasChange event,
      Emitter<DatabaseCommunicatorState> emit) {
    port = event.port;
  }

  _onCheckConnection(DatabaseCommunicatorCheckConnection event,
      Emitter<DatabaseCommunicatorState> emit) async {
    print('_onCheckConnection');
    emit(DatabaseCommunicatorLoading());

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
        emit(DatabaseCommunicatorCheckingFailure(
            failure: ConnectionManagerFailToConnect(error: failure.error)));
      },
      (success) {
        if (success) {
          emit(DatabaseCommunicatorConnectSuccessfully());
        } else {
          emit(DatabaseCommunicatorCheckingFailure(
              failure: ConnectionManagerFailToConnect()));
        }
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

/*
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
*/
