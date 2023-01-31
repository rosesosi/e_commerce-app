import 'package:e_commerce_app/models/responces/Data.dart';
import 'package:flutter/material.dart';

class AppConfigeProvider extends ChangeNotifier {
  String? token;
  User? user;

  void updateToken(String? token) {
    this.token = token;
  }

  void updateUser(User? user) {
    this.user = user;
  }
}
