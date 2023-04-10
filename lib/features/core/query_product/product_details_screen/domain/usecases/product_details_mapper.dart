//

import '../../../../../../core/errors/exceptions/app_exceptions.dart';
import '../models/product_datails.dart';

class ProductDetailsMapper {
  ProductDetails call(List<Map<String, String>> recoreds) {
    try {
      if (recoreds.isEmpty) {
        throw ProductNotFoundError();
      }
      final materials = recoreds.map((e) => ProductItem.fromMap(e)).toList();

      return ProductDetails.itemsList(materials);
    } on TypeError {
      // product can't be decoded
      throw InValidProductError();
    }
  }
}

class ProductNotFoundError extends AppException {}

class InValidProductError extends AppException {}
