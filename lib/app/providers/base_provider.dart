import 'package:get/get.dart';

const String BASE_URL = "http://api.mallxx.com";

class BaseProvider extends GetConnect {
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
      request.headers["AAuthorization"] = language;
      return request;
    });

    super.onInit();
  }
}
