import 'package:flutter/material.dart';
import 'package:mvvm/components/SingleDataListItem.dart';
import 'package:mvvm/providers/PracticeProvider.dart';
import 'package:provider/provider.dart';

class ViewData extends StatefulWidget {

  @override
  State<ViewData> createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {

  PracticeProvider provider;
  getdata() async {
    await provider.getAllData(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      provider= Provider.of<PracticeProvider>(context,listen: false);
      getdata();
    });
  }

  @override
  Widget build(BuildContext context) {
    provider= Provider.of<PracticeProvider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("View Data"),
      ),
      body: (provider.alldata != null)
          ? ListView.builder(
        itemCount: provider.alldata.length,
        itemBuilder: (context, index) {
          return SingleDataListItem(
            onclick: (){
              setState(() {
                provider.alldata.removeAt(index);
              });
            },
            obj:provider.alldata[index],
          );
        },
      )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
