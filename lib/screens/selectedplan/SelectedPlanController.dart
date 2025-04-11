import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/constant/APIConstant.dart';
import 'package:hrmsapp/model/LoginModel.dart';
import 'package:hrmsapp/screens/shop_entry/ShopEntryScreen.dart';

import '../../constant/ConstantString.dart';
import '../../support/PreferenceManager.dart';
import '../../support/alert_dialog_manager.dart';

class SelectedPlanController extends GetxController{
  BuildContext context;
  SelectedPlanController(this.context);

  LoginModel loginModel=LoginModel();



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getUserData();
  }



  void getUserData() {
    PreferenceManager.instance.getUserDetails().then((onValue) {
      loginModel = onValue;
      update();
    });
  }



  getPlan(int planid){
    Map<String,dynamic> body={
      "user_id":loginModel.user!.userId ,
      "plan_id":planid
    };
    APIConstant.gethitAPI(context, ConstantString.post, ConstantString.select_plan,body: body).then((onValue){
      print(onValue);
      var responce=jsonDecode(onValue);
      if(responce["status"]=="success") {
        AlertDialogManager().isErrorAndSuccessAlertDialogMessage(context, "Success", responce["message"], onTapFunction: () {
          Get.offAll(() => ShopEntryScreen());
        });
      }
    });

  }




}