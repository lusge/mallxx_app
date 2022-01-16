import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_list_controller.dart';

class ProductListView extends GetView<ProductListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProductListView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ProductListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
