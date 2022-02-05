import 'package:flutter/foundation.dart';

class Cart {
  int? id;
  int? productId;
  String? productName;
  String? productPic;
  String? attribute;
  double? price;
  int? quantity;
  int? memberId;
  bool? check = true; //number

  Cart({
    this.id,
    this.productId,
    this.productName,
    this.productPic,
    this.attribute,
    this.price,
    this.quantity,
    this.memberId,
    this.check,
  });

  Cart.formJson(Map<String, dynamic> json) {
    productId = json["product_id"];
    productName = json["product_name"];
    id = json["id"];
    productPic = json["product_pic"];
    attribute = json["sss"];
    price = json["price"];
    quantity = json["quantity"];
    memberId = json["member_id"];
    check = true;
  }
}
