import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import 'package:get/get.dart';

import 'package:icon_badge/icon_badge.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '/app/components/recommend_list_view.dart';
import '/app/components/flash_sale_value.dart';
import '/app/components/ad_promotion_view.dart';

import '/app/modules/root/controllers/home_controller.dart';
import '/app/components/search_header.dart';
import '/app/components/ad_page_view.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Image.asset("assets/icons/logo.png"), //logo
        actions: [
          IconBadge(
            icon: const Icon(
              Icons.notifications_none,
              size: 30,
            ),
            itemCount: 100,
            badgeColor: Colors.red,
            itemColor: Colors.white,
            maxCount: 99,
            hideZero: true,
            onTap: () {
              print('test');
            },
          ),
        ],
        title: GestureDetector(
          onDoubleTap: () {
            // _easyRefreshController.
          },
          child: const SearchHeader(),
        ),
      ),
      body: Obx(
        () {
          return controller.isLoading.isFalse
              ? EasyRefresh(
                  controller: controller.easyRefreshController,
                  enableControlFinishLoad: true,
                  enableControlFinishRefresh: true,
                  onLoad: () async {
                    controller.onLoadMore();
                  },
                  onRefresh: () async {
                    controller.getRecommendProduct(pageNum: 1);
                  },
                  bottomBouncing: true,
                  child: Column(
                    children: [
                      AdPageView(adList: controller.adList.value),
                      AdPromotionView(list: controller.promotionAdList.value),
                      FlashSaleView(),
                      RecommandListView(
                        list: controller.productList.value,
                      ),
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
