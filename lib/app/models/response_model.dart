class ResponseData {
  int code;
  String detail;
  ResponseData({required this.code, required this.detail});

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    return ResponseData(code: json["code"], detail: json["detail"]);
  }
}
