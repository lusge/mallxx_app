import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/message_center_controller.dart';

class MessageCenterView extends GetView<MessageCenterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MessageCenterView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MessageCenterView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
