

import 'package:flutter/material.dart';

import '../values/colors.dart';
import '../values/fonts.dart';
import 'custom_textfield.dart';

class CustomButton extends StatelessWidget {
  @required
  final String title;

   CustomButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.5),
      decoration: BoxDecoration( borderRadius: BorderRadius.circular(10.0), border: Border.all(color: ColorData.subButtonBorderColour,width: 1.0)),
      child: Center(child: CustomText(textDecoration: TextDecoration.none,text: title.toUpperCase(), color: ColorData.appWhiteColour, fontFamily: FontData.roboto, fontSize: 18.0, fontWeight: FontWeight.w500,)),
    );
  }
}
