import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/order_confirm_controller.dart';

class OrderConfirmView extends GetView<OrderConfirmController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('order_confirm'.tr),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'OrderConfirmView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
