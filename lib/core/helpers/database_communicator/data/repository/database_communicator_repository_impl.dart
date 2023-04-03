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
  Future<Either<Failure, bool>> checkConnection(ConnectionParams params) async {
    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      return Left(NoInternetConnection());
    }

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
  Future<Either<Failure, ProductDetails>> getProductByBarcode({
    required String barcode,
  }) async {
    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      return Left(NoInternetConnection());
    }
    final query = await _sqlProvider.statementForBarcode(barcode);

    try {
      final cachedConnection = await _getLastInUseConnection();
      final result = await _connectionManager.executeStatmet(
          query: query, params: cachedConnection);

      return result.fold(
        (failure) {
          return Left(failure);
        },
        (records) {
          return _mapToProductDetails(records);
        },
      );
    } on InvalidConnectionParams catch (e) {
      return Left(e);
    }
  }

  Either<Failure, ProductDetails> _mapToProductDetails(
      List<Map<String, String>> records) {
    final mappingResult = _productDetailsMapper(records);
    return mappingResult.fold((failure) {
      return Left(failure);
    }, (product) {
      return Right(product);
    });
  }

  @override
  Future<Either<Failure, ProductDetails>> getProductBySerial({
    required String serial,
  }) async {
    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      return Left(NoInternetConnection());
    }
    final query = await _sqlProvider.statementForSerial(serial);

    try {
      final cachedConnection = await _getLastInUseConnection();
      final result = await _connectionManager.executeStatmet(
          query: query, params: cachedConnection);
      return result.fold(
        (failure) {
          return Left(failure);
        },
        (records) {
          return _mapToProductDetails(records);
        },
      );
    } on InvalidConnectionParams catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, List<ConnectionParams>>>
      fetchCachedConnections() async {
    try {
      final cachedConnection = await _getLastInUseConnection();
      return right([cachedConnection]);
    } on InvalidConnectionParams catch (e) {
      return left(e);
    }
  }
}
