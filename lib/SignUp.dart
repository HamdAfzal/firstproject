import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  final _formKey1 = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final checkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey1,
            child: Column(
              children: [
                Image.asset(
                  "assests/images/login.png",
                  fit: BoxFit.fill,
                  scale: 1,
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Sign Up",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Colors.black),
                  //      textScaleFactor: 3.0,
                ),
                Row(children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: Text("First Name"),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: Text("Last Name"),
                      ),
                    ),
                  ),
                ]),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text("Enter Your Email Address"),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text("Enter Your Password"),
                  ),
                  controller: passwordController,
                  obscureText: true,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text("Re-Enter Your Password"),
                  ),
                  controller: checkController,
                  obscureText: true,
                  validator: (value) {
                    if (checkController.value != passwordController.value) {
                      return "Password does not match";
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
