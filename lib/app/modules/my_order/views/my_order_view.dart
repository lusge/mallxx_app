import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/my_order_controller.dart';

class MyOrderView extends GetView<MyOrderController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyOrderView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MyOrderView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
