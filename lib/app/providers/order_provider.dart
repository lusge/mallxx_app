import '/app/providers/base_provider.dart';

class OrderProvider extends BaseProvider {
  @override
  void onInit() {
    super.onInit();
  }

  //结算购物车
  void CheckoutCart(List<int> ids) async {}

  //立即购买
  void CheckoutProduct({required int productId, int quantity = 1}) async {}
}
