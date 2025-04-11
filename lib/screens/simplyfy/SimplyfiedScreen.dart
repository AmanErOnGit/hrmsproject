import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/constant/ConstantImage.dart';
import 'package:hrmsapp/constant/CustomWidget.dart';
import 'package:hrmsapp/screens/started/StartedScreen.dart';
import 'package:hrmsapp/support/app_theme.dart';

import '../login/LoginScreen.dart';

class SimplyfiedScreen extends StatelessWidget {
  bool? taskHr = true;

  SimplyfiedScreen({this.taskHr, super.key});

  @override
  Widget build(BuildContext context) {
    double width = CustomWidget.getWidth(context);
    double height = CustomWidget.getHeight(context);

    return SafeArea(
        child: Scaffold(
            body: taskHr!
                ? getWidget(
                    context,
                    width,
                    ConstantImage.hrsimpliy,
                    "Hr Simplified,on the Go ",
                    "Experience the convenience of managing your HR tasks from anywhere. We'll guide you through the initial setup, ensuring you have seamless access to your important information.",
                    true)
                : getWidget(
                    context,
                    width,
                    ConstantImage.hrsimpliy,
                    "You're All Set! or Ready to Go",
                    "You're now ready to explore all the features of your [Your Company Name] app. If you need assistance, please refer to the help section or contact HR.",
                    false)));
  }

  static getWidget(context, width, String asset, String heading, String text, bool isHr) {

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  overlayColor: WidgetStatePropertyAll(Colors.transparent),
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black12)),
                      child: Image.asset(ConstantImage.backarrow,
                          width: 20, height: 20)),
                ),
                Expanded(child: Container()),
                InkWell(
                  onTap: (){
                    Get.offAll(()=>LoginScreen(),
                        transition: Transition.rightToLeft,
                        duration: Duration(milliseconds: 400),
                        curve: Curves.ease);
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Hero(tag: "intro", child: Image.asset(ConstantImage.hrsimpliy)),
          Padding(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
              child: Text(
                heading,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              )),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 13,
                  fontFamily: "Sans",
                  fontWeight: FontWeight.w400,
                  color: AppColor.textColor),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 30),
            child: SizedBox(
                width: width,
                height: 40,
                child: CustomWidget.elevatedCustomButton(
                    bgColor: AppColor.primary,
                    context,
                    isHr ? "Next" : "Get Started", () {
                  // if(isHr==true) {
                  Get.to(StartedScreen(),
                      transition: Transition.rightToLeft,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.ease);
                  // }
                  // else{
                  //   Get.to(LoginScreen(), transition: Transition.rightToLeft,
                  //       duration: Duration(milliseconds: 400),
                  //       curve: Curves.ease);
                  //
                  // }
                })),
          )
        ],
      ),
    );
  }
}
