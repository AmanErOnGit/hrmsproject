import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hrmsapp/constant/ConstantImage.dart';
import 'package:hrmsapp/constant/CustomWidget.dart';
import 'package:hrmsapp/screens/simplyfy/SimplyfiedScreen.dart';

import '../../support/app_theme.dart';
import '../login/LoginScreen.dart';

class DisciplineScreen extends StatefulWidget {
  bool? isHr = true;

  DisciplineScreen({this.isHr, super.key});

  @override
  State<DisciplineScreen> createState() => _DisciplineScreenState();
}

class _DisciplineScreenState extends State<DisciplineScreen> {
  @override
  Widget build(BuildContext context) {
    double width = CustomWidget.getWidth(context);
    double height = CustomWidget.getHeight(context);

    return SafeArea(
        child: Scaffold(
            body: widget.isHr!
                ? getWidget(
                    context,
                    width,
                    ConstantImage.discipimg,
                    "Disciplinary In Your Hand",
                    "Welcome aboard! Let's get you set up quickly. This app will streamline your HR tasks, from accessing pay stubs to requesting time off.",
                    true)
                : getWidget(
                    context,
                    width,
                    ConstantImage.explore,
                    "Explore Key Features",
                    "Quickly access your pay information, request time off, view important documents, and stay connected with company news. We'll show you how to navigate these essential tools",
                    false)));
  }

  static getWidget(
      context, width, String asset, String heading, String text, bool isHr) {
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
                // InkWell(
                //   overlayColor: WidgetStatePropertyAll(Colors.transparent),
                //   onTap: () {
                //     Get.back();
                //   },
                //   child: Container(
                //       padding: EdgeInsets.all(8),
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(20),
                //           border: Border.all(color: Colors.black12)),
                //       child: Image.asset(
                //         ConstantImage.backarrow,
                //         width: 20,
                //         height: 20,
                //       )),
                // ),
                Expanded(child: Container()),
                InkWell(
                    onTap: () {
                        Get.offAll(LoginScreen());
                    },
                    child: Text(
                      "Skip",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Hero(tag: "intro", child: Image.asset(asset)),
          Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Text(
                heading,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              )),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
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
                    bgColor: AppColor.primary, context, "Next", () {
                  // if (isHr) {
                    Get.to(SimplyfiedScreen(taskHr: true),
                        transition: Transition.rightToLeft,
                        duration: Duration(milliseconds: 400),
                        curve: Curves.ease);
                  // } else {
                  //   Get.to(SimplyfiedScreen(taskHr: false),
                  //       transition: Transition.rightToLeft,
                  //       duration: Duration(milliseconds: 400),
                  //       curve: Curves.ease);
                  // }
                })),
          )
        ],
      ),
    );
  }
}
