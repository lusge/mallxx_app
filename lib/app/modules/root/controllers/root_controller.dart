import 'package:get/get.dart';

class RootController extends GetxController {
  //TODO: Implement RootController

  final currentIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
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
