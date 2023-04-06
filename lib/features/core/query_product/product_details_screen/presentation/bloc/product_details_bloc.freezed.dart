// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductDetailsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BarcodeOrSerial product) getProduct,
    required TResult Function(String serial) getProductBySerial,
    required TResult Function(String barcode) getProductByBarcode,
    required TResult Function() clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BarcodeOrSerial product)? getProduct,
    TResult? Function(String serial)? getProductBySerial,
    TResult? Function(String barcode)? getProductByBarcode,
    TResult? Function()? clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BarcodeOrSerial product)? getProduct,
    TResult Function(String serial)? getProductBySerial,
    TResult Function(String barcode)? getProductByBarcode,
    TResult Function()? clearError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetProduct value) getProduct,
    required TResult Function(_GetProductBySerial value) getProductBySerial,
    required TResult Function(_GetProductByBarcode value) getProductByBarcode,
    required TResult Function(_ClearError value) clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetProduct value)? getProduct,
    TResult? Function(_GetProductBySerial value)? getProductBySerial,
    TResult? Function(_GetProductByBarcode value)? getProductByBarcode,
    TResult? Function(_ClearError value)? clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetProduct value)? getProduct,
    TResult Function(_GetProductBySerial value)? getProductBySerial,
    TResult Function(_GetProductByBarcode value)? getProductByBarcode,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailsEventCopyWith<$Res> {
  factory $ProductDetailsEventCopyWith(
          ProductDetailsEvent value, $Res Function(ProductDetailsEvent) then) =
      _$ProductDetailsEventCopyWithImpl<$Res, ProductDetailsEvent>;
}

/// @nodoc
class _$ProductDetailsEventCopyWithImpl<$Res, $Val extends ProductDetailsEvent>
    implements $ProductDetailsEventCopyWith<$Res> {
  _$ProductDetailsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetProductCopyWith<$Res> {
  factory _$$_GetProductCopyWith(
          _$_GetProduct value, $Res Function(_$_GetProduct) then) =
      __$$_GetProductCopyWithImpl<$Res>;
  @useResult
  $Res call({BarcodeOrSerial product});

  $BarcodeOrSerialCopyWith<$Res> get product;
}

/// @nodoc
class __$$_GetProductCopyWithImpl<$Res>
    extends _$ProductDetailsEventCopyWithImpl<$Res, _$_GetProduct>
    implements _$$_GetProductCopyWith<$Res> {
  __$$_GetProductCopyWithImpl(
      _$_GetProduct _value, $Res Function(_$_GetProduct) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_$_GetProduct(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as BarcodeOrSerial,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BarcodeOrSerialCopyWith<$Res> get product {
    return $BarcodeOrSerialCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value));
    });
  }
}

/// @nodoc

class _$_GetProduct implements _GetProduct {
  const _$_GetProduct({required this.product});

  @override
  final BarcodeOrSerial product;

  @override
  String toString() {
    return 'ProductDetailsEvent.getProduct(product: $product)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetProduct &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetProductCopyWith<_$_GetProduct> get copyWith =>
      __$$_GetProductCopyWithImpl<_$_GetProduct>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BarcodeOrSerial product) getProduct,
    required TResult Function(String serial) getProductBySerial,
    required TResult Function(String barcode) getProductByBarcode,
    required TResult Function() clearError,
  }) {
    return getProduct(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BarcodeOrSerial product)? getProduct,
    TResult? Function(String serial)? getProductBySerial,
    TResult? Function(String barcode)? getProductByBarcode,
    TResult? Function()? clearError,
  }) {
    return getProduct?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BarcodeOrSerial product)? getProduct,
    TResult Function(String serial)? getProductBySerial,
    TResult Function(String barcode)? getProductByBarcode,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (getProduct != null) {
      return getProduct(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetProduct value) getProduct,
    required TResult Function(_GetProductBySerial value) getProductBySerial,
    required TResult Function(_GetProductByBarcode value) getProductByBarcode,
    required TResult Function(_ClearError value) clearError,
  }) {
    return getProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetProduct value)? getProduct,
    TResult? Function(_GetProductBySerial value)? getProductBySerial,
    TResult? Function(_GetProductByBarcode value)? getProductByBarcode,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return getProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetProduct value)? getProduct,
    TResult Function(_GetProductBySerial value)? getProductBySerial,
    TResult Function(_GetProductByBarcode value)? getProductByBarcode,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (getProduct != null) {
      return getProduct(this);
    }
    return orElse();
  }
}

