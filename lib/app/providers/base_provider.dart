import 'package:fluttertoast/fluttertoast.dart';
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
            Get.locale!.languageCode; //+ "-" + Get.locale!.countryCode!;
        if (Get.locale!.countryCode != null) {
          localLanguage += "-" + Get.locale!.countryCode!;
        }
      }

      if (localLanguage != null) {
        language = localLanguage;
      }

      request.headers["Accept-Language"] = language;
      request.headers["Authorization"] = loginProvider.getToken() ?? "";

      return request;
    });

    // 响应拦截
    httpClient.addResponseModifier((request, response) {
      if (response.statusCode != 200) {
        Fluttertoast.showToast(msg: "网络错误", gravity: ToastGravity.CENTER);
      }
      return response;
    });

    super.onInit();
  }
}
