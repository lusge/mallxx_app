import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';
import '/app/components/login_with_view.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('register'.tr),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
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
                const SizedBox(
                  height: 20,
                ),
                ActionChip(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 140),
                  label: Obx(
                    () => controller.isRegistering.isFalse
                        ? Text("register".tr,
                            style: const TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ))
                        : Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                  ),
                  onPressed: () {
                    if (controller.isRegistering.isFalse) {
                      controller.onRegister();
                    }
                  },
                  backgroundColor: Colors.red,
                  shadowColor: Colors.white,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
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
                        child: Text("or_join_with".tr),
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
    );
  }
}
