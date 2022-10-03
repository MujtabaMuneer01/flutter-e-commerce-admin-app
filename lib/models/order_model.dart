class OrderModel {
  String? clientName, date;
  num? total, productsInCart;
  List? products;
  OrderModel(
      {required this.clientName,
      required this.date,
      required this.total,
      required this.productsInCart,
      required this.products});
  Map<String, dynamic> toMap() => {
        'clientName': clientName,
        'date': date,
        'total': total,
        'productsInCart': productsInCart,
        'products': products,
      };
}
