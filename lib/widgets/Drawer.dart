import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../LoginPage.dart';

class drawer extends StatefulWidget {
  @override
  State<drawer> createState() => _drawerState();
  String? result;
  drawer({Key? key, this.result}) : super(key: key);
}



class _drawerState extends State<drawer> {
  final imageURL = "https://agfqqrfoeq.cloudimg.io/https://indianswhocode.com/_nuxt/img/att1Fu3wGJPAMewAN.d7bb0f7.jpg";
  static String? userSignedIn;
  recieveData() async {
    var sharedPref = await SharedPreferences.getInstance();
    userSignedIn = sharedPref.getString(LoginPageState.KEYNAME);

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        builder:(context,snapshot) {
          return Drawer(
            child: Container(
              color: Colors.deepOrange,
              child: ListView(
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text(userSignedIn ?? ""),
                    accountEmail: Text("hamdafzal@gmail.com"),
                    currentAccountPicture: CircleAvatar(
                        backgroundImage: NetworkImage(imageURL)),
                    decoration: BoxDecoration(
                        color: Colors.deepOrange
                    ),
                  ),
                  ListTile(
                    leading: Icon(CupertinoIcons.home, color: Colors.white,),
                    title: Text("Home", style: TextStyle(
                        color: Colors.white
                    ),
                      textScaleFactor: 1.2,
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      CupertinoIcons.location, color: Colors.white,),
                    title: Text("Location", style: TextStyle(
                        color: Colors.white
                    ),
                      textScaleFactor: 1.2,
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      CupertinoIcons.lab_flask, color: Colors.white,),
                    title: Text("Experiment", style: TextStyle(
                      color: Colors.white,
                    ),
                      textScaleFactor: 1.2,
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      CupertinoIcons.gamecontroller_fill, color: Colors.white,),
                    title: Text("Games", style: TextStyle(
                      color: Colors.white,
                    ),
                      textScaleFactor: 1.2,
                    ),
                  )

                ],
              ),
            ),
          );
        },
      future: recieveData(),
    );

        }
}