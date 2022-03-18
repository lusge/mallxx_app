import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Hint {
  static Error(String message) {
    Get.snackbar("hint".tr, message,
        backgroundColor: Colors.red, colorText: Colors.white);
  }
}
