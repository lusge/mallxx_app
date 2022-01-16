import 'package:get/get.dart';

const String BASE_URL = "http://api.mallxx.com";

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://api.mallxx.com';

    httpClient.addRequestModifier<dynamic>((request) {
      String language = "zh-CN";
      String? localLanguage;

      if (Get.deviceLocale != null) {
        if (Get.deviceLocale?.languageCode != null) {
          localLanguage = Get.deviceLocale?.languageCode;
        }

        if (Get.deviceLocale?.countryCode != null && localLanguage != null) {
          String? countryCode = Get.deviceLocale?.countryCode;
          localLanguage = localLanguage + "-" + countryCode!;
        }
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
