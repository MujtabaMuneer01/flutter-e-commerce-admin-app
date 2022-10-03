import '../constants/database_constants.dart';

class ProductModel {
  String? name, category;
  List? images;
  num? price, count;
  ProductModel(
      {this.category, this.name, this.images, this.price,  this.count});
  Map<String, dynamic> toMap() => {
     
        productName: name,
        productPrice: price,
        productCategory: category,
        productCount: count,
        productImage: images,
      };

  fromMap(Map<String, dynamic> map) {
    name = map[productName];
    price = map[productPrice];
    category = map[productCategory];
    count = map[productCount];
    images = map[productImage];
  }
}
