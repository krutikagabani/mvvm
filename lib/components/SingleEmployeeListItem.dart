import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvvm/views/product/UpdateProduct.dart';
import 'package:provider/provider.dart';
import '../models/Employees.dart';
import '../providers/EmployeeProvider.dart';
import '../views/employee/ViewEmployee.dart';

class SingleEmployeeListItem extends StatelessWidget {

  GestureTapCallback onclick;

  EmployeeProvider provider;

  Employees obj;

  VoidCallback deleteclick;

  SingleEmployeeListItem({this.onclick,this.obj,this.deleteclick});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:onclick,
      child: Container(
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(15),
           child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              // Image.network(alldata[index].imageLink.toString(),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Ename : "+obj.ename.toString(),style: TextStyle(color: Colors.black, fontSize: 18)),
                  Text("Salary : "+"Rs. "+obj.salary.toString(),style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold),),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Gender : "+obj.gender.toString(),style: TextStyle(fontSize: 18,color: Colors.black)),

                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/2.5,
                    child: ElevatedButton(
                      onPressed: deleteclick,
                      child: Text("Delete"),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/2.5,
                    child: ElevatedButton(
                      onPressed: (){},
                      child: Text("Update"),
                    ),
                  ),
                ],
              ),
            ],
          ),
          ),
        ),
      ),
    );
  }
}
