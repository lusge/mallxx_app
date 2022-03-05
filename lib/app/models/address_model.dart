class Address {
  int? id;
  int? memberId;
  String? name;
  String? phone;
  int? defaultStatus;
  String? postCode;
  String? province;
  String? city;
  String? region;
  String? detail;

  Address({
    this.id,
    this.memberId,
    this.phone,
    this.defaultStatus,
    this.postCode,
    this.province,
    this.city,
    this.region,
    this.detail,
  });

  Address.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    memberId = json["member_id"];
    name = json["name"];
    phone = json["phone"];
    defaultStatus = json["default_status"];
    postCode = json["post_code"];
    province = json["province"];
    city = json["city"];
    region = json["region"];
    detail = json["detail"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = id;
    data["member_id"] = memberId;
    data["name"] = name;
    data["phone"] = phone;
    data["default_status"] = defaultStatus;
    data["post_code"] = postCode;
    data["province"] = province;
    data["city"] = city;
    data["region"] = region;
    data["detail"] = detail;

    return data;
  }
}

class AddressList {
  int code;
  List<Address>? data;
  String detail;
  AddressList({required this.code, required this.detail, this.data});

  factory AddressList.fromJson(Map<String, dynamic> json) {
    List<Address> data = <Address>[];
    if (json["data"] != null) {
      json["data"].forEach((v) {
        data.add(Address.fromJson(v));
      });
    }
    return AddressList(code: json["code"], detail: json["detail"], data: data);
  }
}

class AddressInfo {
  int code;
  Address? data;
  String detail;
  AddressInfo({required this.code, required this.detail, this.data});
  factory AddressInfo.fromJson(Map<String, dynamic> json) {
    Address? info = null;
    if (json["data"] != null) {
      info = Address.fromJson(json["data"]);
    }
    return AddressInfo(code: json["code"], detail: json["detail"], data: info);
  }
}
