import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';

import '/app/providers/product_provider.dart';
import '/app/models/product_model.dart';

class ProductListController extends GetxController {
  final ProductProvider productProvider = Get.put(ProductProvider());
  final EasyRefreshController easyRefreshController = EasyRefreshController();

  Map? mp = Get.arguments;

  final list = RxList<Product>();

  int pageNum = 1;

  final isLoading = false.obs;
  final minPrice = 0.0.obs;
  final maxPrice = 0.0.obs;
  final sort = "def".obs;
  final isNotData = false.obs;

  int total = 0;

  @override
  void onInit() {
    if (mp == null) {
      Get.back();
    }
    EasyLoading.instance..backgroundColor = Colors.white;
    getList();
    super.onInit();
  }

  void reload() {
    EasyLoading.show();
    pageNum = 1;
    getList();
  }

  void refresh() {
    pageNum = 1;
    getList();
  }

  void loadMore() {
    pageNum++;
    getList();
  }

  void getList() async {
    final productList = await productProvider.getCategoryProductList(
      pageNum: pageNum,
      categoryIds: [mp!["id"]],
      brandIds: [],
      minPrice: minPrice.value,
      mixPrice: maxPrice.value,
      sort: sort.value,
    );
    EasyLoading.dismiss();
    print(pageNum);
    print(productList.code);
    print(productList.detail);
    if (productList.code == 200) {
      if (pageNum == 1) {
        list.clear();
        easyRefreshController.finishRefresh(success: true);
        total = productList.product != null ? productList.product!.length : 0;
      } else {
        if (pageNum > 1) {
          if (productList.product != null &&
              productList.product!.length < total) {
            easyRefreshController.finishLoad(success: true, noMore: true);
          } else {
            easyRefreshController.finishLoad(success: true, noMore: false);
          }
        }
      }
      if (productList.product != null) {
        list.addAll(productList.product!);
      } else {
        if (list.length <= 0) {
          isNotData.value = true;
        }
      }
    } else {
      isNotData.value = true;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    easyRefreshController.dispose();
    super.onClose();
  }
}
