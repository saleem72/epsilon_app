// ignore_for_file: public_member_api_docs, sort_constructors_first
//

/*
  """select 
  mm.code as code,
  mm.Name as name ,
  mm.enduser a,
  mm.unity as unit1 , 
  mm.unit2 as unit2 , 
  mm.enduser2 as enduser2, 

  bb.barcode as barcode , 
  bb.matunit as unit , 
  st.name as st_name ,
  from mt000 mm 
  inner join MatExBarcode000 bb on mm.guid=bb.Matguid 
  inner join ms000 ms on ms.matguid=mm.guid 
  inner join st000 st on st.guid=ms.StoreGUID 
  where bb.BarCode='*****134'
  """;

*/

import 'dart:convert';

import 'package:epsilon_app/core/errors/exceptions/app_exceptions.dart';

class ProductItem {
  final String code;
  final String name;
  final String enduser;
  final String unity;
  final String unit2;
  final String enduser2;
  final String barcode;
  final String matunit;
  final String storeName;
  final String perStoreQty;

  ProductItem({
    required this.code,
    required this.name,
    required this.enduser,
    required this.unity,
    required this.unit2,
    required this.enduser2,
    required this.barcode,
    required this.matunit,
    required this.storeName,
    required this.perStoreQty,

    // required this.image,
  });

  Map<String, String> toMap() {
    return <String, String>{
      'code': code,
      'name': name,
      'enduser': enduser,
      'unity': unity,
      'unit2': unit2,
      'enduser2': enduser2,
      'barcode': barcode,
      'matunit': matunit,
      'store': storeName,
      // 'bmName': image,
    };
  }

  factory ProductItem.fromMap(Map<String, String> map) {
    /*
      mm.code as code,
  mm.Name as name ,
  mm.enduser a,
  mm.unity as unit1 , 
  mm.unit2 as unit2 , 
  mm.enduser2 as enduser2, 

  bb.barcode as barcode , 
  bb.matunit as unit , 
  st.name as st_name ,
  bm.name as bm_name 
    */
    return ProductItem(
        code: map['code'] ?? '',
        name: map['name'] ?? '',
        enduser: map['a'] ?? '',
        unity: map['unit1'] ?? '',
        unit2: map['unit2'] ?? '',
        enduser2: map['enduser2'] ?? '',
        barcode: map['barcode'] ?? '',
        matunit: map['matunit'] ?? '',
        storeName: map['store'] ?? '',
        perStoreQty: map['perStoreQty'] ?? ''
        // image: map['bm_name'] ?? '',
        );
  }

  String toJson() => json.encode(toMap());

  factory ProductItem.fromJson(String source) =>
      ProductItem.fromMap(json.decode(source) as Map<String, String>);

  @override
  String toString() {
    return 'MaterialDetails(code: $code, name: $name, enduser: $enduser, unity: $unity, unit2: $unit2, enduser2: $enduser2, stName: $storeName)';
  }

  ProductDetails toDetails() {
    return ProductDetails(
      code: code,
      name: name,
      enduser: enduser,
      unity: unity,
      unit2: unit2,
      enduser2: enduser2,
      barcode: barcode,
      matunit: matunit,
      stores: [StoreQuntity(store: storeName, quantity: perStoreQty)],
    );
  }
}

class ProductDetails {
  final String code;
  final String name;
  final String enduser;
  final String unity;
  final String unit2;
  final String enduser2;
  final String barcode;
  final String matunit;
  final List<StoreQuntity> stores;
  // final String image;
  ProductDetails({
    required this.code,
    required this.name,
    required this.enduser,
    required this.unity,
    required this.unit2,
    required this.enduser2,
    required this.barcode,
    required this.matunit,
    required this.stores,
    // required this.image,
  });

  factory ProductDetails.itemsList(List<ProductItem> items) {
    final stores = items
        .map((e) => e.storeName)
        .toList()
        .where((element) => element.isNotEmpty)
        .toList();
    final perStore = items
        .map((e) => e.perStoreQty)
        .toList()
        .where((element) => element.isNotEmpty)
        .toList();

    final stuff = items
        .map((e) => StoreQuntity(store: e.storeName, quantity: e.perStoreQty))
        .toList()
        .where((element) =>
            element.store.isNotEmpty && element.quantity.isNotEmpty)
        .toList();
    if (items.isNotEmpty) {
      final result = items.first.toDetails();
      return result.copyWith(stores: stuff);
    }

    throw const BadRequestException();
  }

  ProductDetails copyWith({
    String? code,
    String? name,
    String? enduser,
    String? unity,
    String? unit2,
    String? enduser2,
    String? barcode,
    String? matunit,
    List<StoreQuntity>? stores,
  }) {
    return ProductDetails(
      code: code ?? this.code,
      name: name ?? this.name,
      enduser: enduser ?? this.enduser,
      unity: unity ?? this.unity,
      unit2: unit2 ?? this.unit2,
      enduser2: enduser2 ?? this.enduser2,
      barcode: barcode ?? this.barcode,
      matunit: matunit ?? this.matunit,
      stores: stores ?? this.stores,
    );
  }
}

class StoreQuntity {
  final String store;
  final String quantity;

  StoreQuntity({
    required this.store,
    required this.quantity,
  });
}