abstract class _GetProduct implements ProductDetailsEvent {
  const factory _GetProduct({required final BarcodeOrSerial product}) =
      _$_GetProduct;

  BarcodeOrSerial get product;
  @JsonKey(ignore: true)
  _$$_GetProductCopyWith<_$_GetProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetProductBySerialCopyWith<$Res> {
  factory _$$_GetProductBySerialCopyWith(_$_GetProductBySerial value,
          $Res Function(_$_GetProductBySerial) then) =
      __$$_GetProductBySerialCopyWithImpl<$Res>;
  @useResult
  $Res call({String serial});
}

/// @nodoc
class __$$_GetProductBySerialCopyWithImpl<$Res>
    extends _$ProductDetailsEventCopyWithImpl<$Res, _$_GetProductBySerial>
    implements _$$_GetProductBySerialCopyWith<$Res> {
  __$$_GetProductBySerialCopyWithImpl(
      _$_GetProductBySerial _value, $Res Function(_$_GetProductBySerial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serial = null,
  }) {
    return _then(_$_GetProductBySerial(
      serial: null == serial
          ? _value.serial
          : serial // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetProductBySerial implements _GetProductBySerial {
  const _$_GetProductBySerial({required this.serial});

  @override
  final String serial;

  @override
  String toString() {
    return 'ProductDetailsEvent.getProductBySerial(serial: $serial)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetProductBySerial &&
            (identical(other.serial, serial) || other.serial == serial));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serial);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetProductBySerialCopyWith<_$_GetProductBySerial> get copyWith =>
      __$$_GetProductBySerialCopyWithImpl<_$_GetProductBySerial>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BarcodeOrSerial product) getProduct,
    required TResult Function(String serial) getProductBySerial,
    required TResult Function(String barcode) getProductByBarcode,
    required TResult Function() clearError,
  }) {
    return getProductBySerial(serial);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BarcodeOrSerial product)? getProduct,
    TResult? Function(String serial)? getProductBySerial,
    TResult? Function(String barcode)? getProductByBarcode,
    TResult? Function()? clearError,
  }) {
    return getProductBySerial?.call(serial);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BarcodeOrSerial product)? getProduct,
    TResult Function(String serial)? getProductBySerial,
    TResult Function(String barcode)? getProductByBarcode,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (getProductBySerial != null) {
      return getProductBySerial(serial);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetProduct value) getProduct,
    required TResult Function(_GetProductBySerial value) getProductBySerial,
    required TResult Function(_GetProductByBarcode value) getProductByBarcode,
    required TResult Function(_ClearError value) clearError,
  }) {
    return getProductBySerial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetProduct value)? getProduct,
    TResult? Function(_GetProductBySerial value)? getProductBySerial,
    TResult? Function(_GetProductByBarcode value)? getProductByBarcode,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return getProductBySerial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetProduct value)? getProduct,
    TResult Function(_GetProductBySerial value)? getProductBySerial,
    TResult Function(_GetProductByBarcode value)? getProductByBarcode,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (getProductBySerial != null) {
      return getProductBySerial(this);
    }
    return orElse();
  }
}

abstract class _GetProductBySerial implements ProductDetailsEvent {
  const factory _GetProductBySerial({required final String serial}) =
      _$_GetProductBySerial;

