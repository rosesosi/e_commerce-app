import 'package:flutter/material.dart';

class MyTheme {
  static const Color primaryColor1 = Color(0xFF004182);

  static final MyTheme1 = ThemeData(
      primaryColor: primaryColor1,
      scaffoldBackgroundColor: primaryColor1,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor1,
        elevation: 0,
      ));
}
