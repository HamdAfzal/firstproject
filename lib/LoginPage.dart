import 'package:first_project/utility/MyRoutes.dart';
import 'package:first_project/widgets/Drawer.dart';
import 'package:first_project/widgets/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => LoginPageState();
  String usernameController = TextEditingController().text;
}

class LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  static String KEYNAME = 'name';

  moveToHome() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 2));
      var sharedPref = await SharedPreferences.getInstance();
      sharedPref.setBool(SplashScreen.KEYLOGIN, true);
      Navigator.pushNamed(context, MyRoutes.home);

      var sharedPrefName = await SharedPreferences.getInstance();
      sharedPrefName.setString(KEYNAME, usernameController.text);
      setState(() {
        changeButton = false;
      });
    }
  }
@override
Widget build(BuildContext context) {
  return Material(
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/login.png",
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Welcome $name",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black),
                textScaleFactor: 2.0,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: usernameController,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  labelStyle: TextStyle(color: Colors.black),
                  hintText: "Enter User Name",
                  hintStyle: TextStyle(color: Colors.black),
                  labelText: "User Name",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "UserName Required";
                  }
                  return null;
                },
                onChanged: (value) {
                  name = value;
                  setState(() {});
                },
              ),
              TextFormField(
                style: const TextStyle(color: Colors.black),
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Enter Password",
                  hintStyle: TextStyle(color: Colors.black),
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.black),
                ),
                validator: (value) {
                  if ((value ?? "").isEmpty) {
                    return "Password Required";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30.0,
              ),
              Material(
                borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                color: Colors.amber,
                child: InkWell(
                  onTap: moveToHome,
                  splashColor: Colors.black,
                  child: AnimatedContainer(
                    width: changeButton ? 50 : 100,
                    height: 50,
                    alignment: Alignment.center,
                    duration: const Duration(seconds: 1),
                    child: changeButton
                        ? const Icon(
                      Icons.done,
                      color: Colors.white,
                    )
                        : const Text("Login"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}}
