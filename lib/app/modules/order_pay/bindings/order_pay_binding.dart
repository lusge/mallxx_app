import 'package:get/get.dart';

import '../controllers/order_pay_controller.dart';

class OrderPayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderPayController>(
      () => OrderPayController(),
    );
  }
}
