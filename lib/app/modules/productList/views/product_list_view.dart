import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'package:get/get.dart';
import '/app/models/flter_header_view.dart';
import '/app/models/product_model.dart';
import 'package:mallxx_app/app/models/side_filter.dart';
import '/app/routes/app_pages.dart';
import '/app/models/category_model.dart';

import '../controllers/product_list_controller.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({Key? key}) : super(key: key);

  @override
  _ProductListViewState createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  final ProductListController controller = Get.find<ProductListController>();
  final GlobalKey<ScaffoldState> scoffoldKey = GlobalKey<ScaffoldState>();

  int page = 1;

  int pageSize = 20;

  String isSales = "";

  String isPrice = "";

  bool flag = true;

  List list = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    controller.onClose();
  }

  Widget _productItem(Product product) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Get.toNamed(
          Routes.PRODUCT_INFO,
          arguments: {"id": product.id},
        );
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120,
              width: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: FadeInImage.assetNetwork(
                    fadeOutDuration: const Duration(milliseconds: 100),
                    fadeOutCurve: Curves.easeOut,
                    fit: BoxFit.cover,
                    placeholder: "assets/images/bg.png",
                    image: product.pic!),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                alignment: Alignment.centerLeft,
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.name!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      product.subTitle!,
                      style: TextStyle(fontSize: 10, color: Colors.black38),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "price".trArgs(["${product.price!}"]),
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            product.newStatus == 1
                                ? Container(
                                    alignment: Alignment.center,
                                    height: 16,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.red,
                                    ),
                                    child: Text(
                                      "新品",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                      ),
                                    ),
                                  )
                                : Container(),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${product.comment_number}条评价",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black54,
                              ),
                            )
                          ],
                        ),
                        Text(
                          "月售${product.sale!}",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: const Color.fromRGBO(245, 245, 245, 1),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _productList() {
    return Container(
      // color: Colors.red,
      margin: EdgeInsets.only(top: 50),
      child: EasyRefresh.custom(
        header: Platform.isAndroid
            ? MaterialHeader()
            : BallPulseHeader(color: Colors.grey),
        footer: Platform.isAndroid
            ? MaterialFooter()
            : BallPulseFooter(color: Colors.grey),
        enableControlFinishLoad: true,
        enableControlFinishRefresh: true,
        firstRefresh: false,
        controller: controller.easyRefreshController,
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return _productItem(controller.list[index]);
              },
              childCount: controller.list.length,
            ),
          )
        ],
        onLoad: () async {
          controller.loadMore();
        },
        onRefresh: () async {
          controller.refresh();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scoffoldKey,
      endDrawer: Obx(
        () => Drawer(
          child: SideFilterView(
            maxPrice: controller.maxPrice.value,
            minPrice: controller.minPrice.value,
            onCallback: (dynamic data, double minPrice, double maxPrice) {
              controller.maxPrice.value = maxPrice;
              controller.minPrice.value = minPrice;
              controller.reload();
            },
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(controller.mp != null ? controller.mp!["name"] : ""),
        centerTitle: true,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Stack(
        children: [
          Obx(() => controller.isNotData.isFalse
              ? _productList()
              : Center(
                  child: Text("空空如也"),
                )),
          FlterHeaderView(
            scoffoldKey: scoffoldKey,
            callback: (String sort) {
              controller.sort.value = sort;
              controller.reload();
            },
          ),
        ],
      ),
    );
  }
}

// class ProductListView extends StatelessWidget {

// }
