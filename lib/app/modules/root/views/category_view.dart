import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mallxx_app/app/routes/app_pages.dart';
import '/app/models/category_model.dart';
import '/app/modules/root/controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  Widget _leftMenuList() {
    var categorys = controller.categoryList.value;
    int clickSelectIndex = controller.clickSelectIndex.value;
    return ListView.builder(
      padding: const EdgeInsets.only(top: 10.0),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categorys.length,
      itemBuilder: (context, index) {
        Category item = categorys[index];
        if (index == clickSelectIndex) {
          item.select = true;
        }
        return InkWell(
          onTap: () {
            controller.setListStatus(index);
          },
          child: Container(
            color: Colors.grey[100],
            height: 50,
            alignment: Alignment.center,
            width: 50,
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 15,
                    color: item.select ? Colors.red : Colors.grey[100],
                  ),
                ),
                Expanded(
                  flex: 30,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      categorys[index].name!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: item.select ? Colors.black : Colors.black54,
                        fontWeight:
                            item.select ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget categoryTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _childrenCategory() {
    var categorys = controller.categoryList.value;
    int clickSelectIndex = controller.clickSelectIndex.value;
    if (categorys.isEmpty) {
      return Container();
    }

    List<Category> children = categorys[clickSelectIndex].children!;

    int len = children.length;
    if (len <= 0) {
      return Container();
    }

    return Container(
      margin: const EdgeInsets.only(top: 10.0, left: 5, right: 5, bottom: 0),
      // height: 12,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: GridView.builder(
          padding: const EdgeInsets.only(
            top: 10.0,
            left: 5.0,
            right: 5.0,
            bottom: 10,
          ),
          itemCount: len,
          // controller: ,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
          ),
          itemBuilder: (context, index) {
            Category item = children[index];
            return InkWell(
              highlightColor: Colors.white24,
              hoverColor: Colors.white24,
              focusColor: Colors.white24,
              onTap: () {
                Get.toNamed(Routes.PRODUCT_LIST);
              },
              child: Container(
                // margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                alignment: Alignment.center,
                height: 100,
                width: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (item.icon != null && item.icon!.length > 0)
                      Image(
                        image: NetworkImage(item.icon!),
                        height: 60.0,
                        width: 60.0,
                        fit: BoxFit.fill,
                      ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Text(
                        item.name!,
                        style: const TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget _categoryAdvertisement() {
    return InkWell(
      onTap: () {},
      highlightColor: const Color(0xfffbfbfb),
      child: Container(
        width: double.infinity,
        height: 100,
        margin: const EdgeInsets.only(left: 5.0, right: 5.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://img.alicdn.com/tps/i4/TB1l573vlv0gK0jSZKbSuvK2FXa.jpg_490x490q100.jpg_.webp",
            ),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text('category'.tr),
      ),
      body: Obx(() {
        if (controller.isLoding.isFalse) {
          var categorys = controller.categoryList.value;
          int clickSelectIndex = controller.clickSelectIndex.value;

          if (categorys.isEmpty) {
            return Container();
          }
          List<Category>? item = categorys[clickSelectIndex].children;
          int l = item!.length;
          int c = (l / 3.0).ceil();
          print(c);
          double height = (100 * c.toDouble()) + (c <= 1 ? 20 : 10);
          print(height);
          return Row(
            children: [
              Container(
                color: Colors.grey[100],
                width: 90,
                height: MediaQuery.of(context).size.height,
                child: _leftMenuList(),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(top: 10.0),
                  children: [
                    _categoryAdvertisement(),
                    // categoryTitle("热门推荐"),
                    SizedBox(
                      child: _childrenCategory(),
                      height: height,
                    )
                  ],
                ),
                flex: 4,
              ),
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
