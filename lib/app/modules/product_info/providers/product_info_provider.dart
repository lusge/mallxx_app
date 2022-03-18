import '/app/models/response_model.dart';

import '/app/models/product_model.dart';

import '/app/providers/base_provider.dart';

class ProductInfoProvider extends BaseProvider {
  static const infoUrl = "/product/product/info";

  static const String addCartUrl = "/cart/add";
  @override
  void onInit() {
    super.onInit();
  }

  Future<ProductInfo> getProductInfo(int productId) async {
    final response = await get(infoUrl, query: {"id": productId.toString()});
    return ProductInfo.fromJson(response.body);
  }

  Future<ResponseData> addCart(Map data) async {
    final response = await post(addCartUrl, data);
    print(response.body);
    return ResponseData.fromJson(response.body);
  }
}
