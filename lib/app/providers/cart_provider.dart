import 'dart:convert';

import '/app/models/response_model.dart';

import '/app/models/cart_model.dart';

import 'base_provider.dart';

class CartProvider extends BaseProvider {
  static const String addCartUrl = "/v1/order/cart/add";
  static const String getCartListUrl = "/v1/order/cart/list";
  static const String modiryQuantityUrl = "/v1/order/cart/update/quantity";
  static const String deleteCartUrl = "/v1/order/cart/del";
  @override
  void onInit() {
    super.onInit();
  }

  Future<ResponseData> addCart(Map data) async {
    final response = await post(addCartUrl, jsonEncode(data));
    return ResponseData.fromJson(response.body);
  }

  Future<CartResponse> getCartList() async {
    final response = await get(getCartListUrl);
    return CartResponse.fromJson(response.body);
  }

  Future<ResponseData> modifyQuantity(
      {required int id, required int quantity}) async {
    var data = {
      "id": id,
      "quantity": quantity,
    };
    final response = await post(modiryQuantityUrl, jsonEncode(data));
    return ResponseData.fromJson(response.body);
  }

  Future<ResponseData> deleteCart(List<int> ids) async {
    final response = await post(deleteCartUrl, jsonEncode({"ids": ids}));
    return ResponseData.fromJson(response.body);
  }
}
