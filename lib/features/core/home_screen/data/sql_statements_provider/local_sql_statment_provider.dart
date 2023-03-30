//

import '../../domain/sql_statements_provider/sql_statement_provider.dart';

class LocalSqlStamentProvider implements SqlStatmentProvider {
  @override
  Future<String> statementForBarcode(String barcode) async => """select 
      mm.code as code,
  mm.Name as name ,
  mm.enduser a,
  mm.unity as unit1 , 
  mm.unit2 as unit2 , 
  mm.enduser2 as enduser2, 

  bb.barcode as barcode , 
  bb.matunit as unit 
  from mt000 mm 
  inner join MatExBarcode000 bb on mm.guid=bb.Matguid 
      where bb.BarCode='$barcode'
      """;

  @override
  Future<String> statementForSerial(String serial) async => """select 
  mm.code as code,
  mm.Name as name ,
  mm.enduser a,
  mm.unity as unit1 , 
  mm.unit2 as unit2 , 
  mm.enduser2 as enduser2, 

  bb.barcode as barcode , 
  bb.matunit as unit 
  from mt000 mm 
  inner join MatExBarcode000 bb on mm.guid=bb.Matguid 
  where mm.code='$serial'
  """;
}
