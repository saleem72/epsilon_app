//

import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_product_failure.freezed.dart';

@freezed
class GetProductFailure with _$GetProductFailure {
  const factory GetProductFailure.noInternet() = _NoInternt;
  const factory GetProductFailure.connectionFailure() = _ConnectionFailure;
  const factory GetProductFailure.productNotFound() = _ProductNotFound;
  const factory GetProductFailure.invalidResponse() = _InvalidResponse;
  const factory GetProductFailure.unexpected() = _Unexpected;
}
