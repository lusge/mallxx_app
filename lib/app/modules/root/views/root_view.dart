import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '/app/modules/root/views/account_view.dart';
import '/app/modules/root/views/category_view.dart';
import '/app/modules/root/views/home_view.dart';
import '/app/modules/root/views/shop_cart_view.dart';

import '../controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  final List<Widget> _pages = [
    HomeView(),
    CategoryView(),
    ShopCartView(),
    AccountView(),
  ];
  @override
  Widget build(BuildContext context) {
    // Get.put(RootController());
    return Scaffold(
        body: Obx(
          () => IndexedStack(
            index: controller.currentIndex.value,
            children: _pages,
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            // backgroundColor: Colors.grey[200],
            // elevation: 1.0,
            items: [
              BottomNavigationBarItem(
                label: "home".tr,
                icon: Image.asset(
                  "assets/icons/home.png",
                  width: 30.0,
                  height: 30.0,
                ),
                activeIcon: Image.asset(
                  "assets/icons/home_active.png",
                  width: 30.0,
                  height: 30.0,
                ),
              ),
              BottomNavigationBarItem(
                label: "category".tr,
                icon: Image.asset(
                  "assets/icons/category.png",
                  width: 30.0,
                  height: 30.0,
                ),
                activeIcon: Image.asset(
                  "assets/icons/category_active.png",
                  width: 30.0,
                  height: 30.0,
                ),
              ),
              BottomNavigationBarItem(
                label: "cart".tr,
                icon: Image.asset(
                  "assets/icons/cart.png",
                  width: 30.0,
                  height: 30.0,
                ),
                activeIcon: Image.asset(
                  "assets/icons/cart_active.png",
                  width: 30.0,
                  height: 30.0,
                ),
              ),
              BottomNavigationBarItem(
                label: "account".tr,
                icon: Image.asset(
                  "assets/icons/person.png",
                  width: 30.0,
                  height: 30.0,
                ),
                activeIcon: Image.asset(
                  "assets/icons/person_active.png",
                  width: 30.0,
                  height: 30.0,
                ),
              ),
            ],
            currentIndex: controller.currentIndex.value,
            onTap: (index) {
              controller.setCurrentIndex(index);
              print(controller.currentIndex.value);
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,
            unselectedItemColor: const Color.fromRGBO(123, 123, 123, 1),
          ),
        ));
  }
}
