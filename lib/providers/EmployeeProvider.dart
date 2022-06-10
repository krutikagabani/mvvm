import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/views/others/NoInternetPage.dart';
import '../helpers/ApiHandler.dart';
import '../helpers/error_handler.dart';
import '../models/Employees.dart';
import '../resources/UrlResources.dart';
import '../views/others/ConnectionProblem.dart';

class EmployeeProvider with ChangeNotifier {
  List<Employees> alldata;

  getAllEmployee(context) async {
    try {
      await ApiHandler.get(UrlResources.VIEW_EMPLOYEE).then((json) {
        alldata = json["data"]
            .map<Employees>((obj) => Employees.fromJson(obj))
            .toList();
        notifyListeners();
      });
    } on ErrorHandler catch (ex) {
      if (ex.message == "Internet Connection Failure") {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => NoInternetPage()));
      } else if (ex.message == "Connection Problem") {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ConnectionProblem()));
      }
    }
  }

  bool isinserted = false;

  addEmployee(context, params) async {
    try {
      await ApiHandler.post(UrlResources.ADD_EMPLOYEE, body: params)
          .then((json) {
        if (json["status"] == "true") {
          isinserted = true;
        }
        else
          {
            isinserted=false;
          }
      });
    } on ErrorHandler catch (ex) {
      if (ex.message == "Internet Connection Failure") {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => NoInternetPage()));
      } else if (ex.message == "Connection Problem") {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ConnectionProblem()));
      }
    }
  }

  bool isdeleted = false;
  deleteEmployee(context, params) async {
    try {
      await ApiHandler.post(UrlResources.DELETE_EMPLOYEE, body: params)
          .then((json)
      {
        if (json["status"] == "true") {
          isdeleted = true;
        }
        else {
          isdeleted = false;
        }
      });
      notifyListeners();
    } on ErrorHandler catch (ex) {
      if (ex.message == "Internet Connection Failure") {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => NoInternetPage()));
      } else if (ex.message == "Connection Problem") {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ConnectionProblem()));
      }
    }
  }


}

