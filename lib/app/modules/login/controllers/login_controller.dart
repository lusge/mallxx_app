import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '/app/modules/root/controllers/account_controller.dart';
import '/app/providers/login_provider.dart';
import '../../root/providers/member_provider.dart';

class LoginController extends GetxController {
  late TextEditingController usernameController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  final LoginProvider loginProvider = Get.find<LoginProvider>();
  final MemberProvider memberProvider = Get.find<MemberProvider>();
  final AccountController accountController = Get.find<AccountController>();

  final agreeCheckBox = true.obs;

  final isLogingIn = false.obs;

  void oncheckBoxChanged() {
    agreeCheckBox.toggle();
  }

  void onLogin() async {
    if (agreeCheckBox.isFalse) {
      Fluttertoast.showToast(
          msg: "please_tick_agree_login".tr, gravity: ToastGravity.TOP);
      return;
    }

    String username = usernameController.text;
    String password = passwordController.text;

    if (username == "") {
      Fluttertoast.showToast(
          msg: "enter_username".tr, gravity: ToastGravity.CENTER);
      return;
    }

    if (password == "") {
      Fluttertoast.showToast(
          msg: "enter_password".tr, gravity: ToastGravity.CENTER);
      return;
    }
    isLogingIn.value = true;
    var result =
        await memberProvider.login(username: username, password: password);

    if (result.code != null) {
      if (result.code == 200) {
        loginProvider.saveLogin(result.data!);
        Get.back(
          result: "OK",
        );
        accountController.setMember();
      } else {
        Fluttertoast.showToast(
            msg: result.detail!, gravity: ToastGravity.CENTER);
        isLogingIn.value = false;
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
