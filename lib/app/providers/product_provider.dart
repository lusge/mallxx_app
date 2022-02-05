import 'dart:convert';
import '/app/providers/base_provider.dart';

import '/app/models/product_model.dart';

class ProductProvider extends BaseProvider {
  static const recommendListUrl = "/v1/product/recommend/list";
  static const infoUrl = "/v1/product/info";
  static const productList = "/v1/product/category/product/list";

  @override
  void onInit() {
    super.onInit();
  }

  Future<ProductList?> getRecommendProductList(
      {int pageNum = 1, int pageSize = 20}) async {
    final response = await get(recommendListUrl, query: {
      "page_num": pageNum.toString(),
      "page_size": pageSize.toString(),
    });
    return ProductList.fromJson(response.body);
  }

  Future<ProductInfo> getProductInfo(int productId) async {
    final response = await get(infoUrl, query: {"id": productId.toString()});
    return ProductInfo.fromJson(response.body);
  }

  Future<ProductList> getCategoryProductList({
    required int pageNum,
    required List<int> categoryIds,
    required List<int> brandIds,
    String sort = "def",
    double? minPrice,
    double? mixPrice,
  }) async {
    var data = {
      "page_num": pageNum,
      "page_size": 20,
      "category_ids": categoryIds,
      "brand_ids": brandIds,
      "min_price": minPrice ?? 0,
      "mix_price": mixPrice ?? 0,
      "sort": sort,
    };

    var json = jsonEncode(data);
    print(json);
    final response = await post(productList, json,
        contentType: httpClient.defaultContentType,
        headers: {"Accept": "application/json"});
    return ProductList.fromJson(response.body);
  }
}
