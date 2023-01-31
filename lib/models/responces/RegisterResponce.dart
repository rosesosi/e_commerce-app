import 'package:e_commerce_app/models/responces/Data.dart';
import 'package:e_commerce_app/models/responces/ServerErrors.dart';

/// data : {"name":"esraa","email":"esraa@gmail.com","phone":"01234567901","password":"$2a$12$iIMex8Q7cWT4Fe2NkpqdX.5r1eCxIsHHtCMwk35vJLQPdpVc3dPX.","role":"user","_id":"63d1a3a9ec99a1785edb70a5","createdAt":"2023-01-25T21:48:25.665Z","updatedAt":"2023-01-25T21:48:25.665Z","__v":0}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzZDFhM2E5ZWM5OWExNzg1ZWRiNzBhNSIsImlhdCI6MTY3NDY4MzMwNywiZXhwIjoxNjgyNDU5MzA3fQ.8nT0DDcxkFdoEAYznfxHHt5_2jkgTThDRoIK-jcjwkA"

class RegisterResponce {
  RegisterResponce({this.user, this.token, this.errors});

  RegisterResponce.fromJson(dynamic json) {
    user = json['data'] != null ? User.fromJson(json['data']) : null;
    token = json['token'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add(ServerErrors.fromJson(v));
      });
    }
  }

  User? user;
  String? token;
  List<ServerErrors>? errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['data'] = user?.toJson();
    }
    map['token'] = token;
    if (errors != null) {
      map['errors'] = errors?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  String mergeErrors() {
    String message = '';
    errors?.forEach((error) {
      message += ' ${error.msg ?? ""} + \n';
    });
    return message;
  }
}
