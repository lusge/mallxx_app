import 'package:get/get.dart';

class RootController extends GetxController {
  final routeData = Get.arguments;

  final currentIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
    if (routeData != null) {}
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void setCurrentIndex(index) {
    currentIndex.value = index;
  }
}
