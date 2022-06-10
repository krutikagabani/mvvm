import 'package:flutter/material.dart';
import 'package:mvvm/providers/PracticeProvider.dart';

import '../models/Practice.dart';

class SingleDataListItem extends StatelessWidget {
  GestureTapCallback onclick;

  Data obj;
  VoidCallback deleteclick;

  SingleDataListItem({this.onclick, this.obj, this.deleteclick});

  PracticeProvider provider;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3.7,
                    child: Column(
                      children: [
                        Image.network(
                          obj.userimage.toString(),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("id : " + obj.id.toString()),
                      ],
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name : " + obj.name.toString(),
                            textAlign: TextAlign.left,
                          ),
                          Text("Email : " + obj.email.toString()),
                          Text("Address : " + obj.address.toString()),
                          // Text("Female/Male : " + obj.gender.toString()),
                          //(obj.gender=="male") ? Text('M'"/""F",) : Text('M'"/""F",style: TextStyle(fontWeight: FontWeight.bold),),
                          (obj.gender == "male")
                              ? Row(
                                  children: [
                                    Text("M",style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text("/"),
                                    Text("F"),
                                  ],
                                )
                              : Row(
                            children: [
                              Text("M"),
                              Text("/"),
                              Text("F",style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text("Contact No : "),
                              Column(
                                children: [
                                  Text("Mobile : " +
                                      obj.phone.mobile.toString()),
                                  Text("Home : " + obj.phone.home.toString()),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // Text("Contact No : " + obj.phone.toString()),
              SizedBox(
                height: 5,
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(1),
                child: GestureDetector(
                  onTap: onclick,
                  child: Text(
                    "REMOVE",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
