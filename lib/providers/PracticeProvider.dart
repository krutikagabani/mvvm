import 'package:flutter/material.dart';

import '../helpers/ApiHandler.dart';
import '../helpers/error_handler.dart';
import '../models/Practice.dart';
import '../resources/UrlResources.dart';
import '../views/others/NoInternetPage.dart';

class PracticeProvider with ChangeNotifier{

List<Data> alldata;

getAllData(context) async
{
  try {
    await ApiHandler.get(UrlResources.VIEW_DATA).then((json) {
      alldata = json["contacts"].map<Data>((obj) => Data.fromJson(obj)).toList();
      notifyListeners();
    });
  } on ErrorHandler catch (ex) {
    if (ex.message == "Internet Connection Failure") {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => NoInternetPage())
      );
    }
    else if (ex.message == "Connection Problem") {

    }
  }
}
}
