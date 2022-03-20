import 'package:get/get.dart';
import '/app/modules/productList/providers/porduct_list_provider.dart';

import '../controllers/product_list_controller.dart';

class ProductListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductListController>(
      () => ProductListController(),
    );
    Get.put(ProductListProvider());
  }
}
