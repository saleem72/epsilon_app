part of 'product_details_bloc.dart';

@freezed
class ProductDetailsEvent with _$ProductDetailsEvent {
  const factory ProductDetailsEvent.getProduct(
      {required BarcodeOrSerial product}) = _GetProduct;
  const factory ProductDetailsEvent.getProductBySerial(
      {required String serial}) = _GetProductBySerial;
  const factory ProductDetailsEvent.getProductByBarcode(
      {required String barcode}) = _GetProductByBarcode;
  const factory ProductDetailsEvent.clearError() = _ClearError;
}
