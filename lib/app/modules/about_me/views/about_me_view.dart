import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/about_me_controller.dart';

class AboutMeView extends GetView<AboutMeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AboutMeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AboutMeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
