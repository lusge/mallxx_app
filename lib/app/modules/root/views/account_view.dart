import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:icon_badge/icon_badge.dart';
import '/app/routes/app_pages.dart';
import '/app/components/recommend_list_view.dart';
import '/app/models/member_model.dart';

import '/app/modules/root/controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  Widget _header(Member? member) {
    //  = controller.loginProvider.getMember();
    return SizedBox(
      height: 130,
      width: double.infinity,
      // decoration: const BoxDecoration(
      //   color: Color(0xfffff3a0),
      // ),
      child: Container(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () async {
                if (controller.loginProvider.isLogin()) {
                } else {
                  var data = await Get.toNamed(
                    Routes.LOGIN,
                  );

                  if (data != null) {
                    controller.setMember();
                  }
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    width: 70,
                    height: 70,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child:
                          member?.Avatar != null && member!.Avatar!.isNotEmpty
                              ? Image.network(
                                  member.Avatar!,
                                  fit: BoxFit.cover,
                                )
                              : Icon(
                                  Icons.account_circle,
                                  size: 40,
                                ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    member?.Username ?? "请登录",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 5),
              // color: Colors.red,
              height: 60,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            member?.Integral != null
                                ? "${member?.Integral}"
                                : "--",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(
                          "integral".tr,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.grey,
                    height: 20,
                    width: 1,
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            member?.Coupon != null ? "${member?.Coupon}" : "--",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(
                          "coupon".tr,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.grey,
                    height: 20,
                    width: 1,
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            member?.Followers != null
                                ? "${member?.Followers}"
                                : "--",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(
                          "follow".tr,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buyMembership() {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.red,
      ),
      height: 70,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "buy_member".tr,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              Text(
                "more_discounts".tr,
                style: TextStyle(
                  color: Colors.grey[50],
                  fontSize: 14,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              print("开通");
            },
            child: Container(
              // margin: const EdgeInsets.only(right: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.orange,
              ),
              width: 100,
              height: 50,
              child: Text(
                "open_member".tr,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _order() {
    return Container(
      height: 90,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: Colors.grey.shade300,
        ),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                print("dfk");
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/dfk.png",
                    width: 40,
                  ),
                  Text(
                    "dfk".tr,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                print("dfk");
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/dsh.png",
                    width: 40,
                  ),
                  Text(
                    "dsh".tr,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                print("dfk");
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/dpj.png",
                    width: 35,
                  ),
                  Text(
                    "dpj".tr,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                print("dfk");
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/all_order.png",
                    width: 40,
                  ),
                  Text(
                    "all_order".tr,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  )
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
        title: Text("account".tr),
        centerTitle: true,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () async {
              var data = await Get.toNamed(Routes.SETTING);
              if (data != null) {
                if (data == "out") {
                  controller.setMember();
                }
              }
            },
            child: const Icon(
              Icons.settings,
              // size: 30,
            ),
          ),
          IconBadge(
            onTap: () {},
            icon: const Icon(
              Icons.notifications_none,
              size: 30,
            ),
            itemCount: 100,
            maxCount: 99,
          ),
        ],
      ),
      body: EasyRefresh(
        controller: controller.easyRefreshController,
        child: Column(
          children: [
            Obx(() => _header(controller.member.value)),
            _buyMembership(),
            const SizedBox(
              height: 10,
            ),
            _order(),
            const SizedBox(
              height: 10,
            ),
            Obx(() {
              return controller.isLoding.isFalse
                  ? RecommandListView(list: controller.productList)
                  : Container();
            }),
          ],
        ),
      ),
    );
  }
}
