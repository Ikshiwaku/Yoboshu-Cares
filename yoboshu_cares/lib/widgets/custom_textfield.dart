import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  @required
  final String text;
  final Color color;
  final String fontFamily;
  final FontWeight fontWeight;
  final double fontSize;
  final TextDecoration? textDecoration;
   const CustomText({Key? key, required this.text,
   required this.color,
     required this.fontFamily,
     required this.fontSize,
     required this.fontWeight,
     required this.textDecoration
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,textAlign: TextAlign.center,style: TextStyle(color: color,decoration: textDecoration, fontFamily: fontFamily, fontSize: fontSize,fontWeight: fontWeight ),);
  }
}
