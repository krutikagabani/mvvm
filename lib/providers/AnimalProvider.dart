import 'package:flutter/material.dart';
import 'package:mvvm/views/others/NoInternetPage.dart';
import '../helpers/ApiHandler.dart';
import '../helpers/error_handler.dart';
import '../models/Animals.dart';
import '../resources/UrlResources.dart';

class AnimalProvider with ChangeNotifier
{
  List<Animals> alldata;

  getAllAnimals(context) async
  {
    try {
      await ApiHandler.get(UrlResources.VIEW_ANIMAL).then((json){
        alldata = json.map<Animals>((obj)=>Animals.fromJson(obj)).toList();
        notifyListeners();
      });
    } on ErrorHandler catch (ex) {

      if(ex.message=="Internet Connection Failure")
      {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>NoInternetPage())
        );
      }
      else if(ex.message=="Connection Problem")
      {

      }
    }
  }




  addAnimal() async
  {
  }

  updateAnimal()
  {

  }


  deleteAnimal()
  {

  }
}