import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '/app/components/hint.dart';
import '/app/modules/address_book/components/edit_address_view.dart';
import '/app/routes/app_pages.dart';
import '/app/models/member_model.dart';
import '/app/providers/login_provider.dart';
import '../providers/address_provider.dart';
import '/app/models/address_model.dart';

class AddressBookController extends GetxController {
  final AddressProvider addressProvider = Get.put(AddressProvider());
  final LoginProvider loginProvider = Get.find<LoginProvider>();

  final addressList = RxList<Address>();
  final isEdit = false.obs;
  late final Member? memberInfo;
  final mp = Get.arguments;

  @override
  void onInit() {
    super.onInit();
    memberInfo = loginProvider.getMember();
    getAddressList();
  }

  void getAddressList() async {
    final response = await addressProvider.getAddressList();
    if (response.code == 200) {
      addressList.value = response.data!;
    }
  }

  void onChangeDefuatStatus(int index) async {
    for (int i = 0; i < addressList.length; i++) {
      Address item = addressList[i];
      if (i == index) {
        item.defaultStatus = 1;
        if (memberInfo != null) {
          final response = await addressProvider.setDefaultStatus(item.id!);
          if (response.code == 200) {}
        }
      } else {
        item.defaultStatus = 0;
      }
    }
    update(["checkBox"]);
  }

  void onSelectAddress(Address address) {
    if (mp != null) {
      if (mp["isReturn"] == true) {
        Get.back(result: address);
      }
    }
  }

  void handlerDelete(Address address) {
    Get.defaultDialog(
      title: "hint".tr,
      content: Text("delete_address_book".tr),
      onConfirm: () {
        Get.back();
        EasyLoading.show();
        addressList.remove(address);
        addressProvider.deleteAddress(address.id!).then((value) {
          if (value.code != 200) {
            Get.snackbar("hint".tr, value.detail);
          } else {
            getAddressList();
          }
        });
        EasyLoading.dismiss();
      },
      onCancel: () {},
      confirmTextColor: Colors.white,
      cancelTextColor: Colors.red,
      textConfirm: "delete".tr,
      textCancel: "cancel".tr,
      titleStyle: TextStyle(fontWeight: FontWeight.bold),
      buttonColor: Colors.red,
    );
  }

  void handlerEditAddress(Address? address) {
    Get.to(EditAddressView(
      onConfirm: (Address value) {
        if (address != null) {
          address = value;
          addressProvider.updateAddress(value).then((response) {
            print(response.detail);
            if (response.code == 200) {
              getAddressList();
            } else {
              Hint.Error(response.detail);
            }
          });
        } else {
          addressProvider.addAddrss(value).then((response) {
            if (response.code == 200) {
              getAddressList();
            } else {
              Hint.Error(response.detail);
            }
          });
        }
        update();
      },
      address: address,
    ));
  }

  void onChangeEdit() {
    isEdit.toggle();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
