import 'package:get/get.dart';
import '/app/modules/root/controllers/account_controller.dart';
import '/app/providers/login_provider.dart';
import '../../root/providers/member_provider.dart';
import '/app/routes/app_pages.dart';

class SettingController extends GetxController {
  final LoginProvider loginProvider = Get.find<LoginProvider>();
  final AccountController accountController = Get.find<AccountController>();

  List<Map> settingsTitle = [
    {"name": "address_setting".tr, "url": Routes.ADDRESS_BOOK},
    {"name": "account_security".tr, "url": Routes.ACCOUNT_SECURITY},
    {"name": "payment_options".tr, "url": Routes.PAYMENT_OPTIONS},
    {"name": "privacy_policy".tr, "url": Routes.PRIVACY_POLICY},
    {"name": "language".tr, "url": Routes.LANGUAGE},
    {"name": "country_region".tr, "url": Routes.COUNTRY_REGION},
    {"name": "about_me".tr, "url": Routes.ABOUT_ME},
  ];

  @override
  void onInit() {
    super.onInit();
  }

  void onSignOut() {
    loginProvider.cleanLogin();
    accountController.setMember();
    Get.back();
  }

  void onClick(int index) {
    if (index == 0 || index == 1 || index == 2) {
      if (loginProvider.isLogin() == false) {
        Get.toNamed(Routes.LOGIN);
        return;
      }

      Get.toNamed(settingsTitle[index]["url"]);
    } else {
      Get.toNamed(settingsTitle[index]["url"]);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
