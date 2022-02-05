import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import '/app/models/cart_model.dart';
import '/app/models/product_model.dart';

class ShopCartController extends GetxController {
  final EasyRefreshController easyRefreshController = EasyRefreshController();
  final isEdit = false.obs;

  final productList = RxList<Product>();

  final cartList = RxList<Cart>();

  final isAllCheck = true.obs;

  final total = 0.00.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
