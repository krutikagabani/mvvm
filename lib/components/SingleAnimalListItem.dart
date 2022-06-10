import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/models/Animals.dart';

class SingleAnimalListItem extends StatelessWidget {

  GestureTapCallback onclick;
  Animals obj;

  SingleAnimalListItem({this.onclick, this.obj});

  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: onclick,
      child: Container(
        child: Card(
          color: Colors.white,
          child:  Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.network(
                obj.imageLink.toString(),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Name : "+obj.name.toString(), style: TextStyle(fontSize: 18, color: Colors.white),),
              SizedBox(
                height: 20,
              ),
              Text("Latin name : "+obj.latinName.toString(), style: TextStyle(fontSize: 18, color: Colors.white),),
              SizedBox(
                height: 20,
              ),
              Text("Animal Type : "+obj.animalType.toString(), style: TextStyle(fontSize: 18, color: Colors.white),),
              SizedBox(
                height: 20,
              ),
              Text("Habitats : "+obj.habitat.toString(), style: TextStyle(fontSize: 18, color: Colors.white),),
            ],
          ),
        ),
      ),
    );
  }
}
