import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvvm/resources/UrlResources.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../../providers/ProductProvider.dart';
import '../../widgets/MyPrimaryButton.dart';
import '../../widgets/MyTextField.dart';
import 'ViewProducts.dart';

class UpdateProduct extends StatefulWidget {
  var updatpid = "";

  UpdateProduct({this.updatpid});

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  TextEditingController _name = TextEditingController();
  TextEditingController _qty = TextEditingController();
  TextEditingController _price = TextEditingController();

  ProductProvider provider;

  getdata() async {
    Uri url = Uri.parse(UrlResources.GET_SINGLE_PRODUCT);
    var response = await http.post(url, body: {"pid": widget.updatpid});
    if (response.statusCode == 200) {
      var body = response.body.toString();
      var json = jsonDecode(body);
      setState(() {
        _name.text = json["data"]["pname"].toString();
        _qty.text = json["data"]["qty"].toString();
        _price.text = json["data"]["price"].toString();
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<ProductProvider>(context, listen: false);
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Product"),
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

                    Uri url = Uri.parse(UrlResources.UPDATE_PRODUCT);

                    var response = await http.post(url, body: {
                      "pname": nm,
                      "qty": qt,
                      "price": pri,
                      "pid": widget.updatpid,
                    });
                    if (response.statusCode == 200) {
                      var body = response.body.toString();
                      var json = jsonDecode(body);
                      var message = json["message"].toString();
                      Fluttertoast.showToast(
                          msg: message,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0);

                      if(json["status"]=="true")
                        {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => ViewProducts()));

                        }
                      //API
                    };
                  },

                  buttontext: "Update",

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
