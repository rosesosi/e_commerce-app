import 'package:e_commerce_app/MyTheme.dart';
import 'package:e_commerce_app/providers/AppConfigeProvider.dart';
import 'package:e_commerce_app/ui/home/HomeScreen.dart';
import 'package:e_commerce_app/ui/login/LoginScreen.dart';
import 'package:e_commerce_app/ui/register/RegisterScreen.dart';
import 'package:e_commerce_app/ui/splash/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<AppConfigeProvider>(
      create: (buildContext) => AppConfigeProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      theme: MyTheme.MyTheme1,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        RegisterScreen.routeName: (_) => RegisterScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
      },
    );
  }
}
