import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/constant/ConstantImage.dart';
import 'package:hrmsapp/constant/CustomWidget.dart';
import 'package:hrmsapp/screens/plan/ChoosePlanModel.dart';
import 'package:hrmsapp/screens/selectedplan/SelectedPlanController.dart';
import 'package:hrmsapp/screens/shop_entry/ShopEntryScreen.dart';
import 'package:hrmsapp/support/app_theme.dart';

class SelectedPlanScreen extends StatelessWidget {
  Plans selectedPlan;

  SelectedPlanScreen(this.selectedPlan, {super.key});

  @override
  Widget build(BuildContext context) {
    double width = CustomWidget.getWidth(context);
    double height = CustomWidget.getHeight(context);

    return GetBuilder(
      init: Get.put(SelectedPlanController(context)),
      builder: (controller) {
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          width: 20,
                          height: 20,
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    "${selectedPlan.planName}",
                    style: TextStyle(
                        fontFamily: "Sans",
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                ),
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text("€ ${selectedPlan.price}",
                      style: TextStyle(
                          fontFamily: "Sans",
                          color: AppColor.primary,
                          fontWeight: FontWeight.w600,
                          fontSize: 20)),
                )
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                "There are many variations of passages of Lorem Ipsum available.",
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Sans",
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                alignment: Alignment.center,
                child: Image.asset(
                  ConstantImage.palnB,
                  width: 280,
                  height: 200,
                )),
            Container(
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "Features",
                        style: TextStyle(
                            fontFamily: "Sans",
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                      child: Row(
                        children: [
                          Image.asset(ConstantImage.check,
                              width: 15, height: 15),
                          SizedBox(
                            width: 10,
                          ),
                          Text("You create  ${selectedPlan.shopNumber} shop",
                              style: TextStyle(
                                  color: AppColor.textColorforPlan,
                                  fontFamily: "Sans",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                    SizedBox(height: 3),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Row(
                        children: [
                          Image.asset(
                            ConstantImage.check,
                            width: 15,
                            height: 15,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                              "Add on maximum ${selectedPlan.employeeLimit} users",
                              style: TextStyle(
                                  fontFamily: "Sans",
                                  fontSize: 15,
                                  color: AppColor.textColorforPlan,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                    SizedBox(height: 3),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),

                      // padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.asset(ConstantImage.check,
                              width: 15, height: 15),
                          SizedBox(
                            width: 10,
                          ),
                          Text("No brokerage company",
                              style: TextStyle(
                                  fontFamily: "Sans",
                                  fontSize: 15,
                                  color: AppColor.textColorforPlan,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Row(
                        children: [
                          Image.asset(ConstantImage.cross,
                              width: 15, height: 15),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Create unlimited shop for company",
                              style: TextStyle(
                                  fontFamily: "Sans",
                                  fontSize: 15,
                                  color: AppColor.textColorforPlan,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: Row(
                        children: [
                          Image.asset(ConstantImage.cross,
                              width: 15, height: 15),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Create unlimited shop for company",
                              style: TextStyle(
                                  fontFamily: "Sans",
                                  fontSize: 15,
                                  color: AppColor.textColorforPlan,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                    )
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                "Terms & Conditions",
                style: TextStyle(
                    fontFamily: "Sans",
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
              child: Text(
                  "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of "
                  "classical Latin literature from 45 BC, making it over 2000 years old.",
                  style: TextStyle(
                      fontFamily: "Sans",
                      fontSize: 12,
                      color: AppColor.textColor,
                      fontWeight: FontWeight.w400)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 30),
              child: SizedBox(
                  width: width,
                  height: 40,
                  child: CustomWidget.elevatedCustomButton(
                      bgColor: AppColor.primary, context, "Make Payment", () {
                    controller.getPlan(selectedPlan.id??-1);
                    // previous flow
                    // Get.to(RegisterScreen(id: selectedPlan.id.toString()),
                    //     transition: Transition.rightToLeft,
                    //     duration: Duration(milliseconds: 400),
                    //     curve: Curves.ease);
                  })),
            )
          ],
        )));
      },
    );
  }
}