  String get serial;
  @JsonKey(ignore: true)
  _$$_GetProductBySerialCopyWith<_$_GetProductBySerial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetProductByBarcodeCopyWith<$Res> {
  factory _$$_GetProductByBarcodeCopyWith(_$_GetProductByBarcode value,
          $Res Function(_$_GetProductByBarcode) then) =
      __$$_GetProductByBarcodeCopyWithImpl<$Res>;
  @useResult
  $Res call({String barcode});
}

/// @nodoc
class __$$_GetProductByBarcodeCopyWithImpl<$Res>
    extends _$ProductDetailsEventCopyWithImpl<$Res, _$_GetProductByBarcode>
    implements _$$_GetProductByBarcodeCopyWith<$Res> {
  __$$_GetProductByBarcodeCopyWithImpl(_$_GetProductByBarcode _value,
      $Res Function(_$_GetProductByBarcode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barcode = null,
  }) {
    return _then(_$_GetProductByBarcode(
      barcode: null == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetProductByBarcode implements _GetProductByBarcode {
  const _$_GetProductByBarcode({required this.barcode});

  @override
  final String barcode;

  @override
  String toString() {
    return 'ProductDetailsEvent.getProductByBarcode(barcode: $barcode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetProductByBarcode &&
            (identical(other.barcode, barcode) || other.barcode == barcode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, barcode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetProductByBarcodeCopyWith<_$_GetProductByBarcode> get copyWith =>
      __$$_GetProductByBarcodeCopyWithImpl<_$_GetProductByBarcode>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BarcodeOrSerial product) getProduct,
    required TResult Function(String serial) getProductBySerial,
    required TResult Function(String barcode) getProductByBarcode,
    required TResult Function() clearError,
  }) {
    return getProductByBarcode(barcode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BarcodeOrSerial product)? getProduct,
    TResult? Function(String serial)? getProductBySerial,
    TResult? Function(String barcode)? getProductByBarcode,
    TResult? Function()? clearError,
  }) {
    return getProductByBarcode?.call(barcode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BarcodeOrSerial product)? getProduct,
    TResult Function(String serial)? getProductBySerial,
    TResult Function(String barcode)? getProductByBarcode,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (getProductByBarcode != null) {
      return getProductByBarcode(barcode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetProduct value) getProduct,
    required TResult Function(_GetProductBySerial value) getProductBySerial,
    required TResult Function(_GetProductByBarcode value) getProductByBarcode,
    required TResult Function(_ClearError value) clearError,
  }) {
    return getProductByBarcode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetProduct value)? getProduct,
    TResult? Function(_GetProductBySerial value)? getProductBySerial,
    TResult? Function(_GetProductByBarcode value)? getProductByBarcode,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return getProductByBarcode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetProduct value)? getProduct,
    TResult Function(_GetProductBySerial value)? getProductBySerial,
    TResult Function(_GetProductByBarcode value)? getProductByBarcode,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (getProductByBarcode != null) {
      return getProductByBarcode(this);
    }
    return orElse();
  }
}

abstract class _GetProductByBarcode implements ProductDetailsEvent {
  const factory _GetProductByBarcode({required final String barcode}) =
      _$_GetProductByBarcode;

  String get barcode;
  @JsonKey(ignore: true)
  _$$_GetProductByBarcodeCopyWith<_$_GetProductByBarcode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ClearErrorCopyWith<$Res> {
  factory _$$_ClearErrorCopyWith(
          _$_ClearError value, $Res Function(_$_ClearError) then) =
      __$$_ClearErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ClearErrorCopyWithImpl<$Res>
    extends _$ProductDetailsEventCopyWithImpl<$Res, _$_ClearError>
    implements _$$_ClearErrorCopyWith<$Res> {
  __$$_ClearErrorCopyWithImpl(
      _$_ClearError _value, $Res Function(_$_ClearError) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ClearError implements _ClearError {
  const _$_ClearError();

  @override
  String toString() {
    return 'ProductDetailsEvent.clearError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ClearError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BarcodeOrSerial product) getProduct,
    required TResult Function(String serial) getProductBySerial,
    required TResult Function(String barcode) getProductByBarcode,
    required TResult Function() clearError,
  }) {
    return clearError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BarcodeOrSerial product)? getProduct,
    TResult? Function(String serial)? getProductBySerial,
    TResult? Function(String barcode)? getProductByBarcode,
    TResult? Function()? clearError,
  }) {
    return clearError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BarcodeOrSerial product)? getProduct,
    TResult Function(String serial)? getProductBySerial,
    TResult Function(String barcode)? getProductByBarcode,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (clearError != null) {
      return clearError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetProduct value) getProduct,
    required TResult Function(_GetProductBySerial value) getProductBySerial,
    required TResult Function(_GetProductByBarcode value) getProductByBarcode,
    required TResult Function(_ClearError value) clearError,
  }) {
    return clearError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetProduct value)? getProduct,
    TResult? Function(_GetProductBySerial value)? getProductBySerial,
    TResult? Function(_GetProductByBarcode value)? getProductByBarcode,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return clearError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetProduct value)? getProduct,
    TResult Function(_GetProductBySerial value)? getProductBySerial,
    TResult Function(_GetProductByBarcode value)? getProductByBarcode,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (clearError != null) {
      return clearError(this);
    }
    return orElse();
  }
}

