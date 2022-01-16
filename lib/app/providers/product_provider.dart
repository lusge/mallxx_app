import 'dart:ffi';

import 'package:get/get.dart';
import '/app/providers/base_provider.dart';

import '/app/models/product_model.dart';

class ProductProvider extends BaseProvider {
  static const recommendListUrl = "/v1/product/list";
  static const infoUrl = "/v1/product/info";

  @override
  void onInit() {
    // httpClient.defaultDecoder = (map) {
    //   if (map is Map<String, dynamic>) return ProductList.fromJson(map);
    // };

    super.onInit();
  }

  Future<ProductList?> getRecommendProductList(
      {int pageNum = 1, int pageSize = 20}) async {
    final response = await get(recommendListUrl, query: {
      "page_num": pageNum.toString(),
      "page_size": pageSize.toString(),
      "recommend_status": 1.toString(),
    });

    return ProductList.fromJson(response.body);
  }

  Future<ProductInfo> getProductInfo(int productId) async {
    final response = await get(infoUrl, query: {"id": productId.toString()});
    return ProductInfo.fromJson(response.body);
  }
}
