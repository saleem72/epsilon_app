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

class DatabaseCommunicatorRepositoryImpl
    implements DatabaseCommunicatorRepository {
  final NetworkInfo _networkInfo;
  final ConnectionManager _connectionManager;
  final SqlStatmentProvider _sqlProvider;
  final ProductDetailsMapper _productDetailsMapper;

  DatabaseCommunicatorRepositoryImpl({
    required NetworkInfo networkInfo,
    required ConnectionManager connectionManager,
    required SqlStatmentProvider sqlProvider,
    required ProductDetailsMapper productDetailsMapper,
  })  : _networkInfo = networkInfo,
        _connectionManager = connectionManager,
        _sqlProvider = sqlProvider,
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
      (r) => const Right(true),
    );
  }

  @override
  Future<Either<Failure, ProductDetails>> getProductByBarcode({
    required ConnectionParams params,
    required String barcode,
  }) async {
    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      return Left(NoInternetConnection());
    }
    final query = await _sqlProvider.statementForBarcode(barcode);
    final result =
        await _connectionManager.executeStatmet(query: query, params: params);
    return result.fold(
      (failure) {
        return Left(failure);
      },
      (records) {
        return _mapToProductDetails(records);
      },
    );
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
    required ConnectionParams params,
    required String serial,
  }) async {
    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      return Left(NoInternetConnection());
    }
    final query = await _sqlProvider.statementForSerial(serial);
    final result =
        await _connectionManager.executeStatmet(query: query, params: params);
    return result.fold(
      (failure) {
        return Left(failure);
      },
      (records) {
        return _mapToProductDetails(records);
      },
    );
  }
}
