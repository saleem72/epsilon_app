//

import 'package:freezed_annotation/freezed_annotation.dart';

part 'barcode_or_serial.freezed.dart';

@freezed
class BarcodeOrSerial with _$BarcodeOrSerial {
  const factory BarcodeOrSerial.barcode({required String barcode}) = _Barcode;
  const factory BarcodeOrSerial.serial({required String serial}) = _Serial;
}
