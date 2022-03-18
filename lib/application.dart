import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

import '/app/providers/login_provider.dart';
import 'app/modules/root/controllers/account_controller.dart';
import 'app/modules/root/controllers/category_controller.dart';
import 'app/modules/root/controllers/home_controller.dart';
import 'app/modules/root/controllers/shop_cart_controller.dart';
import '/app/modules/root/controllers/root_controller.dart';
import 'app/modules/root/providers/member_provider.dart';

class Application {
  static Future<void> init() async {
    await Get.putAsync(() => AppController().init());
    Get.put(LoginProvider());
    Get.put(RootController());
    Get.put(HomeController());
    Get.put(CategoryController());
    Get.put(ShopCartController());
    Get.put(AccountController());
    Get.put(MemberProvider());
  }
}

class AppController extends GetxService {
  Future<SharedPreferences> init() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp;
  }
}
