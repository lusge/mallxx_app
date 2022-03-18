import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/components/login_with_view.dart';
import '/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              Get.offNamed(Routes.REGISTER);
            },
            child: Container(
              alignment: Alignment.centerLeft,
              width: 50,
              child: Text(
                "注册",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 30,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "more_exciting_after_login".tr,
                    style: const TextStyle(
                        fontSize: 25,
                        // fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: controller.usernameController,
                    maxLines: 1,
                    autofocus: true,
                    cursorWidth: 1,
                    cursorColor: Colors.red,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "",
                      labelText: "enter_username".tr,
                      focusColor: Colors.grey,
                      fillColor: Colors.grey,
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(width: 0.1),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 0.1,
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 0.1,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: controller.passwordController,
                    maxLines: 1,
                    // autofocus: true,
                    cursorWidth: 1,
                    cursorColor: Colors.red,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "",
                      labelText: "enter_password".tr,
                      focusColor: Colors.grey,
                      fillColor: Colors.grey,
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(width: 0.1),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 0.1,
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 0.1,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        textDirection: TextDirection.ltr,
                        children: [
                          Obx(
                            () => SizedBox(
                              width: 30,
                              height: 20,
                              child: Checkbox(
                                tristate: true,
                                shape: const CircleBorder(),
                                activeColor: Colors.red,
                                checkColor: Colors.white,
                                hoverColor: Colors.white,
                                focusColor: Colors.red,
                                side: const BorderSide(
                                    // color: Colors.white,
                                    ),
                                value: controller.agreeCheckBox.value,
                                onChanged: (value) {
                                  controller.oncheckBoxChanged();
                                },
                              ),
                            ),
                          ),
                          Text(
                            "read_and_ageree".tr,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 12.0),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(top: 18),
                              child: InkWell(
                                onTap: () => {print("OK")},
                                child: Text(
                                  "service_agreement".tr,
                                  softWrap: true,
                                  maxLines: 100,
                                  style: const TextStyle(
                                      color: Colors.blue, fontSize: 12.0),
                                  // textAlign: ,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (controller.isLogingIn.isFalse) {
                        controller.onLogin();
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Obx(
                        () => controller.isLogingIn.isFalse
                            ? SizedBox(
                                // width: 20,
                                height: 25,
                                child: Text(
                                  "login".tr,
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : SizedBox(
                                width: 25,
                                height: 25,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 0,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 0.5,
                          width: 50,
                          color: Colors.red,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "or_join_with".tr,
                            // style: TextStyle(height: 1000),
                          ),
                        ),
                        Container(
                          height: 0.5,
                          width: 50,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  LoginWithView(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
