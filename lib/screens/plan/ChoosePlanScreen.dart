import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/constant/ConstantImage.dart';
import 'package:hrmsapp/screens/plan/ChoosePlanController.dart';
import 'package:hrmsapp/screens/selectedplan/SelectedPlanScreen.dart';
import 'package:hrmsapp/support/alert_dialog_manager.dart';
import 'package:hrmsapp/support/app_theme.dart';

import '../../constant/CustomWidget.dart';

class ChoosePlanScreen extends StatelessWidget {
  ChoosePlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = CustomWidget.getWidth(context);
    double height = CustomWidget.getHeight(context);
    // final ChoosePlanController controller = Get.put(ChoosePlanController());
    var selectedPlan;
    return GetBuilder(
        init: Get.put(ChoosePlanController(context)),
        builder: (controller) {
          return SafeArea(
              child: Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Padding(
                //   padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       // InkWell(
                //       //   overlayColor: WidgetStatePropertyAll(Colors.transparent),
                //       //   onTap: () {
                //       //     Get.back();
                //       //   },
                //       //   child: Container(
                //       //       padding: EdgeInsets.all(8),
                //       //       decoration: BoxDecoration(
                //       //           borderRadius: BorderRadius.circular(20),
                //       //           border: Border.all(color: Colors.black12)),
                //       //       child: Image.asset(
                //       //         ConstantImage.backarrow,
                //       //         width: 20,
                //       //         height: 20,
                //       //       )),
                //       // ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    "Choose Your \nSubscription Plan",
                    style: TextStyle(
                        fontFamily: "Sans",
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                ),
                SizedBox(height: 10),
                if (controller.choosePlanModel.plans != null)
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.choosePlanModel.plans!.length,
                        itemBuilder: (BuildContext context, int index) {
                          bool isSelected = controller.selectedIndex == index;
                          var choosePlan =
                              controller.choosePlanModel.plans?[index];
                          return GestureDetector(
                            onTap: () {
                              controller.selectItem(index);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      width: 1.0,
                                      //   color: AppColor.boxBorder.withOpacity(0.2)

                                      color: isSelected
                                          ? AppColor.primary
                                          : AppColor.boxBorder.withOpacity(
                                              0.2), // Change border color
                                    )),
                                margin: EdgeInsets.fromLTRB(20, 5, 20, 10),
                                width: width,
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "${choosePlan!.planName.toString()}",
                                            style: TextStyle(
                                                fontFamily: "Sans",
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Expanded(child: Container()),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: AppColor.primary
                                                    .withOpacity(0.22),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        15)),
                                            child: Text("Most Bought",
                                                style: TextStyle(
                                                    fontFamily: "Sans",
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(5, 5, 5, 0),
                                      child: Text("€ 3,500",
                                          style: TextStyle(
                                              fontFamily: "Sans",
                                              fontSize: 22,
                                              color: AppColor.primary,
                                              fontWeight: FontWeight.w700)),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(5, 5, 5, 0),
                                      child: Row(
                                        children: [
                                          Image.asset(ConstantImage.check,
                                              width: 15, height: 15),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                              "You create a ${choosePlan.shopNumber} shop",
                                              style: TextStyle(
                                                  color: AppColor
                                                      .textColorforPlan,
                                                  fontFamily: "Sans",
                                                  fontSize: 15,
                                                  fontWeight:
                                                      FontWeight.w400)),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(5, 0, 5, 0),
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
                                              "Add on maximum ${choosePlan.employeeLimit} employee",
                                              style: TextStyle(
                                                  fontFamily: "Sans",
                                                  fontSize: 15,
                                                  color: AppColor
                                                      .textColorforPlan,
                                                  fontWeight:
                                                      FontWeight.w400)),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(5, 0, 5, 0),

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
                                                  color: AppColor
                                                      .textColorforPlan,
                                                  fontWeight:
                                                      FontWeight.w400)),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(5, 0, 5, 0),
                                      child: Row(
                                        children: [
                                          Image.asset(ConstantImage.cross,
                                              width: 15, height: 15),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                              "Create unlimited shop for company",
                                              style: TextStyle(
                                                  fontFamily: "Sans",
                                                  fontSize: 15,
                                                  color: AppColor
                                                      .textColorforPlan,
                                                  fontWeight:
                                                      FontWeight.w400)),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(5, 0, 5, 10),
                                      child: Row(
                                        children: [
                                          Image.asset(ConstantImage.cross,
                                              width: 15, height: 15),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                              "Create unlimited shop for company",
                                              style: TextStyle(
                                                  fontFamily: "Sans",
                                                  fontSize: 15,
                                                  color: AppColor
                                                      .textColorforPlan,
                                                  fontWeight:
                                                      FontWeight.w400)),
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          );
                        }),
                  ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: SizedBox(
                      width: width,
                      height: 40,
                      child: CustomWidget.elevatedCustomButton(
                          bgColor: AppColor.primary, context, "Subscribe", () {
                            if (controller.selectedIndex != -1) {
                              selectedPlan = controller.choosePlanModel.plans![controller.selectedIndex];
                              Get.to(() => SelectedPlanScreen(selectedPlan),
                                transition: Transition.rightToLeft,
                                duration: Duration(milliseconds: 400),
                                curve: Curves.ease,
                              );
                            }else{
                              AlertDialogManager.getSnackBarMsg("Message", "Please Choose a Plan and Continue ", false, context);
                            }
                          }
                          )
                  ),
                ),
                SizedBox(height: 20,)
              ],
            ),
          ));
        });
  }
}
