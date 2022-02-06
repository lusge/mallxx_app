import 'package:get/get.dart';

import '../controllers/order_confirm_controller.dart';

class OrderConfirmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderConfirmController>(
      () => OrderConfirmController(),
    );
  }
}
