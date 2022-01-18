import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/app/models/member_model.dart';
import 'package:get/get.dart';

class LoginProvider {
  static const loginMode = "LOGINMODE";
  static const loginToken = "token";
  bool isLogin() {
    Member? member = getMember();
    return member != null;
  }

  Member? getMember() {
    return getLogin();
  }

  void saveLogin(Member member) {
    SharedPreferences sp = Get.find<SharedPreferences>();
    sp.setString(loginMode, jsonEncode(member.toJson()));

    if (member.Token != null) {
      sp.setString(loginToken, member.Token!);
    }
  }

  Member? getLogin() {
    SharedPreferences sp = Get.find<SharedPreferences>();
    try {
      String? json = sp.getString(loginMode);
      if (json != null) {
        if (json == "") {
          return null;
        }
        return Member.fromJson(jsonDecode(json));
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  String? getToken() {
    SharedPreferences sp = Get.find<SharedPreferences>();
    return sp.getString(loginToken);
  }

  void cleanLogin() {
    SharedPreferences sp = Get.find<SharedPreferences>();
    sp.remove(loginMode);
    sp.remove(loginToken);
    print("cleanLogin");
  }
}
