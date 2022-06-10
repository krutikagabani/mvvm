import 'package:flutter/material.dart';
import 'package:mvvm/resources/StyleResources.dart';
import 'package:mvvm/widgets/MyPrimaryButton.dart';

import 'LoginScreen.dart';

class RegisteredScreen extends StatefulWidget {

  @override
  State<RegisteredScreen> createState() => _RegisteredScreenState();
}

class _RegisteredScreenState extends State<RegisteredScreen> {

  TextEditingController _username = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _email = TextEditingController();


  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registered Screen"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter Username",
                  style:StyleResources.lableText,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _username,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ), hintText: "Username"),
                  validator: (val)
                  {
                    if(val.isEmpty)
                    {
                      return "Please Enter Username";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Enter your mobile number",
                  style:StyleResources.lableText,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _mobile,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ), hintText: "Mobile number"),
                  validator: (val)
                  {
                    if(val.length<=0)
                    {
                      return "Please enter your mobile number";
                    }
                    else if(val.length!=10)
                    {
                      return "Please Enter Valid mobile number";
                    }
                    else
                    {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Enter your Password",
                  style: StyleResources.lableText,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _password,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ), hintText: "Password"),
                  validator: (val)
                  {
                    if(val.isEmpty)
                    {
                      return "Please Enter Password";
                    }
                    else if(val.length<=6)
                    {
                      return "Please Enter min 6 charecters";
                    }
                    else{
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Enter your Email",
                  style: StyleResources.lableText,
                ),
                SizedBox(
                  height: 18,
                ),
                TextFormField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      hintText: "Email Address"),
                  validator: (val)
                  {
                    if(val.length<=0 || val.isEmpty)
                    {
                      return "Please Enter your Email";
                    }
                    else if(!RegExp(r'\S+@\S+\.\S+').hasMatch(val))
                    {
                      return "Pleasr Enter Valid Email";
                    }
                    else{
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: MyPrimaryButton(
                    buttontext: "Register",
                    onclick: (){},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
