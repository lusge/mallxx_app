import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '/app/models/address_model.dart';

import '../controllers/address_book_controller.dart';

class AddressBookView extends GetView<AddressBookController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('my_address_book'.tr),
        centerTitle: true,
        actions: [
          Obx(
            () => MaterialButton(
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              onPressed: () {
                controller.onChangeEdit();
              },
              child: controller.isEdit.isFalse
                  ? Text("edit".tr)
                  : Text("finish".tr),
            ),
          ),
        ],
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          children: [
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                itemCount: controller.addressList.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index != controller.addressList.length) {
                    Address address = controller.addressList[index];
                    return Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            onTap: () {
                              controller.onSelectAddress(address);
                            },
                            title: Row(
                              children: [
                                Container(
                                  width: 50,
                                  child: Text(
                                    address.name!,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  address.phone!,
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 14),
                                ),
                                SizedBox(width: 5),
                                GetBuilder<AddressBookController>(
                                  id: "checkBox",
                                  init: controller,
                                  builder: (_) => address.defaultStatus == 1
                                      ? Container(
                                          width: 30,
                                          height: 20,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.red, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Text(
                                            "默认",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 12),
                                          ),
                                        )
                                      : Container(),
                                ),
                              ],
                            ),
                            subtitle: Text(
                              "${address.province}${address.city}${address.region}${address.detail}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.black),
                            ),
                            leading: Container(
                              alignment: Alignment.center,
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.red[50],
                              ),
                              child: Text(
                                address.name!,
                                style: TextStyle(color: Colors.red),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            trailing: GestureDetector(
                              onTap: () {
                                controller.handlerEditAddress(address);
                              },
                              child: Icon(Icons.edit_outlined),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 0.1,
                            color: Colors.black,
                          ),
                          Obx(
                            () => controller.isEdit.isTrue
                                ? Container(
                                    alignment: Alignment.centerLeft,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            GetBuilder<AddressBookController>(
                                              id: "checkBox",
                                              init: controller,
                                              builder: (_) => Checkbox(
                                                tristate: true,
                                                shape: const CircleBorder(),
                                                activeColor: Colors.red,
                                                checkColor: Colors.white,
                                                hoverColor: Colors.white,
                                                focusColor: Colors.red,
                                                side: const BorderSide(
                                                  color: Colors.grey,
                                                ),
                                                value:
                                                    address.defaultStatus == 1,
                                                onChanged: (bool? isCheck) {
                                                  controller
                                                      .onChangeDefuatStatus(
                                                          index);
                                                },
                                              ),
                                            ),
                                            Text(
                                              "设为默认地址",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black54),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            controller.handlerDelete(address);
                                          },
                                          child: Text(
                                            "delete".tr,
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                : Container(),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return SizedBox(height: 80);
                  }
                },
              ),
            ),
            Positioned(
              bottom: 0.0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 80,
                color: Colors.white,
                child: GestureDetector(
                  onTap: () {
                    controller.handlerEditAddress(null);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        top: 10, left: 20, right: 20, bottom: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.red,
                    ),
                    child: Text(
                      " + 添加收货地址",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
