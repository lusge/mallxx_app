import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mallxx_app/app/models/product_model.dart';
import '/app/providers/product_provider.dart';

class ProductInfoController extends GetxController {
  final ProductProvider productProvider = Get.put(ProductProvider());

  final isLoading = false.obs;

  int productId = Get.arguments["id"] ?? 0;

  final List<Tab> tabs = [
    Tab(
      text: "tab_goods".tr,
    ),
    Tab(
      text: "tab_evaluate".tr,
    ),
    Tab(
      text: "tab_detail".tr,
    ),
  ];

  final TabController tabController =
      TabController(initialIndex: 0, length: 3, vsync: ScrollableState());

  final double goodsHeight = Platform.isIOS ? 88 : 50;

  final double goodsDescHeight = 760;

  static double DEFAULT_SCROLLER = 100;

  GlobalKey goodsKey = GlobalKey();
  ScrollController scrollController = ScrollController();
  final toolbarOpacity = 0.0.obs;
  final productInfo = Product().obs;

  final buyCount = 1.obs;
  final defaultSku = SkuStock().obs;

  final selectSpecText = "".obs;
  final defaultPrice = 0.0.obs;

  @override
  void onInit() {
    if (productId <= 0) {
      Get.back();
    }

    scrollController.addListener(() {
      if (!scrollController.hasClients) {
        return;
      }

      double t = scrollController.offset / DEFAULT_SCROLLER;
      if (t < 0.0) {
        t = 0.0;
      } else if (t > 1) {
        t = 1.0;
      }

      toolbarOpacity.value = t;
      if (scrollController.offset < goodsHeight) {
        tabController.animateTo(0);
      } else if (scrollController.offset >= goodsHeight &&
          scrollController.offset <= goodsDescHeight) {
        tabController.animateTo(1);
      } else if (scrollController.offset >= goodsDescHeight) {
        tabController.animateTo(2);
      }
    });

    getProductInfo();
    super.onInit();
  }

  void setDefaultPrice(double price) {
    defaultPrice.value = price;
  }

  void getProductInfo() async {
    var res = await productProvider.getProductInfo(productId);
    if (res.code == 200) {
      productInfo.value = res.product!;
      defaultPrice.value = productInfo.value.price!;
      if (res.product?.skuStock != null) {
        setDefaultSku(productInfo.value.skuStock![0]);
      }
    }
  }

  void clickAddCart() {}

  void clickBuyNow() {}

  void setDefaultSku(SkuStock? sku) {
    if (sku != null) {
      defaultSku.value = sku;
      setDefaultPrice(defaultSku.value.price!);
      setSelectSpectText();
    } else {
      defaultSku.value = SkuStock();
      setDefaultPrice(productInfo.value.price!);
    }
  }

  void setSelectSpectText() {
    if (defaultSku.value.spData != null) {
      List data = jsonDecode(defaultSku.value.spData!);
      for (var map in data) {
        selectSpecText.value += map["key"] + " " + map["value"];
      }
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
