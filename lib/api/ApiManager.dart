import 'dart:convert';

import 'package:e_commerce_app/models/request/LoginRequest.dart';
import 'package:e_commerce_app/models/request/RegisterRequest.dart';
import 'package:e_commerce_app/models/responces/LoginResponse.dart';
import 'package:e_commerce_app/models/responces/RegisterResponce.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static const baseUrl = 'route-ecommerce.vercel.app';
  static const registerurl = 'api/v1/auth/signup';
  static const LoginUrl = 'api/v1/auth/signin';

  Future<RegisterResponce> register(String name, String email, String password,
      String repassword, String phone) async {
    var requestBody = RegisterRequest(
        name: name,
        email: email,
        password: password,
        repassword: repassword,
        phone: phone);
    var url = Uri.https(baseUrl, registerurl);
    var response = await http.post(url, body: requestBody.toJson());
    return RegisterResponce.fromJson(jsonDecode(response.body));
  }

  Future<LoginResponse> Login(String email, String password) async {
    var requestBody = LoginRequest(email: email, password: password);
    var url = Uri.https(baseUrl, LoginUrl);
    var response = await http.post(url, body: requestBody.toJson());
    return LoginResponse.fromJson(jsonDecode(response.body));
  }
}
