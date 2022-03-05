import 'package:get/get.dart';
import '/app/models/order_confirm_model.dart';
import '../providers/order_confirm_provider.dart';
import '/app/models/address_model.dart';
import '/app/routes/app_pages.dart';

class OrderConfirmController extends GetxController {
  Map? arg = Get.arguments;

  final OrderConfirmProvider orderConfirmProvider =
      Get.put(OrderConfirmProvider());

  static const List<Map<String, dynamic>> payMethods = [
    {
      "name": "支付宝",
      "id": 1,
    },
    {
      "name": "微信",
      "id": 2,
    }
  ];

  final isLoading = true.obs;

  final isIntegralDeduction = true.obs;
  final payMethodName = (payMethods[0]["name"].toString()).obs;
  final payMethodId = (payMethods[0]["id"] as int).obs;

  final defaultAddress = Address().obs;
  final buyProductList = RxList<OrderFirmProduct>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    print(arg);
    if (arg == null) {
      Get.snackbar("hint".tr, "data_failed".tr);
    }
    getData();
  }

  @override
  void onClose() {
    orderConfirmProvider.dispose();
  }

  void onAddress() async {
    var address =
        await Get.toNamed(Routes.ADDRESS_BOOK, arguments: {"isReturn": true});
    if (address != null) {
      defaultAddress.value = address;
    }
  }

  void getData() async {
    await Future.wait<dynamic>([
      orderConfirmProvider.getDefaultAddress(),
      orderConfirmProvider.getOrderFirm(arg!)
    ]).then((value) {
      isLoading.toggle();

      AddressInfo addressInfo = value[0];
      if (addressInfo.code == 200) {
        defaultAddress.value = addressInfo.data!;
      }

      OrderFirmResponse orderfirmResponse = value[1];
      if (orderfirmResponse.code == 200) {
        buyProductList.value = orderfirmResponse.data!;
      }
    });
  }

  void onIntegral() {}

  void onPayMethod() {}

  void onCoupon() {}

  void changePayMethod(Map<String, dynamic> mp) {
    payMethodId.value = mp["id"];
    payMethodName.value = mp["name"];
  }
}
