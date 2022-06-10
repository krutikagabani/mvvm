import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm/components/SingleProductListItem.dart';
import 'package:mvvm/resources/UrlResources.dart';
import 'package:mvvm/views/product/ViewSecondProduct.dart';
import 'package:provider/provider.dart';

import '../../helpers/ApiHandler.dart';
import '../../helpers/error_handler.dart';
import '../../models/Products.dart';
import '../../providers/ProductProvider.dart';
import '../others/ConnectionProblem.dart';
import '../others/NoInternetPage.dart';

class ViewProducts extends StatefulWidget {
  @override
  State<ViewProducts> createState() => _ViewProductsState();
}

class _ViewProductsState extends State<ViewProducts> {

  ProductProvider provider;
  getdata() async {
    await provider.getAllProducts(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      provider= Provider.of<ProductProvider>(context,listen: false);
      getdata();
    });
  }

  @override
  Widget build(BuildContext context) {
    provider= Provider.of<ProductProvider>(context,listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text("ViewProduct..."),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ViewSecondProduct())
            );
          },
              icon: Icon(Icons.star))
        ],
      ),
      body: (provider.alldata != null)
          ? ListView.builder(
              itemCount: provider.alldata.length,
              itemBuilder: (context, index) {
                return SingleProductListItem(
                  onclick: (){},
                  deleteclick: ()async {
                    Map<String, String> params = {
                      "pid":provider.alldata[index].pid.toString()
                    };
                    await provider.deleteProduct(context, params);
                    if (provider.isdeleted) {
                     getdata();
                      Fluttertoast.showToast(
                          msg: "Record Deleted", // message
                          toastLength: Toast.LENGTH_SHORT, // length
                          gravity: ToastGravity.CENTER, // location
                          timeInSecForIosWeb: 1 // duration
                      );

                    } else {
                      Fluttertoast.showToast(
                          msg: "Record Not Deleted", // message
                          toastLength: Toast.LENGTH_SHORT, // length
                          gravity: ToastGravity.BOTTOM, // location
                          timeInSecForIosWeb: 1 // duration
                      );
                    }
                  },
                  obj:provider. alldata[index],
                );
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
