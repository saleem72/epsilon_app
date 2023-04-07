import '../../domain/failures/get_product_failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/barcode_or_serial.dart';
import '../../domain/models/product_datails.dart';
import '../../domain/repository/i_product_fetcher_repository.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';
part 'product_details_bloc.freezed.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final IProductFetcherRepository _repository;
  ProductDetailsBloc({
    required IProductFetcherRepository repository,
  })  : _repository = repository,
        super(const ProductDetailsState.initial()) {
    on<_GetProduct>(_onGetProduct);
    on<_GetProductByBarcode>(_getProductByBarCode);
    on<_GetProductBySerial>(_getProductBySerial);
    on<_ClearError>(_onClearError);
  }

  _onClearError(_ClearError event, Emitter<ProductDetailsState> emit) {
    emit(const ProductDetailsState.initial());
  }

  _onGetProduct(_GetProduct event, Emitter<ProductDetailsState> emit) async {
    event.product.when(
      barcode: (barcode) {
        add(ProductDetailsEvent.getProductByBarcode(barcode: barcode));
      },
      serial: (serial) {
        add(ProductDetailsEvent.getProductBySerial(serial: serial));
      },
    );
  }

  _getProductByBarCode(
      _GetProductByBarcode event, Emitter<ProductDetailsState> emit) async {
    emit(const ProductDetailsState.loading());
    final response = await _repository.getProductByBarcode(
      barcode: event.barcode,
    );
    response.fold(
      (failure) {
        emit(ProductDetailsState.withFailure(failure));
      },
      (product) => emit(ProductDetailsState.withSuccess(product)),
    );
  }

  _getProductBySerial(
      _GetProductBySerial event, Emitter<ProductDetailsState> emit) async {
    emit(const ProductDetailsState.loading());
    final response = await _repository.getProductBySerial(
      serial: event.serial,
    );
    response.fold(
      (failure) {
        emit(ProductDetailsState.withFailure(failure));
      },
      (product) => emit(ProductDetailsState.withSuccess(product)),
    );
  }
}
