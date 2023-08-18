import 'package:first_project/utility/MyRoutes.dart';
import 'package:first_project/widgets/SplashScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class lowerNavigation extends StatefulWidget {
  @override
  State<lowerNavigation> createState() => _lowerNavigationState();
}

class _lowerNavigationState extends State<lowerNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
     setState(() async {
      if (index == 1) {
        Navigator.pushNamed(context, MyRoutes.signup);
      } else if (index == 2) {
        var sharedPref = await SharedPreferences.getInstance();
        sharedPref.setBool(SplashScreen.KEYLOGIN,false);
        Navigator.pushReplacementNamed(context, MyRoutes.login);
      }
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: ("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo_outlined),
              label: ("Add New Account")),
          BottomNavigationBarItem(
              icon: Icon(Icons.exit_to_app_outlined), label: ("Log Out")),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
