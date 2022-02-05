import 'package:get/get.dart';
import 'package:mallxx_app/app/providers/login_provider.dart';

const String BASE_URL = "http://api.mallxx.com";

class BaseProvider extends GetConnect {
  final LoginProvider loginProvider = Get.find<LoginProvider>();
  @override
  void onInit() {
    httpClient.baseUrl = 'http://api.mallxx.com';

    httpClient.addRequestModifier<dynamic>((request) {
      String language = "zh-CN";
      String? localLanguage;

      if (Get.locale != null) {
        localLanguage =
            Get.locale!.languageCode + "-" + Get.locale!.countryCode!;
      }

      if (localLanguage != null) {
        language = localLanguage;
      }

      request.headers["Accept-Language"] = language;
      request.headers["authorization"] = loginProvider.getToken()!;
      return request;
    });

    super.onInit();
  }
}
