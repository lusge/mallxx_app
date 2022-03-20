import 'package:get/get.dart';

import '/app/providers/login_provider.dart';
import '/app/modules/root/controllers/account_controller.dart';
import '/app/modules/root/controllers/category_controller.dart';
import '/app/modules/root/controllers/home_controller.dart';
import '/app/modules/root/controllers/shop_cart_controller.dart';
import '/app/modules/root/controllers/root_controller.dart';
import '/app/modules/root/providers/member_provider.dart';
import '../providers/category_provider.dart';
import '../controllers/root_controller.dart';
import '../providers/product_provider.dart';
import '../providers/advertisement_provider.dart';
import '../providers/cart_provider.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(
      () => RootController(),
    );
    Get.lazyPut<AccountController>(
      () => AccountController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );

    Get.lazyPut<CategoryController>(
      () => CategoryController(),
    );

    Get.lazyPut<ShopCartController>(
      () => ShopCartController(),
    );

    Get.lazyPut<ShopCartController>(
      () => ShopCartController(),
    );

    Get.put(LoginProvider());
    Get.put(MemberProvider());
    Get.put(CategoryProvider());
    Get.put(AdvertisementProvider());
    Get.put(ProductProvider());
    Get.put(CartProvider());
  }
}
