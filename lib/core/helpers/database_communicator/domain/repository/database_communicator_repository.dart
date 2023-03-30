//

import 'package:dartz/dartz.dart';
import 'package:epsilon_app/core/helpers/database_communicator/domain/models/connection_params.dart';

import '../../../../../features/core/query_product/product_details_screen/models/product_datails.dart';
import '../../../../errors/failure/failure.dart';

abstract class DatabaseCommunicatorRepository {
  Future<Either<Failure, ProductDetails>> getProductBySerial(
      {required ConnectionParams params, required String serial});
  Future<Either<Failure, ProductDetails>> getProductByBarcode(
      {required ConnectionParams params, required String barcode});
  Future<Either<Failure, bool>> checkConnection(ConnectionParams params);
}