abstract class _ClearError implements ProductDetailsEvent {
  const factory _ClearError() = _$_ClearError;
}

/// @nodoc
mixin _$ProductDetailsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ProductDetails product) withSuccess,
    required TResult Function(GetProductFailure failure) withFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ProductDetails product)? withSuccess,
    TResult? Function(GetProductFailure failure)? withFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ProductDetails product)? withSuccess,
    TResult Function(GetProductFailure failure)? withFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductDetailsInitial value) initial,
    required TResult Function(ProductDetailsLoading value) loading,
    required TResult Function(ProductDetailsWithSuccess value) withSuccess,
    required TResult Function(ProductDetailsWithFailure value) withFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductDetailsInitial value)? initial,
    TResult? Function(ProductDetailsLoading value)? loading,
    TResult? Function(ProductDetailsWithSuccess value)? withSuccess,
    TResult? Function(ProductDetailsWithFailure value)? withFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductDetailsInitial value)? initial,
    TResult Function(ProductDetailsLoading value)? loading,
    TResult Function(ProductDetailsWithSuccess value)? withSuccess,
    TResult Function(ProductDetailsWithFailure value)? withFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailsStateCopyWith<$Res> {
  factory $ProductDetailsStateCopyWith(
          ProductDetailsState value, $Res Function(ProductDetailsState) then) =
      _$ProductDetailsStateCopyWithImpl<$Res, ProductDetailsState>;
}

