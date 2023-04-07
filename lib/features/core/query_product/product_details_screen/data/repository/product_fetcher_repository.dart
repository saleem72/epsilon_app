//

import 'package:epsilon_app/core/helpers/database_communicator/data/usecases/cached_connection_getter.dart';
import 'package:epsilon_app/features/core/query_product/product_details_screen/domain/models/product_datails.dart';

import 'package:epsilon_app/features/core/query_product/product_details_screen/domain/failures/get_product_failure.dart';

import 'package:dartz/dartz.dart';

import '../../../../../../core/helpers/database_communicator/data/connection_manager/connection_manager.dart';
import '../../../../../../core/helpers/database_communicator/domain/sql_statements_provider/sql_statement_provider.dart';
import '../../../../../../core/helpers/network_info/network_info.dart';
import '../../domain/repository/i_product_fetcher_repository.dart';
import '../../domain/usecases/product_details_mapper.dart';

class ProductFetcherRepository implements IProductFetcherRepository {
  final NetworkInfo _networkInfo;
  final ConnectionManager _connectionManager;
  final SqlStatmentProvider _sqlProvider;
  final ProductDetailsMapper _productDetailsMapper;
  final CachedConnectionGetter _connectionGetter;

  ProductFetcherRepository({
    required NetworkInfo networkInfo,
    required ConnectionManager connectionManager,
    required SqlStatmentProvider sqlProvider,
    required ProductDetailsMapper productDetailsMapper,
    required CachedConnectionGetter connectionGetter,
  })  : _networkInfo = networkInfo,
        _connectionManager = connectionManager,
        _sqlProvider = sqlProvider,
        _connectionGetter = connectionGetter,
        _productDetailsMapper = productDetailsMapper;

  @override
  Future<Either<GetProductFailure, ProductDetails>> getProductByBarcode({
    required String barcode,
  }) async {
    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      return const Left(GetProductFailure.noInternet());
    }
    final query = await _sqlProvider.statementForBarcode(barcode);

    final eitherConnection = await _connectionGetter.get();

    return eitherConnection.fold(
      (_) => const Left(GetProductFailure.connectionFailure(message: '')),
      (cachedConnection) async {
        final result = await _connectionManager.executeStatmet(
            query: query, params: cachedConnection);

        return result.fold(
          (failure) {
            return Left(GetProductFailure.connectionFailure(
                message: failure.toString()));
          },
          (records) {
            return _mapToProductDetails(records);
          },
        );
      },
    );
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

    final eitherConnection = await _connectionGetter.get();

    return eitherConnection.fold(
      (l) => const Left(GetProductFailure.connectionFailure(message: '')),
      (cachedConnection) async {
        final result = await _connectionManager.executeStatmet(
            query: query, params: cachedConnection);
        return result.fold(
          (failure) {
            return Left(GetProductFailure.connectionFailure(
                message: failure.toString()));
          },
          (records) {
            return _mapToProductDetails(records);
          },
        );
      },
    );
  }
}
