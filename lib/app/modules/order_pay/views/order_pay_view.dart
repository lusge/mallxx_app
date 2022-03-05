import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/order_pay_controller.dart';

class OrderPayView extends GetView<OrderPayController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('order_pay'.tr),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'OrderPayView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
