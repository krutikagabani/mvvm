import 'package:flutter/material.dart';
import 'package:mvvm/components/SingleEmployeeListItem.dart';
import 'package:provider/provider.dart';

import '../../providers/EmployeeProvider.dart';

class ViewSecondEmployee extends StatefulWidget {

  @override
  State<ViewSecondEmployee> createState() => _ViewSecondEmployeeState();
}

class _ViewSecondEmployeeState extends State<ViewSecondEmployee> {
  EmployeeProvider provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      provider= Provider.of<EmployeeProvider>(context,listen: false);

    });
  }

  @override
  Widget build(BuildContext context) {
    provider= Provider.of<EmployeeProvider>(context,listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text("ViewProduct..."),
      ),
      body: (provider.alldata != null)
          ? ListView.builder(
        itemCount: provider.alldata.length,
        itemBuilder: (context, index) {
          return SingleEmployeeListItem(
            onclick: () {},
            obj:provider. alldata[index],
          );
        },
      )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
