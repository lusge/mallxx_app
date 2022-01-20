import 'package:get/get.dart';
import '/app/models/category_model.dart';
import '/app/providers/category_provider.dart';

class CategoryController extends GetxController {
  final CategoryProvider categoryProvider = Get.put(CategoryProvider());
  final count = 0.obs;

  final categoryList = RxList<Category>();
  final clickSelectIndex = 0.obs;
  final isLoding = true.obs;
  @override
  void onInit() {
    getCategory();
    super.onInit();
  }

  void getCategory() async {
    var res = await categoryProvider.getCategory();
    if (res != null) {
      isLoding.value = false;

      if (res.code == 200 && res.data != null) {
        categoryList.value = res.data!;
      }
    }
  }

  void setListStatus(index) {
    for (int i = 0; i < categoryList.length; i++) {
      if (i == index) {
        categoryList[i].select = true;
        clickSelectIndex.value = index;
      } else {
        categoryList[i].select = false;
      }
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
