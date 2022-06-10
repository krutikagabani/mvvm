import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm/providers/ProductProvider.dart';
import 'package:mvvm/views/product/ViewProducts.dart';
import 'package:provider/provider.dart';

import '../../helpers/ApiHandler.dart';
import '../../resources/UrlResources.dart';
import '../../widgets/MyPrimaryButton.dart';
import '../../widgets/MyTextField.dart';
import '../employee/ViewEmployee.dart';

class AddProduct extends StatefulWidget {
  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController _name = TextEditingController();
  TextEditingController _qty = TextEditingController();
  TextEditingController _price = TextEditingController();

  ProductProvider provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<ProductProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AddProduct..."),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name : ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                MyTextField(
                  controller: _name,
                  hinttext: "Enter Product's name",
                  ispassword: false,
                  keyboard: TextInputType.text,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Qty : ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                MyTextField(
                  controller: _qty,
                  hinttext: "Enter qty",
                  ispassword: false,
                  keyboard: TextInputType.number,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Price : ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                MyTextField(
                  controller: _price,
                  hinttext: "Enter price",
                  ispassword: false,
                  keyboard: TextInputType.number,
                ),
                SizedBox(
                  height: 40,
                ),
                MyPrimaryButton(
                  onclick: () async {
                    var nm = _name.text.toString();
                    var qt = _qty.text.toString();
                    var pri = _price.text.toString();

                    if (nm=="" && qt=="" && pri=="")
                    {
                      Fluttertoast.showToast(
                          msg: "Record Not Inserted", // message
                          toastLength: Toast.LENGTH_SHORT, // length
                          gravity: ToastGravity.BOTTOM, // location
                          timeInSecForIosWeb: 1 // duration
                      );
                    }

                    else

                    {
                      Map<String, String> params = {
                        "pname":nm,
                        "qty":qt,
                        "price":pri
                      };

                      await provider.addProduct(context, params);

                      if (provider.isinserted) {
                        Fluttertoast.showToast(
                            msg: "Record Inserted", // message
                            toastLength: Toast.LENGTH_SHORT, // length
                            gravity: ToastGravity.CENTER, // location
                            timeInSecForIosWeb: 1 // duration
                        );

                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ViewProducts()));
                      } else {
                        Fluttertoast.showToast(
                            msg: "Record Not Inserted", // message
                            toastLength: Toast.LENGTH_SHORT, // length
                            gravity: ToastGravity.BOTTOM, // location
                            timeInSecForIosWeb: 1 // duration
                        );
                      }
                    }
                    //200 ok
                    //400 not found
                    //500 server
                    // _name.text="";
                    // _qty.text="";
                    // _price.text="";
                    //API
                    // Uri url = Uri.parse("http://picsyapps.com/studentapi/insertProductNormal.php");
                    // var response = await http.post(url,body: {
                    //   "pname":nm,
                    //   "qty":qt,
                    //   "price":pri
                    // });
                    // if(response.statusCode==200)
                    // {
                    //   var body = response.body.toString();
                    //   var json = jsonDecode(body);
                    // }
                    // else
                    // {
                    //   print("API Error");
                    // }
                    //API
                  },
                  buttontext: "Submit",
                  // child: Text("Submit",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)) ,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
