import '/app/providers/base_provider.dart';

import '/app/models/member_model.dart';

class MemberProvider extends BaseProvider {
  static const String loginUrl = "/v1/login";
  static const String registerUrl = "/v1/register";
  @override
  void onInit() {
    super.onInit();
  }

  Future<MemberResponse> login(
      {required String username, required String password}) async {
    final resp =
        await post(loginUrl, {'username': username, 'password': password});
    return MemberResponse.fromJson(resp.body);
  }

  Future<MemberResponse> register(
      {required String username, required String password}) async {
    final resp =
        await post(registerUrl, {'username': username, 'password': password});
    return MemberResponse.fromJson(resp.body);
  }
}
