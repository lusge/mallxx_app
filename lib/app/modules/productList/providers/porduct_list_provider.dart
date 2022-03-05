import '/app/models/product_model.dart';
import '/app/providers/base_provider.dart';

class ProductListProvider extends BaseProvider {
  static const productList = "/product/product/api/list";

  @override
  void onInit() {
    super.onInit();
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

    final response = await post(productList, data);

    return ProductList.fromJson(response.body);
  }
}
