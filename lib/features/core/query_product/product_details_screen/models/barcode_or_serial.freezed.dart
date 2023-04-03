// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'barcode_or_serial.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BarcodeOrSerial {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String barcode) barcode,
    required TResult Function(String serial) serial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String barcode)? barcode,
    TResult? Function(String serial)? serial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String barcode)? barcode,
    TResult Function(String serial)? serial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Barcode value) barcode,
    required TResult Function(_Serial value) serial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Barcode value)? barcode,
    TResult? Function(_Serial value)? serial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Barcode value)? barcode,
    TResult Function(_Serial value)? serial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BarcodeOrSerialCopyWith<$Res> {
  factory $BarcodeOrSerialCopyWith(
          BarcodeOrSerial value, $Res Function(BarcodeOrSerial) then) =
      _$BarcodeOrSerialCopyWithImpl<$Res, BarcodeOrSerial>;
}

/// @nodoc
class _$BarcodeOrSerialCopyWithImpl<$Res, $Val extends BarcodeOrSerial>
    implements $BarcodeOrSerialCopyWith<$Res> {
  _$BarcodeOrSerialCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_BarcodeCopyWith<$Res> {
  factory _$$_BarcodeCopyWith(
          _$_Barcode value, $Res Function(_$_Barcode) then) =
      __$$_BarcodeCopyWithImpl<$Res>;
  @useResult
  $Res call({String barcode});
}

/// @nodoc
class __$$_BarcodeCopyWithImpl<$Res>
    extends _$BarcodeOrSerialCopyWithImpl<$Res, _$_Barcode>
    implements _$$_BarcodeCopyWith<$Res> {
  __$$_BarcodeCopyWithImpl(_$_Barcode _value, $Res Function(_$_Barcode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barcode = null,
  }) {
    return _then(_$_Barcode(
      barcode: null == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Barcode implements _Barcode {
  const _$_Barcode({required this.barcode});

  @override
  final String barcode;

  @override
  String toString() {
    return 'BarcodeOrSerial.barcode(barcode: $barcode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Barcode &&
            (identical(other.barcode, barcode) || other.barcode == barcode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, barcode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BarcodeCopyWith<_$_Barcode> get copyWith =>
      __$$_BarcodeCopyWithImpl<_$_Barcode>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String barcode) barcode,
    required TResult Function(String serial) serial,
  }) {
    return barcode(this.barcode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String barcode)? barcode,
    TResult? Function(String serial)? serial,
  }) {
    return barcode?.call(this.barcode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String barcode)? barcode,
    TResult Function(String serial)? serial,
    required TResult orElse(),
  }) {
    if (barcode != null) {
      return barcode(this.barcode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Barcode value) barcode,
    required TResult Function(_Serial value) serial,
  }) {
    return barcode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Barcode value)? barcode,
    TResult? Function(_Serial value)? serial,
  }) {
    return barcode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Barcode value)? barcode,
    TResult Function(_Serial value)? serial,
    required TResult orElse(),
  }) {
    if (barcode != null) {
      return barcode(this);
    }
    return orElse();
  }
}

abstract class _Barcode implements BarcodeOrSerial {
  const factory _Barcode({required final String barcode}) = _$_Barcode;

  String get barcode;
  @JsonKey(ignore: true)
  _$$_BarcodeCopyWith<_$_Barcode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SerialCopyWith<$Res> {
  factory _$$_SerialCopyWith(_$_Serial value, $Res Function(_$_Serial) then) =
      __$$_SerialCopyWithImpl<$Res>;
  @useResult
  $Res call({String serial});
}

/// @nodoc
class __$$_SerialCopyWithImpl<$Res>
    extends _$BarcodeOrSerialCopyWithImpl<$Res, _$_Serial>
    implements _$$_SerialCopyWith<$Res> {
  __$$_SerialCopyWithImpl(_$_Serial _value, $Res Function(_$_Serial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serial = null,
  }) {
    return _then(_$_Serial(
      serial: null == serial
          ? _value.serial
          : serial // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Serial implements _Serial {
  const _$_Serial({required this.serial});

  @override
  final String serial;

  @override
  String toString() {
    return 'BarcodeOrSerial.serial(serial: $serial)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Serial &&
            (identical(other.serial, serial) || other.serial == serial));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serial);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SerialCopyWith<_$_Serial> get copyWith =>
      __$$_SerialCopyWithImpl<_$_Serial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String barcode) barcode,
    required TResult Function(String serial) serial,
  }) {
    return serial(this.serial);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String barcode)? barcode,
    TResult? Function(String serial)? serial,
  }) {
    return serial?.call(this.serial);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String barcode)? barcode,
    TResult Function(String serial)? serial,
    required TResult orElse(),
  }) {
    if (serial != null) {
      return serial(this.serial);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Barcode value) barcode,
    required TResult Function(_Serial value) serial,
  }) {
    return serial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Barcode value)? barcode,
    TResult? Function(_Serial value)? serial,
  }) {
    return serial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Barcode value)? barcode,
    TResult Function(_Serial value)? serial,
    required TResult orElse(),
  }) {
    if (serial != null) {
      return serial(this);
    }
    return orElse();
  }
}

abstract class _Serial implements BarcodeOrSerial {
  const factory _Serial({required final String serial}) = _$_Serial;

  String get serial;
  @JsonKey(ignore: true)
  _$$_SerialCopyWith<_$_Serial> get copyWith =>
      throw _privateConstructorUsedError;
}
