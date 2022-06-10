import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvvm/providers/ProductProvider.dart';
import 'package:mvvm/views/product/UpdateProduct.dart';

import '../models/Products.dart';

class SingleProductListItem extends StatelessWidget {
  GestureTapCallback onclick;

  Products obj;
  VoidCallback deleteclick;

  SingleProductListItem({this.onclick, this.obj, this.deleteclick});

  ProductProvider provider;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onclick,
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
                    Text(
                      "Pname : " + obj.pname.toString(),
                      style: TextStyle(
                          color: Colors.black),
                    ),
                    Text("Qty : " + obj.qty.toString(),
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Price : " + obj.price.toString(),
                        style: TextStyle(color: Colors.black)),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: ElevatedButton(
                        onPressed: deleteclick,
                        child: Text("Delete"),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: ElevatedButton(
                        onPressed: () {
                          var pid = obj.pid.toString();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => UpdateProduct(updatpid: pid,)));
                        },
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
