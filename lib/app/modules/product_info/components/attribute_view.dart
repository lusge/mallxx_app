import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttributeView extends StatefulWidget {
  const AttributeView({Key? key}) : super(key: key);

  @override
  _AttributeViewState createState() => _AttributeViewState();
}

class _AttributeViewState extends State<AttributeView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 50,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "product_parameters".tr,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.close,
                  size: 25,
                ),
              )
            ],
          ),
          Container(
            color: Colors.grey,
            width: double.infinity,
            height: 1,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            // width: double.infinity,
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 0.2,
                      ),
                    ),
                  ),
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "品牌".tr,
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "xiaomi".tr,
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
