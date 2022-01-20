import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("setting".tr),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 410,
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 1,
                    color: Colors.black12,
                  );
                },
                itemCount: controller.settingsTitle.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      controller.settingsTitle[index]["name"],
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    onTap: () {
                      controller.onClick(index);
                    },
                    trailing: Icon(Icons.keyboard_arrow_right),
                  );
                },
              ),
            ),
            if (controller.loginProvider.isLogin())
              GestureDetector(
                onTap: () {
                  controller.onSignOut();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: BorderDirectional(
                        top: BorderSide(width: 0.5, color: Colors.black12),
                        bottom: BorderSide(width: 0.5, color: Colors.black12),
                      )),
                  child: Text(
                    "Sign Out",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.red),
                  ),
                ),
              ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text(
                "Version v 0.001",
                style: TextStyle(color: Colors.black54),
              ),
            ),
          ],
        ));
  }
}
