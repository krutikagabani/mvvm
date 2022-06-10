import 'package:flutter/material.dart';

class NoInternetPage extends StatefulWidget {
  @override
  State<NoInternetPage> createState() => _NoInternetPageState();
}

class _NoInternetPageState extends State<NoInternetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("img/nointernet.png"),
      ),
    );
  }
}
