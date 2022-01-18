import 'package:get/get.dart';
import 'package:mallxx_app/app/providers/login_provider.dart';

class SettingController extends GetxController {
  final LoginProvider loginProvider = Get.find<LoginProvider>();

  List<Map> settingsTitle = [
    {"id": 1, "name": "退出"},
  ];

  @override
  void onInit() {
    super.onInit();
    loginProvider.cleanLogin();
    Get.back(result: "out");
    print("SettingController");
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
