import 'package:flutter/material.dart';

import 'LoginScreen.dart';

class LogoutScreen extends StatefulWidget {
  @override
  State<LogoutScreen> createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Logout Screen"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30),

          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text(
                "Log Out",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),

        ),
      ),
    );
  }
}
