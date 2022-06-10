import 'package:flutter/cupertino.dart';
import 'package:mvvm/resources/StyleResources.dart';

class MyPrimaryButton extends StatelessWidget {
  var buttontext = "";

  GestureTapCallback onclick;

  MyPrimaryButton({this.buttontext, this.onclick});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: onclick,
        child: Text(
          buttontext,
          textAlign: TextAlign.center,
          style: StyleResources.buttonText,
        ),
      ),
      decoration: BoxDecoration(
        color: StyleResources.primaryButtonColor,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    );
  }
}
