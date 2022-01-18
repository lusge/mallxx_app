import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mallxx_app/app/modules/root/controllers/account_controller.dart';
import '/app/providers/login_provider.dart';
import '/app/providers/member_provider.dart';

class RegisterController extends GetxController {
  late TextEditingController usernameController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  final LoginProvider loginProvider = Get.find<LoginProvider>();
  final AccountController accountController = Get.find<AccountController>();
  final MemberProvider memberProvider = Get.put(MemberProvider());

  final isRegistering = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void onRegister() async {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username == "") {
      Fluttertoast.showToast(
          msg: "enter_username".tr, gravity: ToastGravity.TOP);
      return;
    }

    if (username.length < 6) {
      Fluttertoast.showToast(
          msg: "enter_username".tr, gravity: ToastGravity.TOP);
      return;
    }

    if (password == "") {
      Fluttertoast.showToast(
          msg: "enter_password".tr, gravity: ToastGravity.CENTER);
      return;
    }

    if (password.length < 6) {
      Fluttertoast.showToast(
          msg: "password_langth".tr, gravity: ToastGravity.TOP);
      return;
    }

    isRegistering.value = true;
    var result =
        await memberProvider.register(username: username, password: password);

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
        isRegistering.value = false;
      }
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
