import 'package:flutter/material.dart';
import 'package:mvvm/resources/StyleResources.dart';
import 'package:mvvm/views/auth/RegisteredScreen.dart';
import 'package:mvvm/widgets/MyPrimaryButton.dart';
import 'package:mvvm/widgets/MyTextField.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'LogOutScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _mobileno = TextEditingController();
  TextEditingController _password = TextEditingController();

  _loginbtn() {
    return Center(
      child: MyPrimaryButton(
        buttontext: "log in",
        onclick: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => LogoutScreen()));
        },
      ),
    );
  }

  _loginform() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Enter your Mobile no.",
            style: StyleResources.lableText,
          ),
          SizedBox(
            height: 20,
          ),
          MyTextField(
            controller: _mobileno,
            hinttext: "Enter Mobile number",
            ispassword: false,
            keyboard: TextInputType.phone,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Enter your Password",
            style: StyleResources.lableText,
          ),
          SizedBox(
            height: 18,
          ),
          MyTextField(
            controller: _password,
            hinttext: "Enter password",
            ispassword: true,
            keyboard: TextInputType.text,
          ),
          SizedBox(
            height: 50,
          ),
          _loginbtn(),
          SizedBox(
            height: 50,
          ),
          Center(

            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: 50,
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RegisteredScreen()));
                },
                child: Text(
                  "Create New Account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
          ),
        ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login screen"),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(30),
            child: _loginform(),
        ),
      ),
    );
  }
}
