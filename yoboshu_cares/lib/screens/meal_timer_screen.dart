import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoboshu_cares/provider/timer_provider.dart';
import 'package:yoboshu_cares/widgets/custom_button.dart';

import '../values/colors.dart';
import '../values/fonts.dart';
import '../values/strings.dart';
import '../widgets/custom_main_button.dart';
import '../widgets/custom_textfield.dart';

class MealTimerScreen extends StatelessWidget {
  const MealTimerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorData.primaryColour,

      ///Appbar
      appBar: AppBar(
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(2.0),
          child: Divider(color: ColorData.appBarTitleColour, height: 5.0),
        ),
        elevation: 2,
        leading: const Icon(
          Icons.arrow_back,
          color: ColorData.appWhiteColour,
        ),
        backgroundColor: ColorData.primaryColour,
        title: const CustomText(
          text: StringData.appBarTitle,
          color: ColorData.appBarTitleColour,
          fontFamily: FontData.roboto,
          fontSize: 18.0,
          fontWeight: FontWeight.w700,
          textDecoration: TextDecoration.none,
        ),
      ),

      body: Column(children: <Widget>[

        const SizedBox(height: 15.0,),
        ///Dots
        SizedBox(
          width: 60,height: 25.0,
          child: ListView.builder(shrinkWrap: true,scrollDirection: Axis.horizontal, physics: const NeverScrollableScrollPhysics(),itemCount: 3,itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Consumer<TimerProvider>(
                    builder: (context, value, child) {
                      return Container(width: value.dotNum != index ? 10.0 : 15.0,height: value.dotNum != index ?  10.0 : 15.0,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100.0),
                          color:value.dotNum != index  ? ColorData.subtitleColour : ColorData.appWhiteColour,),);
                    },
                  ),

            const SizedBox(width: 10.0,),

            ],
              );
          },),
        ),
        const SizedBox(height: 15.0,),

        ///Title
        Consumer<TimerProvider>(
          builder: (context, value, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomText(text: StringData.titles[value.dotNum + 1][0], color: ColorData.appWhiteColour, fontFamily: FontData.roboto,
                  fontSize: 22.0, fontWeight: FontWeight.w500, textDecoration: TextDecoration.none),
            );
          },
        ),


        const SizedBox(height: 5.0,),

        ///Subtitle
        Consumer<TimerProvider>(
          builder: (context, value, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomText(text: StringData.titles[value.dotNum + 1][1], color: ColorData.subtitleColour, fontFamily: FontData.roboto,
                fontSize: 16.0, fontWeight: FontWeight.w500, textDecoration: TextDecoration.none ,),
            );
          },
        ),

        const Spacer(),

        ///Timer
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: 200.0,
              height: 200.0,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(100.0),color: ColorData.timerBackgroundColour, ),
            ),
            Container(width: 150.0,height: 150.0,decoration: BoxDecoration(borderRadius: BorderRadius.circular(100.0),color: ColorData.appWhiteColour),
            child: Column(children:  <Widget>[
              SizedBox(height: 50.0,),
              Consumer<TimerProvider>(
                builder: (context, value, child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomText(text: value.timer.toString(), color: Colors.black87, fontFamily: FontData.roboto, fontSize: 28.0, fontWeight: FontWeight.w800, textDecoration: TextDecoration.none)
                    ,
                  );
                },
              )

              ,CustomText(text: 'minutes remaining', color: ColorData.subtitleColour, fontFamily: FontData.roboto, fontSize: 16.0, fontWeight: FontWeight.w500, textDecoration: TextDecoration.none)
            ],)),

          ],
        ),

        const Spacer(),

        ///Switch
        Consumer<TimerProvider>(
          builder: (context, value, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Transform.scale(
                scale: 0.8,
                child: CupertinoSwitch(
                  thumbColor: ColorData.appWhiteColour,
                  trackColor: ColorData.appWhiteColour,
                  value: value.switchValue,
                  onChanged: (_) { value.setSwitch(); },),
              ),
            );
          },
        ),


        const SizedBox(height: 2.0,),

        ///Switch Text
        const CustomText(text: 'Sound on', color: ColorData.appWhiteColour, fontFamily: FontData.roboto,
            fontSize: 14.0, fontWeight: FontWeight.w500, textDecoration: TextDecoration.none),
        const Spacer(),

        ///Button1
        Consumer<TimerProvider>(
          builder: (context, value, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: InkWell(onTap: (){

                if(value.buttonData){
                  value.setDotNum();
                  value.setButtonData();
                  value.setTimer();
                }else{
                  value.setButtonState();
                }


              },child: CustomMainButton(title: value.buttonData ? 'start' : value.buttonState ? 'pause' : 'resume',),),
            );
          },
        ),

        const SizedBox(height: 10.0,),

        ///Button2
        Consumer<TimerProvider>(
          builder: (context, value, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: InkWell(onTap: (){
                value.setButtonData();
                value.resetDotNum();
              },child:         Visibility(visible: value.dotNum >= 0 ? true : false, child: CustomButton(title: 'let\'s stop I am full',)),
                  ),
            );
          },
        ),


        const Spacer(),

      ]),
    );
  }
}
