import '/app/models/order_confirm_model.dart';

import '/app/models/address_model.dart';

import '../../../providers/base_provider.dart';

class OrderConfirmProvider extends BaseProvider {
  static const String defaultAddressUrl = "/member/address/info";
  static const String orderConfirmUrl = "/order/confirm";
  @override
  void onInit() {
    super.onInit();
  }

  //default Address
  Future<AddressInfo> getDefaultAddress() async {
    final response = await get(defaultAddressUrl, query: {"id": "-1"});
    print(response.body);
    return AddressInfo.fromJson(response.body);
  }

  //product
  Future<OrderFirmResponse> getOrderFirm(Map? data) async {
    // if (data == null) {
    return OrderFirmResponse(code: 200, data: [], detail: "ok");
    // }
    final response = await post(orderConfirmUrl, data);
    print(response.body);
    return OrderFirmResponse.fromJson(response.body);
  }
  //积分
  //优惠券
}
