import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '/app/modules/root/controllers/shop_cart_controller.dart';

class ShopCartView extends GetView<ShopCartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShopCartView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ShopCartView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
