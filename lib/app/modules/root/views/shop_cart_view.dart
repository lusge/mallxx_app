import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'package:get/get.dart';
import 'package:mallxx_app/app/components/number_item.dart';
import 'package:mallxx_app/app/models/cart_model.dart';
import '/app/modules/root/controllers/shop_cart_controller.dart';

class ShopCartView extends GetView<ShopCartController> {
  Widget _bottomToolBar() {
    return Container(
      color: Colors.white,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 1,
              color: Colors.black12,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10),
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: InkWell(
                      onTap: () {
                        print("object");
                        controller.isAllCheck.toggle();
                      },
                      child: controller.isAllCheck.isTrue
                          ? Image.asset("assets/icons/checkSelected.png")
                          : Image.asset("assets/icons/checkNormal.png"),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 2),
                    child: Text(
                      "cart_choice".tr,
                      style:
                          const TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ),
                ],
              ),
            ),
            controller.isEdit.isFalse
                ? Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "price".trArgs(["${controller.total.value}"]),
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        color: Colors.red,
                        width: 120,
                        height: 60,
                        alignment: Alignment.center,
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {},
                          child: Text(
                            "settlement".tr,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                : Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: const Color.fromRGBO(200, 200, 200, 1),
                            width: 1)),
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        print("点击删除");
                      },
                      child: Text(
                        "delete".tr,
                        style: const TextStyle(
                            fontSize: 12, color: Colors.black87),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _cartItem(Cart item) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 110,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: GestureDetector(
              onTap: () {
                item.check = !item.check!;
              },
              child: item.check!
                  ? Image.asset("assets/icons/checkSelected.png")
                  : Image.asset("assets/icons/checkNormal.png"),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.only(left: 10),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 10),
                    height: 100,
                    width: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FadeInImage.assetNetwork(
                        fadeOutDuration: const Duration(milliseconds: 100),
                        fadeOutCurve: Curves.easeOut,
                        fit: BoxFit.cover,
                        placeholder: "assets/images/bg.png",
                        image: item.productPic!,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 110,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  item.productName!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                color: Colors.black12,
                                child: Text(
                                  item.attribute!,
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "price".trArgs(["${item.price}"]),
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  child: NumberItem(
                                    number: item.quantity!,
                                    isEnable: true,
                                    addClick: (value) {
                                      item.quantity = value;
                                    },
                                    subClick: (value) {
                                      item.quantity = value;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("cart".tr),
        centerTitle: true,
        actions: [
          Row(
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  controller.isEdit.toggle();
                },
                child: Text(
                  controller.isEdit.isFalse ? "edit".tr : "finish".tr,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.notification_add,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 15),
            ],
          )

          //
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          EasyRefresh(
            controller: controller.easyRefreshController,
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 110.00 * controller.cartList.length,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.cartList.length,
                    itemBuilder: (BuildContext context, index) {
                      return _cartItem(controller.cartList[index]);
                    },
                  ),
                ),
                // RecommandList(list: _productList),
              ],
            ),
          ),
          Positioned(
            bottom: 0.0,
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: _bottomToolBar(),
          ),
        ],
      ),
    );
  }
}
