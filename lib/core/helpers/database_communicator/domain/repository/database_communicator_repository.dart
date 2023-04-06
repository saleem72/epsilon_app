//

import 'package:dartz/dartz.dart';
import 'package:epsilon_app/core/helpers/database_communicator/domain/models/connection_params.dart';

import '../../../../../features/core/query_product/product_details_screen/models/product_datails.dart';
import '../../../../errors/failure/failure.dart';
import '../models/failures/connection_manager_failures.dart';
import '../models/failures/get_product_failure.dart';

abstract class DatabaseCommunicatorRepository {
  Future<Either<GetProductFailure, ProductDetails>> getProductBySerial(
      {required String serial});
  Future<Either<GetProductFailure, ProductDetails>> getProductByBarcode(
      {required String barcode});
  Future<Either<CheckConnectionFailure, bool>> checkConnection(
      ConnectionParams params);
  Future<Either<Failure, List<ConnectionParams>>> fetchCachedConnections();
}
