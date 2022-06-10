import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/SingleProductListItem.dart';
import '../../providers/ProductProvider.dart';

class ViewSecondProduct extends StatefulWidget {

  @override
  State<ViewSecondProduct> createState() => _ViewSecondProductState();
}

class _ViewSecondProductState extends State<ViewSecondProduct> {


  ProductProvider provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      provider= Provider.of<ProductProvider>(context,listen: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    provider= Provider.of<ProductProvider>(context,listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text("ViewProduct..."),
      ),
      body: (provider.alldata != null)
          ? ListView.builder(
        itemCount: provider.alldata.length,
        itemBuilder: (context, index) {
          return SingleProductListItem(
            onclick: () {},
            obj:provider. alldata[index],
          );
        },
      )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
