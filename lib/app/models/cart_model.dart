import 'dart:convert';

class CartResponse {
  int? code;
  List<Cart>? data;
  String? detail;
  CartResponse({this.code, this.data, this.detail});

  CartResponse.fromJson(Map<String, dynamic> json) {
    code = json["code"];
    detail = json["detail"];
    if (json["data"] != null) {
      data = <Cart>[];
      json["data"].forEach((v) {
        data?.add(Cart.formJson(v));
      });
    }
  }
}

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
    // attribute = json["product_attr"];
    if (json["product_attr"] != null) {
      List<String> arr = [];
      List<dynamic> attr = jsonDecode(json["product_attr"]);
      attr.forEach((v) {
        arr.add(v["value"]!);
      });
      attribute = arr.join("/");
    }
    price = json["price"] + 0.00;
    quantity = json["quantity"];
    memberId = json["member_id"];
    check = true;
  }
}
