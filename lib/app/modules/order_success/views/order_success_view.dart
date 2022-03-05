import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '/app/routes/app_pages.dart';

import '../controllers/order_success_controller.dart';

class OrderSuccessView extends GetView<OrderSuccessController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('order_pay_success'.tr),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Get.offAllNamed(Routes.ROOT);
            },
            child: Container(
              alignment: Alignment.center,
              width: 80,
              height: 50,
              // color: Colors.black,
              child: Text(
                "完成",
                style: TextStyle(color: Colors.green),
              ),
            ),
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Image.asset("assets/icons/success.png"),
            SizedBox(height: 10),
            Text(
              "订单支付成功",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.offAllNamed(Routes.ROOT);
                    Get.toNamed(Routes.MY_ORDER);
                  },
                  child: Container(
                    width: 100,
                    height: 40,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    child: Text(
                      "查看订单".tr,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.offAllNamed(Routes.ROOT);
                  },
                  child: Container(
                    width: 100,
                    height: 40,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    child: Text(
                      "回到首页".tr,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
