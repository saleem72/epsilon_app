//

import 'package:epsilon_app/core/helpers/localization/language_constants.dart';
import 'package:flutter/material.dart';

import '../../../../core/errors/failure/failure.dart';

class ProductNotFound extends Failure {
  @override
  String message(BuildContext context) {
    return Translator.translation(context).product_not_found;
  }
}

class InValidProduct extends Failure {
  @override
  String message(BuildContext context) {
    return Translator.translation(context).inValid_product;
  }
}
