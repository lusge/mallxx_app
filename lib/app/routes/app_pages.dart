import 'package:get/get.dart';

import '../modules/about_me/bindings/about_me_binding.dart';
import '../modules/about_me/views/about_me_view.dart';
import '../modules/account_security/bindings/account_security_binding.dart';
import '../modules/account_security/views/account_security_view.dart';
import '../modules/address_book/bindings/address_book_binding.dart';
import '../modules/address_book/views/address_book_view.dart';
import '../modules/comment/bindings/comment_binding.dart';
import '../modules/comment/views/comment_view.dart';
import '../modules/comment_detail/bindings/comment_detail_binding.dart';
import '../modules/comment_detail/views/comment_detail_view.dart';
import '../modules/country_region/bindings/country_region_binding.dart';
import '../modules/country_region/views/country_region_view.dart';
import '../modules/language/bindings/language_binding.dart';
import '../modules/language/views/language_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/message_center/bindings/message_center_binding.dart';
import '../modules/message_center/views/message_center_view.dart';
import '../modules/my_comment/bindings/my_comment_binding.dart';
import '../modules/my_comment/views/my_comment_view.dart';
import '../modules/my_order/bindings/my_order_binding.dart';
import '../modules/my_order/views/my_order_view.dart';
import '../modules/order_confirm/bindings/order_confirm_binding.dart';
import '../modules/order_confirm/views/order_confirm_view.dart';
import '../modules/order_deliver/bindings/order_deliver_binding.dart';
import '../modules/order_deliver/views/order_deliver_view.dart';
import '../modules/order_detail/bindings/order_detail_binding.dart';
import '../modules/order_detail/views/order_detail_view.dart';
import '../modules/order_pay/bindings/order_pay_binding.dart';
import '../modules/order_pay/views/order_pay_view.dart';
import '../modules/order_success/bindings/order_success_binding.dart';
import '../modules/order_success/views/order_success_view.dart';
import '../modules/payment_options/bindings/payment_options_binding.dart';
import '../modules/payment_options/views/payment_options_view.dart';
import '../modules/privacy_policy/bindings/privacy_policy_binding.dart';
import '../modules/privacy_policy/views/privacy_policy_view.dart';
import '../modules/productList/bindings/product_list_binding.dart';
import '../modules/productList/views/product_list_view.dart';
import '../modules/product_info/bindings/product_info_binding.dart';
import '../modules/product_info/views/product_info_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/root/bindings/root_binding.dart';
import '../modules/root/views/root_view.dart';
import '../modules/setting/bindings/setting_binding.dart';
import '../modules/setting/views/setting_view.dart';

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
    GetPage(
      name: _Paths.SETTING,
      page: () => SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.ADDRESS_BOOK,
      page: () => AddressBookView(),
      binding: AddressBookBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT_SECURITY,
      page: () => AccountSecurityView(),
      binding: AccountSecurityBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_OPTIONS,
      page: () => PaymentOptionsView(),
      binding: PaymentOptionsBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACY_POLICY,
      page: () => PrivacyPolicyView(),
      binding: PrivacyPolicyBinding(),
    ),
    GetPage(
      name: _Paths.LANGUAGE,
      page: () => LanguageView(),
      binding: LanguageBinding(),
    ),
    GetPage(
      name: _Paths.COUNTRY_REGION,
      page: () => CountryRegionView(),
      binding: CountryRegionBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT_ME,
      page: () => AboutMeView(),
      binding: AboutMeBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_CONFIRM,
      page: () => OrderConfirmView(),
      binding: OrderConfirmBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_PAY,
      page: () => OrderPayView(),
      binding: OrderPayBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_SUCCESS,
      page: () => OrderSuccessView(),
      binding: OrderSuccessBinding(),
    ),
    GetPage(
      name: _Paths.MY_ORDER,
      page: () => MyOrderView(),
      binding: MyOrderBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_DELIVER,
      page: () => OrderDeliverView(),
      binding: OrderDeliverBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_DETAIL,
      page: () => OrderDetailView(),
      binding: OrderDetailBinding(),
    ),
    GetPage(
      name: _Paths.COMMENT,
      page: () => CommentView(),
      binding: CommentBinding(),
    ),
    GetPage(
      name: _Paths.COMMENT_DETAIL,
      page: () => CommentDetailView(),
      binding: CommentDetailBinding(),
    ),
    GetPage(
      name: _Paths.MESSAGE_CENTER,
      page: () => MessageCenterView(),
      binding: MessageCenterBinding(),
    ),
    GetPage(
      name: _Paths.MY_COMMENT,
      page: () => MyCommentView(),
      binding: MyCommentBinding(),
    ),
  ];
}
