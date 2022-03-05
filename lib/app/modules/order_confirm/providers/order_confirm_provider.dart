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
    final response = await get(defaultAddressUrl);
    return AddressInfo.fromJson(response.body);
  }

  //product
  Future<OrderFirmResponse> getOrderFirm(Map data) async {
    final response = await post(orderConfirmUrl, data);
    print(response.body.toString());
    return OrderFirmResponse.fromJson(response.body);
  }
  //积分
  //优惠券
}
