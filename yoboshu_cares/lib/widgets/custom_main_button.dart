

import 'package:flutter/material.dart';

import '../values/colors.dart';
import '../values/fonts.dart';
import 'custom_textfield.dart';

class CustomMainButton extends StatelessWidget {
  @required
  final String title;

  CustomMainButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.5),
      decoration: BoxDecoration( color: ColorData.mainButtonColour,borderRadius: BorderRadius.circular(10.0), border: Border.all(color: ColorData.subButtonBorderColour,width: 1.0)),
      child: Center(child: CustomText(textDecoration: TextDecoration.none,text: title.toUpperCase(), color: ColorData.primaryColour, fontFamily: FontData.roboto, fontSize: 16.0, fontWeight: FontWeight.w700,)),
    );
  }
}
