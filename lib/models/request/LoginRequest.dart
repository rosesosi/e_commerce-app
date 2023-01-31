/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedmutti@gmail.com"
/// password : "Ahmed@123"
/// repassword : "Ahmed@123"
/// phone : "01010700700"

class LoginRequest {
  LoginRequest({
    this.email,
    this.password,
  });

  LoginRequest.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
  }

  String? email;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    map['email'] = email;
    map['password'] = password;

    return map;
  }
}
