
import 'package:sbbwu_session14_sqlite/utility/constants.dart';

class Product {
  int? id;
  late String title;
  late String brand;
  late String price;
  late String color;
  late String size;

  Product({
    this.id,
    required this.title,
    required this.brand,
    required this.price,
    required this.color,
    required this.size,
  });

//Convert Product object to Map
  Map<String, dynamic> toMap() {

    return {
      colId: id,
      colTitle: title,
      colBrand: brand,
      colPrice: price,
      colColor: color,
      colSize: size,
    };
  }

// Convert map to product object
  Product.fromMap(Map<String, dynamic> map){

    id = map[colId];
    title = map[colTitle];
    brand = map[colBrand];
    price = map[colPrice];
    color = map[colColor];
    size = map[colSize];
  }
}
