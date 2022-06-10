import 'package:flutter/material.dart';
import 'package:mvvm/providers/AnimalProvider.dart';
import 'package:mvvm/providers/EmployeeProvider.dart';
import 'package:mvvm/providers/PracticeProvider.dart';
import 'package:mvvm/providers/ProductProvider.dart';
import 'package:mvvm/views/auth/LoginScreen.dart';
import 'package:mvvm/views/employee/ViewEmployee.dart';
import 'package:mvvm/views/home/HomePage.dart';
import 'package:mvvm/views/others/NoInternetPage.dart';
import 'package:mvvm/views/practice/ViewData.dart';
import 'package:provider/provider.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => EmployeeProvider()),
        ChangeNotifierProvider(create: (context) => AnimalProvider()),
        ChangeNotifierProvider(create: (context) => PracticeProvider()),
      ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(

            primarySwatch: Colors.red,
          ),
          home:  ViewData(),
    )
    );
  }
}

