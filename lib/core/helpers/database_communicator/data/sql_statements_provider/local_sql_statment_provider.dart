//

import '../../domain/sql_statements_provider/sql_statement_provider.dart';

class LocalSqlStamentProvider implements SqlStatmentProvider {
  @override
  Future<String> statementForBarcode(String barcode) async => """select 
  mm.code as code,mm.Name as name ,mm.enduser price,mm.unity as unit1 , mm.unit2 as unit2 , mm.enduser2 as enduser2,
  bb.barcode as barcode , bb.matunit as unit , 
  st.name as store, ms.Qty as perStoreQty
  from mt000 mm 
  inner join MatExBarcode000 bb on mm.guid=bb.Matguid 
  left join ms000 ms on ms.matguid=mm.guid 
  left join st000 st on st.guid=ms.StoreGUID
      where bb.BarCode='$barcode'
      """;

  @override
  Future<String> statementForSerial(String serial) async {
    return """select 
  mm.code as code,mm.Name as name ,mm.enduser price,mm.unity as unit1 , mm.unit2 as unit2 , mm.enduser2 as enduser2,
  bb.barcode as barcode , bb.matunit as unit , 
  st.name as store, ms.Qty as perStoreQty
  from mt000 mm 
  inner join MatExBarcode000 bb on mm.guid=bb.Matguid 
  left join ms000 ms on ms.matguid=mm.guid 
  left join st000 st on st.guid=ms.StoreGUID
  where mm.code='$serial'
  """;
  }
}
