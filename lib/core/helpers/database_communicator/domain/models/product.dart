import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
//

class Product {
  final String unit;
  final String name;
  final String quantity;
  final String barCode;
  final String guid;
  Product({
    required this.unit,
    required this.name,
    required this.quantity,
    required this.barCode,
    required this.guid,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'unit': unit,
      'name': name,
      'quantity': quantity,
      'barCode': barCode,
      'guid': guid,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        guid: map["GUID"] as String? ?? "",
        unit: map["Unity"] as String? ?? "",
        name: map["Name"] as String? ?? "",
        quantity: map["Qty"] as String? ?? "",
        barCode: map["BarCode"] as String? ?? "0");
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Subject(name: $name, quantity: $quantity)';
  }
}
