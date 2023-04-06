//

import '../../../../../core/errors/exceptions/app_exceptions.dart';
import '../models/product_datails.dart';

class ProductDetailsMapper {
  ProductDetails call(List<Map<String, String>> recoreds) {
    try {
      final materials = recoreds.map((e) => ProductDetails.fromMap(e)).toList();
      if (materials.isNotEmpty) {
        return materials.first;
      } else {
        throw ProductNotFoundError();
      }
    } on TypeError {
      // product can't be decoded
      throw InValidProductError();
    }
  }
}

class ProductNotFoundError extends AppException {}

class InValidProductError extends AppException {}
