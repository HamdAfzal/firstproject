import 'dart:async';

import 'package:first_project/HomePage.dart';
import 'package:first_project/utility/MyRoutes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../LoginPage.dart';

class SplashScreen extends StatefulWidget {
  static String KEYLOGIN = 'login';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    whereToGO();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: CircleAvatar(
        radius: 150,
        backgroundImage: AssetImage(
          "assets/images/Hannan.png",
        ),
      )),
      backgroundColor: Colors.indigoAccent,
    );
  }

  void whereToGO() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(SplashScreen.KEYLOGIN);

    Timer(const Duration(seconds: 3), () {
      if (isLoggedIn != null && isLoggedIn) {
        Navigator.pushReplacementNamed(context, MyRoutes.home);
      } else {
        Navigator.pushReplacementNamed(context, MyRoutes.login);
      }
    });
  }
}
