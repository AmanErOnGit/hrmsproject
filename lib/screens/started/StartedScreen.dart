import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/constant/CustomWidget.dart';
import 'package:hrmsapp/screens/login/LoginScreen.dart';
import 'package:hrmsapp/screens/plan/ChoosePlanScreen.dart';
import 'package:hrmsapp/support/app_theme.dart';

import '../../constant/ConstantImage.dart';

class StartedScreen extends StatelessWidget {
  const StartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = CustomWidget.getWidth(context);
    double height = CustomWidget.getHeight(context);

    return SafeArea(
        child: Scaffold(
      body: Column(
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
                      child: Image.asset(
                        ConstantImage.backarrow,
                        width: 25,
                        height: 25,
                      )),
                ),
                Expanded(child: Container()),
                InkWell(
                  onTap: (){
                    Get.offAll(LoginScreen(),
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
          Hero(tag: "intro", child: Image.asset(ConstantImage.started)),
          Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Text(
                "Let's Get Started!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              )),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Text(
              "We're excited to have you on board! This quick setup will help you personalize your "
              "app and access the resources you need. Let's dive in!",
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
                    bgColor: AppColor.primary, context, "Get Started", () {
                  Get.to(() => LoginScreen(),
                      transition: Transition.rightToLeft,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.ease);
                })),
          )
        ],
      ),
    ));
  }
}
