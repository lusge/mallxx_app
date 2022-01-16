import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

import '/app/providers/login_provider.dart';

class Application {
  static Future<void> init() async {
    await Get.putAsync(() => AppController().init());
    Get.put(LoginProvider());
  }
}

class AppController extends GetxService {
  Future<SharedPreferences> init() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp;
  }
}
