import 'dart:convert';

import '/app/models/response_model.dart';

import '/app/models/cart_model.dart';

import 'base_provider.dart';

class CartProvider extends BaseProvider {
  static const String addCartUrl = "/v1/order/cart/add";
  @override
  void onInit() {
    super.onInit();
  }

  Future<ReponseData> addCart(Map data) async {
    final response = await post(addCartUrl, jsonEncode(data));
    print(response.body.toString());
    return ReponseData.fromJson(response.body);
  }
}
