import 'package:get/get.dart';

import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/productList/bindings/product_list_binding.dart';
import '../modules/productList/views/product_list_view.dart';
import '../modules/product_info/bindings/product_info_binding.dart';
import '../modules/product_info/views/product_info_view.dart';
import '../modules/root/bindings/root_binding.dart';
import '../modules/root/views/root_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ROOT;

  static final routes = [
    GetPage(
      name: _Paths.ROOT,
      page: () => RootView(),
      binding: RootBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_INFO,
      page: () => ProductInfoView(),
      binding: ProductInfoBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_LIST,
      page: () => ProductListView(),
      binding: ProductListBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
