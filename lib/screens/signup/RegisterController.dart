// Controller for Register Screen
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/constant/APIConstant.dart';
import 'package:hrmsapp/constant/ConstantString.dart';
import 'package:hrmsapp/screens/login/LoginScreen.dart';
import 'package:hrmsapp/screens/plan/ChoosePlanScreen.dart';
import 'package:hrmsapp/screens/shop_entry/ShopEntryScreen.dart';
import 'package:hrmsapp/support/alert_dialog_manager.dart';

import '../../support/PreferenceManager.dart';
import '../dashboard/dashboard_screen.dart';
import '../employee_dashboard/Employee_Dashboard_Screen.dart';

class RegisterController extends GetxController {

  String planID;

   bool? paymentStatus=false;
  BuildContext context;
  RegisterController(this.context,this.planID);
  var fullName = "Amelia Cruze";
  var mobileNumber = "+49".obs;

  TextEditingController nameTextFiledController = TextEditingController();
  TextEditingController numberTextFiledController = TextEditingController();
  TextEditingController emailTextFiledController = TextEditingController();
  TextEditingController passwordTextFiledController = TextEditingController();
  TextEditingController confpasswordTextFiledController = TextEditingController();

  bool seePassword = false;
  bool seePassword2 = false;

  FocusNode numberFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode confpasswordFocus = FocusNode();
  FocusNode nameFocus = FocusNode();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    passwordTextFiledController = TextEditingController();
    numberTextFiledController = TextEditingController();
    emailTextFiledController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    passwordTextFiledController.dispose();
  }




  bool validation(){
    if(nameTextFiledController.text.isEmpty){
      nameFocus.requestFocus();
      AlertDialogManager.getSnackBarMsg("Message", "Name can't be Empty", false, context);
      return false;
    } else if(numberTextFiledController.text.isEmpty){
      emailFocus.requestFocus();
      AlertDialogManager.getSnackBarMsg("Message", "Mobile No can't be Empty", false, context);
      return false;
    }
    else if(emailTextFiledController.text.isEmpty){
      emailFocus.requestFocus();
      AlertDialogManager.getSnackBarMsg("Message", "Email can't be Empty", false, context);
      return false;
    }
    else if(passwordTextFiledController.text.isEmpty){
      emailFocus.requestFocus();
      AlertDialogManager.getSnackBarMsg("Message", "Password can't be Empty", false, context);
      return false;
    }
    else if(confpasswordTextFiledController.text.isEmpty){
      emailFocus.requestFocus();
      AlertDialogManager.getSnackBarMsg("Message", "confirmed password can't be Empty", false, context);
      return false;
    }

    else{
      return true;
    }
  }


  getRegister(){
    Map<String,dynamic> body={
      "full_name": nameTextFiledController.text,
      "mobile": numberTextFiledController.text,
      "email": emailTextFiledController.text,
      "create_password": passwordTextFiledController.text,
      "confirm_password":confpasswordTextFiledController.text,
      "plan_id": null,
      "payment_status": paymentStatus==true?"success":"Pending"
    };
    
    APIConstant.gethitAPI(context, ConstantString.post, ConstantString.register,body: body).then((onValue){
      print(onValue);
      var responce=jsonDecode(onValue);
      if(responce["status"]=="success") {
        AlertDialogManager().isErrorAndSuccessAlertDialogMessage(context, "Success", responce["message"], onTapFunction: () {
              //Get.offAll(() => LoginScreen());
               getLoginDetail();
               Get.back();
              // Go to Shop  Detail Screen
        });
      }else{

        // AlertDialogManager().isErrorAndSuccessAlertDialogMessage(context, "Success", responce["message"], onTapFunction: () {
        //   Get.back();
        // });
      }
    });
    
  }





  getLoginDetail() {
    Map<String, dynamic> body = {
      "email": emailTextFiledController.text,
      "password": passwordTextFiledController.text
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
  void onLoginTap() {
    // Navigate to login screen
    Get.to(() => LoginScreen());
    print("Navigating to Login Screen");
  }



}
