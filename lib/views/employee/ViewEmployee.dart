import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm/components/SingleEmployeeListItem.dart';
import 'package:mvvm/helpers/ApiHandler.dart';
import 'package:mvvm/helpers/error_handler.dart';
import 'package:mvvm/models/Employees.dart';
import 'package:mvvm/providers/EmployeeProvider.dart';
import 'package:mvvm/resources/UrlResources.dart';
import 'package:mvvm/views/employee/ViewSecondEmployee.dart';
import 'package:mvvm/views/others/NoInternetPage.dart';
import 'package:provider/provider.dart';
import '../../models/Products.dart';
import '../others/ConnectionProblem.dart';

class ViewEmployee extends StatefulWidget {

  @override
  State<ViewEmployee> createState() => _ViewEmployeeState();
}

class _ViewEmployeeState extends State<ViewEmployee> {


  EmployeeProvider provider;
  getdata() async {
    print("Voew method called");
    await provider.getAllEmployee(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      provider= Provider.of<EmployeeProvider>(context,listen: false);
      getdata();
    });
  }

  @override
  Widget build(BuildContext context) {
    provider= Provider.of<EmployeeProvider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("View Employee by Model"),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ViewSecondEmployee())
            );
          },
              icon: Icon(Icons.star))
        ],
        centerTitle: true,
      ),
      body:  (provider.alldata!=null)?
      ListView.builder(
        itemCount: provider.alldata.length,
        itemBuilder: (context,index)
        {
          return SingleEmployeeListItem(
            onclick: (){},
            deleteclick: ()async {

              Map<String, String> params = {
                "eid":provider.alldata[index].eid.toString()
              };
              await provider.deleteEmployee(context, params);
              if (provider.isdeleted) {
                await provider.getAllEmployee(context);
                Fluttertoast.showToast(
                    msg: "Record Deleted", // message
                    toastLength: Toast.LENGTH_SHORT, // length
                    gravity: ToastGravity.CENTER, // location
                    timeInSecForIosWeb: 1 // duration
                );

              } else {
                Fluttertoast.showToast(
                    msg: "Record Not Deleted", // message
                    toastLength: Toast.LENGTH_SHORT, // length
                    gravity: ToastGravity.BOTTOM, // location
                    timeInSecForIosWeb: 1 // duration
                );
              }
            },
            obj: provider.alldata[index],
          );
        },
      )
          :Center(child: CircularProgressIndicator()),
    );
  }
}
