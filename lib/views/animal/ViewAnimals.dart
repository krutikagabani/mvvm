import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mvvm/components/SingleAnimalListItem.dart';
import 'package:mvvm/providers/AnimalProvider.dart';
import 'package:mvvm/views/animal/ViewSecondAnimal.dart';
import 'package:mvvm/views/employee/ViewSecondEmployee.dart';
import 'package:provider/provider.dart';
import '../../models/Animals.dart';
import 'AnimalDetails.dart';


class ViewAnimals extends StatefulWidget {

  @override
  State<ViewAnimals> createState() => ViewAnimalsState();
}

class ViewAnimalsState extends State<ViewAnimals> {

  AnimalProvider provider;
  getdata() async {
    await provider.getAllAnimals(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      provider= Provider.of<AnimalProvider>(context,listen: false);
      getdata();
    });
  }

  @override
  Widget build(BuildContext context) {
    provider= Provider.of<AnimalProvider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("Model View Animal"),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ViewSecondAnimal())
            );
          },
              icon: Icon(Icons.star))
        ],
      ),

      body:  (provider.alldata!=null)
          ? ListView.builder(
        itemCount: provider.alldata.length,
        itemBuilder: (context, index) {
          return SingleAnimalListItem(
            onclick: (){},
            obj: provider.alldata[index],
          );
        },
      )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
