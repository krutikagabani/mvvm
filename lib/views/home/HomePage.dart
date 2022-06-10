import 'package:flutter/material.dart';
import 'package:mvvm/views/animal/AnimalDetails.dart';
import 'package:mvvm/views/animal/ViewAnimals.dart';
import 'package:mvvm/views/employee/ViewEmployee.dart';
import 'package:mvvm/views/product/AddProduct.dart';

import '../employee/AddEmployee.dart';
import '../product/ViewProducts.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                child: Text(
                  "K",
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
              accountName: Text(
                "Kesar Gabani",
                style: TextStyle(fontSize: 20),
              ),
              accountEmail: Text(
                "kesar1234@gmail.com",
                style: TextStyle(fontSize: 15),
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.add_shopping_cart_outlined,
                size: 30.0,
              ),
              title: Text(
                "Add Product",
                style: TextStyle(fontSize: 20.0),
              ),
              trailing: Icon(
                Icons.double_arrow_outlined,
                size: 25.0,
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddProduct()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.production_quantity_limits_rounded,
                size: 30.0,
              ),
              title: Text(
                "View Product",
                style: TextStyle(fontSize: 20.0),
              ),
              trailing: Icon(
                Icons.double_arrow_outlined,
                size: 25.0,
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ViewProducts()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.account_circle_sharp,
                size: 30.0,
              ),
              title: Text(
                "Add Employee",
                style: TextStyle(fontSize: 20.0),
              ),
              trailing: Icon(
                Icons.double_arrow_outlined,
                size: 25.0,
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddEmployee()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.account_circle_sharp,
                size: 30.0,
              ),
              title: Text(
                "View Employee",
                style: TextStyle(fontSize: 20.0),
              ),
              trailing: Icon(
                Icons.double_arrow_outlined,
                size: 25.0,
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ViewEmployee()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.admin_panel_settings_outlined,
                size: 30.0,
              ),
              title: Text(
                "View Animal",
                style: TextStyle(fontSize: 20.0),
              ),
              trailing: Icon(
                Icons.double_arrow_outlined,
                size: 25.0,
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ViewAnimals()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
