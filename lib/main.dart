import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'application.dart';
import 'lan/Message.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Application.init();
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Color(0xffeeeeee),
    ));
    // SystemChrome.setEnabledSystemUIOverlays([]);
  }
  runApp(
    GetMaterialApp(
      title: "Mallxx",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      translations: Messages(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale("zh", "CN"),
      theme: ThemeData(
        // backgroundColor: Colors.black,
        primarySwatch: Colors.blue,
        primaryColor: Colors.grey,
        // backgroundColor: Colors.red,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Color(0xfffbfbfb),
          titleTextStyle: TextStyle(
            color: Colors.black87,
            fontSize: 20.0,
            // fontWeight: FontWeight.bold,
          ),
          elevation: 0.5,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xfffbfbfb),
          selectedItemColor: Colors.black,
          unselectedItemColor: Color(0xff7b7b7b),
          selectedLabelStyle: TextStyle(
            fontSize: 12,
          ),
        ),
      ),
      builder: EasyLoading.init(),
    ),
  );
}
