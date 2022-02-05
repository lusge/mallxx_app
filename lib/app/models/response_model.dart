class ReponseData {
  int code;
  String detail;
  ReponseData({required this.code, required this.detail});

  factory ReponseData.fromJson(Map<String, dynamic> json) {
    return ReponseData(code: json["code"], detail: json["detail"]);
  }
}
