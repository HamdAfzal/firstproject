import 'dart:async';
import 'package:first_project/HomePage.dart';
import 'package:first_project/signUp.dart';
import 'package:first_project/utility/MyRoutes.dart';
import 'package:first_project/widgets/FullView.dart';
import 'package:first_project/widgets/SplashScreen.dart';
import 'package:first_project/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'LoginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(),
      darkTheme: MyTheme.darkTheme(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        MyRoutes.home: (context) => HomePage(),
        MyRoutes.login: (context) => LoginPage(),
        MyRoutes.signup: (context) => SignUp(),
        MyRoutes.fullView: (context) => FullView(
              product: null,
            ),
      },
    );
  }


}
