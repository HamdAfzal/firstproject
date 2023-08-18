// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme() => ThemeData(
      primarySwatch: Colors.deepOrange,
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ));

  static ThemeData darkTheme() => ThemeData(brightness: Brightness.dark);
}
