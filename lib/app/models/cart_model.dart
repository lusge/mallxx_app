import 'package:flutter/foundation.dart';

class Cart {
  int productId;
  int cartId;
  String productName;
  String productImg;
  String attribute;
  double price;
  int number;
  bool check = true; //number

  Cart(
      {required this.productId,
      required this.cartId,
      required this.productName,
      required this.productImg,
      required this.attribute,
      required this.price,
      required this.number,
      required this.check});

  factory Cart.formJson(Map<String, dynamic> json) {
    return Cart(
      productId: json["product_id"],
      cartId: json["id"],
      productName: json["product_name"],
      productImg: json["product_image"],
      attribute: json["attribute"],
      price: json["price"],
      number: json["number"],
      check: true,
    );
  }
}