/// @nodoc
class _$ProductDetailsStateCopyWithImpl<$Res, $Val extends ProductDetailsState>
    implements $ProductDetailsStateCopyWith<$Res> {
  _$ProductDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ProductDetailsInitialCopyWith<$Res> {
  factory _$$ProductDetailsInitialCopyWith(_$ProductDetailsInitial value,
          $Res Function(_$ProductDetailsInitial) then) =
      __$$ProductDetailsInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProductDetailsInitialCopyWithImpl<$Res>
    extends _$ProductDetailsStateCopyWithImpl<$Res, _$ProductDetailsInitial>
    implements _$$ProductDetailsInitialCopyWith<$Res> {
  __$$ProductDetailsInitialCopyWithImpl(_$ProductDetailsInitial _value,
      $Res Function(_$ProductDetailsInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProductDetailsInitial implements ProductDetailsInitial {
  const _$ProductDetailsInitial();

  @override
  String toString() {
    return 'ProductDetailsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProductDetailsInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ProductDetails product) withSuccess,
    required TResult Function(GetProductFailure failure) withFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ProductDetails product)? withSuccess,
    TResult? Function(GetProductFailure failure)? withFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ProductDetails product)? withSuccess,
    TResult Function(GetProductFailure failure)? withFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductDetailsInitial value) initial,
    required TResult Function(ProductDetailsLoading value) loading,
    required TResult Function(ProductDetailsWithSuccess value) withSuccess,
    required TResult Function(ProductDetailsWithFailure value) withFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductDetailsInitial value)? initial,
    TResult? Function(ProductDetailsLoading value)? loading,
    TResult? Function(ProductDetailsWithSuccess value)? withSuccess,
    TResult? Function(ProductDetailsWithFailure value)? withFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductDetailsInitial value)? initial,
    TResult Function(ProductDetailsLoading value)? loading,
    TResult Function(ProductDetailsWithSuccess value)? withSuccess,
    TResult Function(ProductDetailsWithFailure value)? withFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ProductDetailsInitial implements ProductDetailsState {
  const factory ProductDetailsInitial() = _$ProductDetailsInitial;
}

/// @nodoc
abstract class _$$ProductDetailsLoadingCopyWith<$Res> {
  factory _$$ProductDetailsLoadingCopyWith(_$ProductDetailsLoading value,
          $Res Function(_$ProductDetailsLoading) then) =
      __$$ProductDetailsLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProductDetailsLoadingCopyWithImpl<$Res>
    extends _$ProductDetailsStateCopyWithImpl<$Res, _$ProductDetailsLoading>
    implements _$$ProductDetailsLoadingCopyWith<$Res> {
  __$$ProductDetailsLoadingCopyWithImpl(_$ProductDetailsLoading _value,
      $Res Function(_$ProductDetailsLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProductDetailsLoading implements ProductDetailsLoading {
  const _$ProductDetailsLoading();

  @override
  String toString() {
    return 'ProductDetailsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProductDetailsLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ProductDetails product) withSuccess,
    required TResult Function(GetProductFailure failure) withFailure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ProductDetails product)? withSuccess,
    TResult? Function(GetProductFailure failure)? withFailure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ProductDetails product)? withSuccess,
    TResult Function(GetProductFailure failure)? withFailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductDetailsInitial value) initial,
    required TResult Function(ProductDetailsLoading value) loading,
    required TResult Function(ProductDetailsWithSuccess value) withSuccess,
    required TResult Function(ProductDetailsWithFailure value) withFailure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductDetailsInitial value)? initial,
    TResult? Function(ProductDetailsLoading value)? loading,
    TResult? Function(ProductDetailsWithSuccess value)? withSuccess,
    TResult? Function(ProductDetailsWithFailure value)? withFailure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductDetailsInitial value)? initial,
    TResult Function(ProductDetailsLoading value)? loading,
    TResult Function(ProductDetailsWithSuccess value)? withSuccess,
    TResult Function(ProductDetailsWithFailure value)? withFailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ProductDetailsLoading implements ProductDetailsState {
  const factory ProductDetailsLoading() = _$ProductDetailsLoading;
}

/// @nodoc
abstract class _$$ProductDetailsWithSuccessCopyWith<$Res> {
  factory _$$ProductDetailsWithSuccessCopyWith(
          _$ProductDetailsWithSuccess value,
          $Res Function(_$ProductDetailsWithSuccess) then) =
      __$$ProductDetailsWithSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductDetails product});
}

/// @nodoc
class __$$ProductDetailsWithSuccessCopyWithImpl<$Res>
    extends _$ProductDetailsStateCopyWithImpl<$Res, _$ProductDetailsWithSuccess>
    implements _$$ProductDetailsWithSuccessCopyWith<$Res> {
  __$$ProductDetailsWithSuccessCopyWithImpl(_$ProductDetailsWithSuccess _value,
      $Res Function(_$ProductDetailsWithSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_$ProductDetailsWithSuccess(
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductDetails,
    ));
  }
}

/// @nodoc

class _$ProductDetailsWithSuccess implements ProductDetailsWithSuccess {
  const _$ProductDetailsWithSuccess(this.product);

  @override
  final ProductDetails product;

  @override
  String toString() {
    return 'ProductDetailsState.withSuccess(product: $product)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDetailsWithSuccess &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductDetailsWithSuccessCopyWith<_$ProductDetailsWithSuccess>
      get copyWith => __$$ProductDetailsWithSuccessCopyWithImpl<
          _$ProductDetailsWithSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ProductDetails product) withSuccess,
    required TResult Function(GetProductFailure failure) withFailure,
  }) {
    return withSuccess(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ProductDetails product)? withSuccess,
    TResult? Function(GetProductFailure failure)? withFailure,
  }) {
    return withSuccess?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ProductDetails product)? withSuccess,
    TResult Function(GetProductFailure failure)? withFailure,
    required TResult orElse(),
  }) {
    if (withSuccess != null) {
      return withSuccess(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductDetailsInitial value) initial,
    required TResult Function(ProductDetailsLoading value) loading,
    required TResult Function(ProductDetailsWithSuccess value) withSuccess,
    required TResult Function(ProductDetailsWithFailure value) withFailure,
  }) {
    return withSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductDetailsInitial value)? initial,
    TResult? Function(ProductDetailsLoading value)? loading,
    TResult? Function(ProductDetailsWithSuccess value)? withSuccess,
    TResult? Function(ProductDetailsWithFailure value)? withFailure,
  }) {
    return withSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductDetailsInitial value)? initial,
    TResult Function(ProductDetailsLoading value)? loading,
    TResult Function(ProductDetailsWithSuccess value)? withSuccess,
    TResult Function(ProductDetailsWithFailure value)? withFailure,
    required TResult orElse(),
  }) {
    if (withSuccess != null) {
      return withSuccess(this);
    }
    return orElse();
  }
}

