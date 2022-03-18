import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '/app/components/order_address_view.dart';
import '/app/components/order_product_view.dart';
import '/app/routes/app_pages.dart';

import '../controllers/order_confirm_controller.dart';

class OrderConfirmView extends GetView<OrderConfirmController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('order_confirm'.tr),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isLoading.isFalse
            ? Stack(
                children: [
                  ListView(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    children: [
                      //Address
                      Obx(
                        () => OrderAddressView(
                          onTab: () {
                            controller.onAddress();
                          },
                          isChange: true,
                          address: controller.defaultAddress.value,
                        ),
                      ),

                      //商品
                      OrderProductView(
                        list: controller.buyProductList.value,
                      ),

                      //优惠券
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        // padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: MediaQuery.removePadding(
                          context: context,
                          removeBottom: true,
                          removeTop: true,
                          child: ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              ListTile(
                                title: Text(
                                  "优惠券",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                trailing: GestureDetector(
                                  onTap: () {
                                    controller.onCoupon();
                                  },
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    width: 90,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text("5张优惠券"),
                                        Icon(
                                          Icons.keyboard_arrow_right_outlined,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 0.1,
                                color: Colors.black,
                              ),
                              ListTile(
                                title: Text(
                                  "积分抵扣",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text("200积分抵扣2元"),
                                trailing: Checkbox(
                                  tristate: true,
                                  shape: const CircleBorder(),
                                  activeColor: Colors.red,
                                  checkColor: Colors.white,
                                  hoverColor: Colors.white,
                                  focusColor: Colors.red,
                                  side: const BorderSide(
                                    color: Colors.white,
                                  ),
                                  value: controller.isIntegralDeduction.value,
                                  onChanged: (value) {
                                    controller.onIntegral();
                                    // controller.onIsAllCheck();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      //支付方式
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        // padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          title: Text(
                            "支付方式",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: GestureDetector(
                            onTap: () {
                              controller.onPayMethod();
                            },
                            child: Container(
                              alignment: Alignment.centerRight,
                              width: 90,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("支付宝"),
                                  Icon(
                                    Icons.keyboard_arrow_right_outlined,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 100)
                    ],
                  ),
                  Positioned(
                    bottom: 0.0,
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      color: Colors.white,
                      alignment: Alignment.topRight,
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              width: 1,
                              color: Colors.black12,
                            ),
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "共两件，",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "合计:",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "price".trArgs(["123"]),
                                      style: const TextStyle(
                                        color: Colors.red,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  // controller.onCheckout();
                                  Get.toNamed(Routes.ORDER_DETAIL);
                                },
                                child: Container(
                                  width: 120,
                                  height: 40,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(right: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.red,
                                  ),
                                  child: Text(
                                    "pay".tr,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
