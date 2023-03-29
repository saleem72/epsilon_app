//

import 'package:dartz/dartz.dart';
import 'package:epsilon_app/core/errors/failure/failure.dart';
import 'package:epsilon_app/features/core/subject_details_screen/models/product_details_failures.dart';

import '../models/product_datails.dart';

class ProductDetailsMapper {
  Either<Failure, ProductDetails> call(List<Map<String, String>> recoreds) {
    try {
      final materials = recoreds.map((e) => ProductDetails.fromMap(e)).toList();
      if (materials.isNotEmpty) {
        return Right(materials.first);
      } else {
        return Left(ProductNotFound());
      }
    } on TypeError {
      // product can't be decoded
      return Left(InValidProduct());
    } catch (e) {
      return Left(UnExpectedFailure(error: e.toString()));
    }
  }
}