abstract class ProductDetailsWithSuccess implements ProductDetailsState {
  const factory ProductDetailsWithSuccess(final ProductDetails product) =
      _$ProductDetailsWithSuccess;

  ProductDetails get product;
  @JsonKey(ignore: true)
  _$$ProductDetailsWithSuccessCopyWith<_$ProductDetailsWithSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProductDetailsWithFailureCopyWith<$Res> {
  factory _$$ProductDetailsWithFailureCopyWith(
          _$ProductDetailsWithFailure value,
          $Res Function(_$ProductDetailsWithFailure) then) =
      __$$ProductDetailsWithFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({GetProductFailure failure});

  $GetProductFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$ProductDetailsWithFailureCopyWithImpl<$Res>
    extends _$ProductDetailsStateCopyWithImpl<$Res, _$ProductDetailsWithFailure>
    implements _$$ProductDetailsWithFailureCopyWith<$Res> {
  __$$ProductDetailsWithFailureCopyWithImpl(_$ProductDetailsWithFailure _value,
      $Res Function(_$ProductDetailsWithFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$ProductDetailsWithFailure(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as GetProductFailure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $GetProductFailureCopyWith<$Res> get failure {
    return $GetProductFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$ProductDetailsWithFailure implements ProductDetailsWithFailure {
  const _$ProductDetailsWithFailure(this.failure);

  @override
  final GetProductFailure failure;

  @override
  String toString() {
    return 'ProductDetailsState.withFailure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDetailsWithFailure &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductDetailsWithFailureCopyWith<_$ProductDetailsWithFailure>
      get copyWith => __$$ProductDetailsWithFailureCopyWithImpl<
          _$ProductDetailsWithFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ProductDetails product) withSuccess,
    required TResult Function(GetProductFailure failure) withFailure,
  }) {
    return withFailure(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ProductDetails product)? withSuccess,
    TResult? Function(GetProductFailure failure)? withFailure,
  }) {
    return withFailure?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ProductDetails product)? withSuccess,
    TResult Function(GetProductFailure failure)? withFailure,
    required TResult orElse(),
  }) {
    if (withFailure != null) {
      return withFailure(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductDetailsInitial value) initial,
    required TResult Function(ProductDetailsLoading value) loading,
    required TResult Function(ProductDetailsWithSuccess value) withSuccess,
    required TResult Function(ProductDetailsWithFailure value) withFailure,
  }) {
    return withFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductDetailsInitial value)? initial,
    TResult? Function(ProductDetailsLoading value)? loading,
    TResult? Function(ProductDetailsWithSuccess value)? withSuccess,
    TResult? Function(ProductDetailsWithFailure value)? withFailure,
  }) {
    return withFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductDetailsInitial value)? initial,
    TResult Function(ProductDetailsLoading value)? loading,
    TResult Function(ProductDetailsWithSuccess value)? withSuccess,
    TResult Function(ProductDetailsWithFailure value)? withFailure,
    required TResult orElse(),
  }) {
    if (withFailure != null) {
      return withFailure(this);
    }
    return orElse();
  }
}

abstract class ProductDetailsWithFailure implements ProductDetailsState {
  const factory ProductDetailsWithFailure(final GetProductFailure failure) =
      _$ProductDetailsWithFailure;

  GetProductFailure get failure;
  @JsonKey(ignore: true)
  _$$ProductDetailsWithFailureCopyWith<_$ProductDetailsWithFailure>
      get copyWith => throw _privateConstructorUsedError;
}
