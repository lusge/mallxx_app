import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:mallxx_app/app/modules/address_book/providers/address_provider.dart';
import '/app/models/address_model.dart';

typedef ConfirmCallback = void Function(Address);

class EditAddressView extends StatefulWidget {
  final Address? address;
  final ConfirmCallback onConfirm;
  const EditAddressView({
    Key? key,
    this.address,
    required this.onConfirm,
  }) : super(key: key);

  @override
  _EditAddressViewState createState() => _EditAddressViewState();
}

class _EditAddressViewState extends State<EditAddressView> {
  Address address = Address();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _regionController = TextEditingController();
  TextEditingController _detailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _regionController.dispose();
    _detailController.dispose();
  }

  Widget _itemTextField({
    String? value,
    required String title,
    required void Function(String) onChanged,
    bool? enabled,
    VoidCallback? onTap,
    showArrow = false,
  }) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: 350,
      child: GestureDetector(
        onTap: onTap,
        child: TextField(
          controller: TextEditingController.fromValue(
            TextEditingValue(
              text: value ?? '',
              selection: TextSelection.fromPosition(
                TextPosition(
                    affinity: TextAffinity.downstream,
                    offset: '${value}'.length),
              ),
            ),
          ),
          enabled: enabled,
          onChanged: onChanged,
          decoration: InputDecoration(
            suffixIcon:
                showArrow ? Icon(Icons.keyboard_arrow_right_outlined) : null,
            fillColor: Colors.grey[200],
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.grey.shade200,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.grey.shade200,
              ),
            ),
            icon: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.address != null) {
      address = widget.address!;
    }
    _nameController.text = address.name ?? "";
    _phoneController.text = address.phone ?? "";
    _regionController.text =
        "${address.province ?? ""} ${address.city ?? ""} ${address.region ?? ""}";
    _detailController.text = address.detail ?? "";
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.address == null ? "add_address".tr : "edit_address".tr),
        centerTitle: true,
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              // height: 40,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _itemTextField(
                    title: "收货人    ",
                    value: address.name ?? "",
                    onChanged: (value) {
                      setState(() {
                        address.name = value;
                      });
                    },
                  ),
                  _itemTextField(
                    value: address.phone ?? "",
                    onChanged: (value) {
                      setState(() {
                        address.phone = value;
                      });
                    },
                    title: "手机号码",
                  ),
                  _itemTextField(
                    value:
                        "${address.province ?? ""} ${address.city ?? ""} ${address.region ?? ""}",
                    onChanged: (value) {},
                    title: "所在地区",
                    enabled: false,
                    showArrow: true,
                    onTap: () {
                      Pickers.showAddressPicker(
                        context,
                        initProvince: address.province ?? "",
                        initCity: address.province ?? "",
                        initTown: address.region ?? "",
                        onConfirm: (p, c, t) {
                          setState(() {
                            address.province = p;
                            address.city = c;
                            address.region = t;
                          });
                        },
                      );
                    },
                  ),
                  _itemTextField(
                    value: address.detail ?? "",
                    onChanged: (value) {
                      setState(() {
                        address.detail = value;
                      });
                    },
                    title: "详细地址",
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              width: MediaQuery.of(context).size.width,
              height: 80,
              child: GestureDetector(
                onTap: () {
                  widget.onConfirm(address);
                  Get.back();
                },
                child: Container(
                  alignment: Alignment.center,
                  margin:
                      EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.red,
                  ),
                  child: Text(
                    "finish".tr,
                    style: TextStyle(color: Colors.white, fontSize: 18),
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
