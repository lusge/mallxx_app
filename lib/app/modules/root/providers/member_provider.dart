import 'package:mallxx_app/app/models/response_model.dart';

import '/app/providers/base_provider.dart';

import '/app/models/member_model.dart';

class MemberProvider extends BaseProvider {
  static const String loginUrl = "/sign/login";
  static const String registerUrl = "/sign/register";
  static const String signOutUrl = "/sign/signout";
  @override
  void onInit() {
    super.onInit();
  }

  Future<MemberResponse> login(
      {required String username, required String password}) async {
    final resp =
        await post(loginUrl, {'username': username, 'password': password});
    print(resp.body);
    return MemberResponse.fromJson(resp.body);
  }

  Future<MemberResponse> register(
      {required String username, required String password}) async {
    final resp =
        await post(registerUrl, {'username': username, 'password': password});
    return MemberResponse.fromJson(resp.body);
  }

  Future<ResponseData> signOut() async {
    final resp = await post(signOutUrl, null);
    return ResponseData.fromJson(resp.body);
  }
}
