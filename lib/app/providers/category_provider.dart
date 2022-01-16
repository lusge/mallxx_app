import '/app/providers/base_provider.dart';

import '/app/models/category_model.dart';

class CategoryProvider extends BaseProvider {
  static const String categoryWithChildren = "/v1/category/list/children";
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return CategoryResponse.fromJson(map);
    };
    super.onInit();
  }

  Future<CategoryResponse?> getCategory() async {
    final response = await get(categoryWithChildren);
    return response.body;
  }
}
