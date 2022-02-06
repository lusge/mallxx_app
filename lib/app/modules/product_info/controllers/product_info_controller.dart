import 'dart:convert';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '/app/modules/root/controllers/shop_cart_controller.dart';
import '/app/models/member_model.dart';
import '/app/providers/cart_provider.dart';
import '/app/routes/app_pages.dart';
import '/app/models/product_model.dart';
import '/app/providers/login_provider.dart';
import '/app/providers/product_provider.dart';

class ProductInfoController extends GetxController {
  final ProductProvider productProvider = Get.put(ProductProvider());
  final LoginProvider loginProvider = Get.find<LoginProvider>();
  final CartProvider cartProvider = Get.find<CartProvider>();
  final ShopCartController shopCartController = Get.find<ShopCartController>();

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

  final last_click = 0.obs; //1, click add cart , 2, click buy now

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

  void onFinish() {
    if (last_click.value == 1) {
      onAddCart();
    } else if (last_click.value == 2) {
      onBuyNow();
    }
  }

  bool onAddCart() {
    if (defaultSku.value.id == null) {
      last_click.value = 1;
      return false;
    }

    if (!loginProvider.isLogin()) {
      Get.toNamed(Routes.LOGIN);
    } else {
      Member? member = loginProvider.getMember();
      if (member == null) {
        Get.toNamed(Routes.LOGIN);
      } else {
        Map data = {
          "product_id": productInfo.value.id,
          "sku_id": defaultSku.value.id,
          "quantity": buyCount.value,
          "member_id": member.Id,
          "member_nickname": member.nickname,
        };

        cartProvider.addCart(data).then((value) {
          if (value.code == 403) {
            Get.toNamed(Routes.LOGIN);
          } else if (value.code == 200) {
            shopCartController.getCarts();
            Fluttertoast.showToast(
                msg: "add_success".tr, gravity: ToastGravity.CENTER);
          } else {
            Fluttertoast.showToast(
                msg: value.detail, gravity: ToastGravity.CENTER);
          }
        });
      }
    }
    return true;
  }

  bool onBuyNow() {
    if (defaultSku.value.id == null) {
      last_click.value = 2;
      return false;
    }
    Get.toNamed(Routes.ORDER_CONFIRM);
    return true;
  }

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
  void onClose() {
    super.onClose();
  }
}
