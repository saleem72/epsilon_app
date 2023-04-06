part of 'product_details_bloc.dart';

@freezed
class ProductDetailsState with _$ProductDetailsState {
  const factory ProductDetailsState.initial() = ProductDetailsInitial;
  const factory ProductDetailsState.loading() = ProductDetailsLoading;
  const factory ProductDetailsState.withSuccess(ProductDetails product) =
      ProductDetailsWithSuccess;
  const factory ProductDetailsState.withFailure(GetProductFailure failure) =
      ProductDetailsWithFailure;
}
