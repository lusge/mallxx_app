import 'package:get/get.dart';
import '/app/modules/address_book/providers/address_provider.dart';

import '../controllers/address_book_controller.dart';

class AddressBookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddressBookController>(
      () => AddressBookController(),
    );
    Get.put(AddressProvider());
  }
}
