import 'package:flutter/material.dart';
import 'package:mallxx_app/app/models/address_model.dart';

class OrderAddressView extends StatefulWidget {
  final VoidCallback onTab;
  final bool isChange;
  Address address;
  OrderAddressView({
    Key? key,
    required this.onTab,
    this.isChange = true,
    required this.address,
  }) : super(key: key);

  @override
  _OrderAddressViewState createState() => _OrderAddressViewState();
}

class _OrderAddressViewState extends State<OrderAddressView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTab();
      },
      child: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Image.asset(
              "assets/icons/icon_address.png",
              width: 40,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.address.name ?? "",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      widget.address.phone ?? "",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 270,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "${widget.address.province ?? ""}${widget.address.city ?? ""} ${widget.address.region ?? ""} ${widget.address.detail ?? ""}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            widget.isChange
                ? Icon(
                    Icons.keyboard_arrow_right_outlined,
                    size: 30,
                    color: Colors.grey,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
