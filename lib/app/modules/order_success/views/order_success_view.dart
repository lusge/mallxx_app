import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/order_success_controller.dart';

class OrderSuccessView extends GetView<OrderSuccessController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OrderSuccessView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'OrderSuccessView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
