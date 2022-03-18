import '/app/models/response_model.dart';

import '/app/models/cart_model.dart';

import '../../../providers/base_provider.dart';

class CartProvider extends BaseProvider {
  static const String getCartListUrl = "/cart/list";
  static const String modiryQuantityUrl = "/cart/modify";
  static const String deleteCartUrl = "/cart/delete";
  @override
  void onInit() {
    super.onInit();
  }

  Future<CartResponse> getCartList() async {
    final response = await get(getCartListUrl, query: {"member_id": "1"});
    print(response.body);
    return CartResponse.fromJson(response.body);
  }

  Future<ResponseData> modifyQuantity(
      {required int id, required int quantity}) async {
    var data = {
      "id": id,
      "quantity": quantity,
    };
    final response = await post(modiryQuantityUrl, data);
    print(response.body);
    return ResponseData.fromJson(response.body);
  }

  Future<ResponseData> deleteCart(List<int> ids) async {
    final response = await post(deleteCartUrl, {"ids": ids});
    print(response.body);
    return ResponseData.fromJson(response.body);
  }
}
