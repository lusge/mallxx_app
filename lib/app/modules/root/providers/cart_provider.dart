import '/app/models/response_model.dart';

import '/app/models/cart_model.dart';

import '../../../providers/base_provider.dart';

class CartProvider extends BaseProvider {
  static const String getCartListUrl = "/order/cart/list";
  static const String modiryQuantityUrl = "/order/cart/update/quantity";
  static const String deleteCartUrl = "/order/cart/del";
  @override
  void onInit() {
    super.onInit();
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
    final response = await post(modiryQuantityUrl, data);
    return ResponseData.fromJson(response.body);
  }

  Future<ResponseData> deleteCart(List<int> ids) async {
    final response = await post(deleteCartUrl, {"ids": ids});
    return ResponseData.fromJson(response.body);
  }
}
