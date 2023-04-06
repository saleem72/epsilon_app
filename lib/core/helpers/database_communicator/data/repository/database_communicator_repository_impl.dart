//

import 'package:dartz/dartz.dart';
import 'package:epsilon_app/core/errors/failure/failure.dart';
import 'package:epsilon_app/core/helpers/database_communicator/data/connection_manager/connection_manager.dart';
import 'package:epsilon_app/core/helpers/database_communicator/domain/models/connection_params.dart';
import 'package:epsilon_app/core/helpers/database_communicator/domain/models/failures/connection_manager_failures.dart';
import 'package:epsilon_app/core/helpers/database_communicator/domain/repository/database_communicator_repository.dart';
import 'package:epsilon_app/core/helpers/database_communicator/domain/sql_statements_provider/sql_statement_provider.dart';
import 'package:epsilon_app/core/helpers/network_info/network_info.dart';
import 'package:epsilon_app/features/core/query_product/product_details_screen/models/product_datails.dart';
import 'package:epsilon_app/features/core/query_product/product_details_screen/usecases/product_details_mapper.dart';

import '../../domain/models/company.dart';
import '../../domain/models/failures/get_product_failure.dart';
import '../local_cache/database/app_database.dart';
import '../models/connection_params_dto.dart';

class DatabaseCommunicatorRepositoryImpl
    implements DatabaseCommunicatorRepository {
  final NetworkInfo _networkInfo;
  final ConnectionManager _connectionManager;
  final SqlStatmentProvider _sqlProvider;
  final ProductDetailsMapper _productDetailsMapper;
  final AppDatabase _db;

  DatabaseCommunicatorRepositoryImpl({
    required NetworkInfo networkInfo,
    required ConnectionManager connectionManager,
    required SqlStatmentProvider sqlProvider,
    required ProductDetailsMapper productDetailsMapper,
    required AppDatabase db,
  })  : _networkInfo = networkInfo,
        _connectionManager = connectionManager,
        _sqlProvider = sqlProvider,
        _db = db,
        _productDetailsMapper = productDetailsMapper;

  @override
  Future<Either<CheckConnectionFailure, bool>> checkConnection(
      ConnectionParams params) async {
    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      return Left(CheckConnectionFailure.noInternt());
    }

    try {
      final result = await _connectionManager.checkConnection(params: params);
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
    /*
    final result = await _connectionManager.checkConnection(params: params);
    return result.fold(
      (failure) => Left(ConnectionManagerFailToConnect(error: failure.error)),
      (r) {
        final connectionEntity =
            ConnectionParamsDTO.fromDomain(params).toEntity();
        _db.connectionsDAO.updateConnection(connectionEntity);
        return const Right(true);
      },
    );
    */
  }

  Future<ConnectionParams> _getLastInUseConnection() async {
    try {
      final connectionEntity = await _db.connectionsDAO.getLastInUseOrNull();
      final newParams =
          ConnectionParamsDTO.fromEntity(connectionEntity).toDomain();
      return newParams;
    } catch (e) {
      throw InvalidConnectionParams();
    }
  }

  @override
  Future<Either<GetProductFailure, ProductDetails>> getProductByBarcode({
    required String barcode,
  }) async {
    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      return const Left(GetProductFailure.noInternet());
    }
    final query = await _sqlProvider.statementForBarcode(barcode);

    try {
      final cachedConnection = await _getLastInUseConnection();
      final result = await _connectionManager.executeStatmet(
          query: query, params: cachedConnection);

      return result.fold(
        (failure) {
          return const Left(GetProductFailure.connectionFailure());
        },
        (records) {
          return _mapToProductDetails(records);
        },
      );
    } on InvalidConnectionParams catch (_) {
      return const Left(GetProductFailure.connectionFailure());
    }
  }

  Either<GetProductFailure, ProductDetails> _mapToProductDetails(
      List<Map<String, String>> records) {
    try {
      final mappingResult = _productDetailsMapper(records);
      return Right(mappingResult);
    } on ProductNotFoundError {
      return const Left(GetProductFailure.productNotFound());
    } on InValidProductError {
      return const Left(GetProductFailure.invalidResponse());
    } catch (e) {
      return const Left(GetProductFailure.unexpected());
    }
  }

  @override
  Future<Either<GetProductFailure, ProductDetails>> getProductBySerial({
    required String serial,
  }) async {
    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      return const Left(GetProductFailure.noInternet());
    }
    final query = await _sqlProvider.statementForSerial(serial);

    try {
      final cachedConnection = await _getLastInUseConnection();
      final result = await _connectionManager.executeStatmet(
          query: query, params: cachedConnection);
      return result.fold(
        (failure) {
          return const Left(GetProductFailure.connectionFailure());
        },
        (records) {
          return _mapToProductDetails(records);
        },
      );
    } on InvalidConnectionParams catch (_) {
      return const Left(GetProductFailure.unexpected());
    }
  }

  @override
  Future<Either<Failure, List<ConnectionParams>>>
      fetchCachedConnections() async {
    const params = ConnectionParams(
      host: 'epsilondemo.dyndns.org',
      port: '1433',
      database: 'amndbtest1',
      username: 'sa',
      password: 'H123456789h',
      company: Company.alameen,
    );
    return const Right([params]);

    // try {
    //   final cachedConnection = await _getLastInUseConnection();
    //   return right([cachedConnection]);
    // } on InvalidConnectionParams catch (e) {
    //   return left(e);
    // }
  }
}
