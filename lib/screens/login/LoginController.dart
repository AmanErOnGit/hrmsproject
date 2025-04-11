import 'dart:convert';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/constant/ConstantString.dart';
import 'package:hrmsapp/screens/dashboard/dashboard_screen.dart';
import 'package:hrmsapp/screens/employee_dashboard/Employee_Dashboard_Screen.dart';
import 'package:hrmsapp/screens/login/LoginScreen.dart';
import 'package:hrmsapp/screens/plan/ChoosePlanScreen.dart';
import 'package:hrmsapp/screens/shop_entry/ShopEntryScreen.dart';
import 'package:hrmsapp/screens/shop_list/ShopListScreen.dart';
import 'package:hrmsapp/support/PreferenceManager.dart';
import 'package:hrmsapp/support/alert_dialog_manager.dart';
import 'package:path/path.dart';

import '../../constant/APIConstant.dart';

class LoginController extends GetxController {


  BuildContext context;

  LoginController(this.context);

  TextEditingController emailTextCon = TextEditingController();
  TextEditingController passwordTextCon = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  bool passwordHide=true;



  getLoginDetail() {
    Map<String, dynamic> body = {
      "email": emailTextCon.text,
      "password": passwordTextCon.text
    };

    APIConstant.gethitAPI(context, ConstantString.post, ConstantString.login, body: body).then((onValue) {
      print(onValue);
      var responce = jsonDecode(onValue);
      PreferenceManager.instance.setString(ConstantString.loginKey,onValue).then((onValue){
         if(responce["status"]=="success") {
           if(responce["user_type"].toString().toLowerCase()=="admin"){
             if(responce["user"]["plan_id"]==null){
               Get.offAll(ChoosePlanScreen());
             }else {
               if (responce["user"]["shop_number"]>0) {
                 Get.offAll(DashboardScreen());
               } else {
                 Get.offAll(ShopEntryScreen());
               }
             }
           }else if(responce["user_type"].toString().toLowerCase()=="hr"){
             Get.offAll(DashboardScreen());
           }else if(responce["user_type"].toString().toLowerCase()=="employee"){
             Get.offAll(EmployeeDashboardScreen());
           }
           // AlertDialogManager().isErrorAndSuccessAlertDialogMessage(
           //     context, responce["status"],
           //     responce["message"], onTapFunction: () {
           //       /*if (isHr!) {
           //     Get.offAll(DashboardScreen(),
           //         transition: Transition.rightToLeft,
           //         duration: Duration(milliseconds: 400),
           //         curve: Curves.ease);
           //   } else {
           //     Get.offAll(EmployeeDashboardScreen(),
           //         transition: Transition.rightToLeft,
           //         duration: Duration(milliseconds: 400),
           //         curve: Curves.ease);
           //   }*/
           // });
         }
      });
    });
  }

  bool validation() {
    if (emailTextCon.text.isEmpty) {
      emailFocus.requestFocus();
      AlertDialogManager.getSnackBarMsg(
          "Message", "email can't be Empty", false, context);
      return false;
    } else if (passwordTextCon.text.isEmpty) {
      passwordFocus.requestFocus();
      AlertDialogManager.getSnackBarMsg(
          "Message", "Password can't be Empty", false, context);
      return false;
    } else {
      return true;
    }
  }
}
