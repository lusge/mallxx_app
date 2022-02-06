import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import '/app/providers/cart_provider.dart';
import '/app/routes/app_pages.dart';
import '/app/models/cart_model.dart';

class ShopCartController extends GetxController {
  final EasyRefreshController easyRefreshController = EasyRefreshController();
  final CartProvider cartProvider = Get.put(CartProvider());

  final isEdit = false.obs;

  final cartList = RxList<Cart>();

  final isAllCheck = true.obs;

  final isLoading = true.obs;

  final totalPrice = 0.00.obs;

  @override
  void onInit() {
    super.onInit();

    getCarts();
  }

  void getCarts() async {
    final response = await cartProvider.getCartList();
    isLoading.value = false;
    if (response.code == 200 && response.data != null) {
      cartList.value = response.data!;
      easyRefreshController.finishRefresh(success: true);
      calculateTotalPrice();
    }
  }

  void onChangeCartQuantity(Cart cart, int quantity) {
    cart.quantity = quantity;

    updateQuantity(id: cart.id!, quantity: quantity);

    calculateTotalPrice();
  }

  void calculateTotalPrice() {
    double count = 0.00;
    for (var item in cartList) {
      if (item.check == true) {
        count += (item.price! * item.quantity!);
      }
    }
    totalPrice.value = count;
  }

  void updateQuantity({required int id, required int quantity}) async {
    EasyLoading.show();
    final response =
        await cartProvider.modifyQuantity(id: id, quantity: quantity);
    EasyLoading.dismiss();
    if (response.code == 200) {
    } else {}
  }

  void onClickDelete() {
    List<int> ids = [];
    for (final item in cartList) {
      if (item.check == true) {
        ids.add(item.id!);
      }
    }
    deleteCart(ids);
  }

  void deleteCart(List<int> ids) async {
    EasyLoading.show();
    final response = await cartProvider.deleteCart(ids);
    EasyLoading.dismiss();

    if (response.code == 200) {
      getCarts();
    }
  }

  void onItemCheck(Cart item) {
    item.check = !item.check!;
    changeIsAllCheck();
    update(["cartItem"]);
    calculateTotalPrice();
  }

  void changeIsAllCheck() {
    bool isAll = true;
    for (final item in cartList) {
      if (item.check == false) {
        isAll = false;
      }
    }
    this.isAllCheck.value = isAll;
    calculateTotalPrice();
  }

  void onIsAllCheck() {
    isAllCheck.toggle();
    for (final item in cartList) {
      item.check = isAllCheck.value;
    }
    update(["cartItem"]);
  }

  void onCheckout() {
    Get.toNamed(Routes.ORDER_CONFIRM);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    cartProvider.dispose();
    easyRefreshController.dispose();
  }
}
