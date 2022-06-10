import 'package:flutter/material.dart';
import 'package:mvvm/components/SingleAnimalListItem.dart';
import 'package:mvvm/providers/AnimalProvider.dart';
import 'package:provider/provider.dart';

class ViewSecondAnimal extends StatefulWidget {

  @override
  State<ViewSecondAnimal> createState() => _ViewSecondAnimalState();
}

class _ViewSecondAnimalState extends State<ViewSecondAnimal> {

  AnimalProvider provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      provider= Provider.of<AnimalProvider>(context,listen: false);

    });
  }

  @override
  Widget build(BuildContext context) {
    provider= Provider.of<AnimalProvider>(context,listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text("ViewProduct..."),
      ),
      body: (provider.alldata != null)
          ? ListView.builder(
        itemCount: provider.alldata.length,
        itemBuilder: (context, index) {
          return SingleAnimalListItem(
            onclick: () {},
            obj:provider.alldata[index],
          );
        },
      )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
