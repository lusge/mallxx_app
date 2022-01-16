class MemberResponse {
  int? code;
  Member? data;
  String? detail;
  MemberResponse({
    this.code,
    this.data,
    this.detail,
  });

  factory MemberResponse.fromJson(Map<String, dynamic> json) {
    var data;
    if (json["data"] != null) {
      data = Member.fromJson(json["data"]["member"]);
    }
    return MemberResponse(
      code: json["code"],
      detail: json["detail"],
      data: data,
    );
  }
}

class Member {
  int? Id;
  String? Username;
  String? Password;
  String? Phone;
  String? Email;
  String? Avatar;
  int? Status;
  int? AddTime;
  int? MemberLevel;
  int? Gender;
  int? Birthday;
  String? Token;
  int? Integral;
  int? Coupon;
  int? Followers;

  Member({
    this.Id,
    this.Username,
    this.Password,
    this.Phone,
    this.Email,
    this.Avatar,
    this.Status,
    this.AddTime,
    this.MemberLevel,
    this.Gender,
    this.Birthday,
    this.Token,
    this.Integral,
    this.Coupon,
    this.Followers,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": Id,
      "username": Username,
      "password": Password,
      "phone": Phone,
      "email": Email,
      "avatar": Avatar,
      "status": Status,
      "add_time": AddTime,
      "member_level": MemberLevel,
      "gender": Gender,
      "birthday": Birthday,
      "token": Token,
      "followers": Followers,
      "integral": Integral,
      "coupon": Coupon,
    };
  }

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      Id: json["id"],
      Username: json["username"],
      Password: json["password"],
      Phone: json["phone"],
      Email: json["email"],
      Avatar: json["avatar"],
      Status: json["status"],
      AddTime: json["add_time"],
      MemberLevel: json["member_level"],
      Gender: json["gender"],
      Birthday: json["birthday"],
      Token: json["token"],
      Coupon: json["coupon"],
      Integral: json["integral"],
      Followers: json["followers"],
    );
  }
}
