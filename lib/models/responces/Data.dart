class User {
  User({
    this.name,
    this.email,
    this.phone,
    this.password,
    this.id,
  });

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    id = json['_id'];
  }

  String? name;
  String? email;
  String? phone;
  String? password;

  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['password'] = password;
    map['_id'] = id;
    return map;
  }
}
