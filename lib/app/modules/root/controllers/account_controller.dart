import 'package:get/get.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '/app/models/member_model.dart';
import '/app/models/product_model.dart';
import '/app/providers/login_provider.dart';

class AccountController extends GetxController {
  final EasyRefreshController easyRefreshController = EasyRefreshController();

  final LoginProvider loginProvider = Get.find<LoginProvider>();

  final productList = RxList<Product>();

  final isLoding = true.obs;

  final member = Member().obs;

  @override
  void onInit() {
    setMember();
    super.onInit();
  }

  void setMember() {
    if (loginProvider.getMember() != null) {
      member.value = loginProvider.getMember()!;
    } else {
      member.value = Member(); //设置成空
    }
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    easyRefreshController.dispose();
    super.onClose();
  }
}
