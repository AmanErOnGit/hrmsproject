


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/constant/APIConstant.dart';
import 'package:hrmsapp/constant/ConstantString.dart';
import 'package:hrmsapp/model/LoginModel.dart';
import 'package:hrmsapp/screens/dashboard/dashboard_screen.dart';

import '../../support/PreferenceManager.dart';
import '../../support/alert_dialog_manager.dart';
import '../employee_dashboard/Employee_Dashboard_Screen.dart';

class ShopEntryController extends GetxController{

  bool? isHr = true;

  BuildContext context;
  ShopEntryController(this.context);

  TextEditingController shopNameTextCon=TextEditingController();
  TextEditingController shopConNumTextCon=TextEditingController();
  TextEditingController shopAddressTextCon=TextEditingController();
  TextEditingController shopEmailTextCon=TextEditingController();
  TextEditingController shopDescTextCon=TextEditingController();



  FocusNode shopNameNode=FocusNode();
  FocusNode shopConNumNode=FocusNode();
  FocusNode shopAddressNode=FocusNode();
  FocusNode shopEmailNode=FocusNode();
  FocusNode shopDescNode=FocusNode();



  LoginModel loginModel=LoginModel();
  Shops? shops;

    @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserData();

  }


  getUserData(){
      PreferenceManager.instance.getUserDetails().then((onValue){
        loginModel=onValue;
        update();
      });
  }




  validation(){

    if(shopNameTextCon.text.isEmpty){
      shopNameNode.requestFocus();
      AlertDialogManager.getSnackBarMsg("Message", "Name can't be Empty", false, context);
      return false;
    } else if(shopConNumTextCon.text.isEmpty){
      shopConNumNode.requestFocus();
      AlertDialogManager.getSnackBarMsg("Message", "Mobile No can't be Empty", false, context);
      return false;
    }else if(shopAddressTextCon.text.isEmpty){
      shopAddressNode.requestFocus();
      AlertDialogManager.getSnackBarMsg("Message", "Shop Address  can't be Empty", false, context);
      return false;
    }
    else if(shopEmailTextCon.text.isEmpty){
      shopEmailNode.requestFocus();
      AlertDialogManager.getSnackBarMsg("Message", "Email can't be Empty", false, context);
      return false;
    }
    else if(shopDescTextCon.text.isEmpty){
      shopDescNode.requestFocus();
      AlertDialogManager.getSnackBarMsg("Message", "Password can't be Empty", false, context);
      return false;
    }

    else{
      return true;
    }
  }


  createShop(){
      Map<String,String> body={
        "user_id": loginModel.user!.userId.toString(),
        "shop_name":shopNameTextCon.text,
        "shop_contact_number": shopConNumTextCon.text,
        "shop_address": shopAddressTextCon.text,
        "email": shopEmailTextCon.text,
        "description": shopDescTextCon.text
      };
      APIConstant.gethitAPI(context, ConstantString.post, ConstantString.createShop,body:body ).then(
              (onValue){
                var responce = jsonDecode(onValue);
                PreferenceManager.instance.setString(ConstantString.loginKey,onValue).then((onValue) async{
                  if (responce["status"] == "success") {
                    print(">>>>>>>>>>>>>>>>>>>>>>>>..");
                   await  updateUserLogin(responce["message"]);
                  }
                });
      });
  }




  updateUserLogin(String message){
      APIConstant.gethitAPI(context, ConstantString.post, ConstantString.fetch_user+"?user_id=${loginModel.user!.userId??""}").then((onValue){
          var responce = jsonDecode(onValue);
          PreferenceManager.instance.setString(ConstantString.loginKey,onValue).then((isTrue) {
            if (responce["status"] == "success") {
              PreferenceManager.instance.setString(ConstantString.loginKey,onValue).then((onValue){
                AlertDialogManager().isErrorAndSuccessAlertDialogMessage(context, responce["status"], message, onTapFunction: () {
                      Get.offAll(DashboardScreen(),
                          transition: Transition.rightToLeft,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.ease);
                    });
              });
            }
          });
    });
  }


}