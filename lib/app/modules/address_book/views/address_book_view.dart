import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/address_book_controller.dart';

class AddressBookView extends GetView<AddressBookController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddressBookView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AddressBookView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
