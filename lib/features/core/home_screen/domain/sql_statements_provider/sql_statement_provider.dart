//

abstract class SqlStatmentProvider {
  Future<String> statementForBarcode(String barcode);
  Future<String> statementForSerial(String serial);
}
