import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hrmsapp/screens/plan/ChoosePlanModel.dart';
import 'package:path/path.dart';

import '../../constant/APIConstant.dart';
import '../../constant/ConstantString.dart';
import '../../support/alert_dialog_manager.dart';
import '../selectedplan/SelectedPlanScreen.dart';

class ChoosePlanController extends GetxController {

  int selectedIndex = -1; // Initially, no selection
  BuildContext context;
  ChoosePlanController(this.context);


int? planId;
String? planName;
int? shopNumber;
int? employee_limit;


  ChoosePlanModel choosePlanModel=ChoosePlanModel();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPlanRequest();
  }
  void selectItem(int index) {
    selectedIndex = index;
    update(); // Notify GetBuilder to update UI
  }
  getPlanRequest(){
    Map<String,dynamic> body={
      "id": planId,
      "plan_name": planName,
      "shop_number": shopNumber,
      "employee_limit": employee_limit


    };

    APIConstant.gethitAPI(context, ConstantString.post, ConstantString.getPlan,body: body).then((onValue){
      print(onValue);
      var responce=jsonDecode(onValue);

      choosePlanModel = ChoosePlanModel.fromJson(responce);
      update();

print("myplanaman{$choosePlanModel}");

    //  AlertDialogManager().isErrorAndSuccessAlertDialogMessage(context, "Success",responce["message"],onTapFunction: (){




     // }

     // );
    });

  }









}