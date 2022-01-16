import 'package:get/get.dart';

import 'package:mallxx_app/app/modules/root/controllers/account_controller.dart';
import 'package:mallxx_app/app/modules/root/controllers/category_controller.dart';
import 'package:mallxx_app/app/modules/root/controllers/home_controller.dart';
import 'package:mallxx_app/app/modules/root/controllers/shop_cart_controller.dart';

import '../controllers/root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountController>(
      () => AccountController(),
    );
    Get.lazyPut<ShopCartController>(
      () => ShopCartController(),
    );
    Get.lazyPut<CategoryController>(
      () => CategoryController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<RootController>(
      () => RootController(),
    );
  }
}
