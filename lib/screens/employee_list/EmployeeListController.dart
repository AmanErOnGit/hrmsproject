


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/model/EmplyeeDDModel.dart';
import 'package:hrmsapp/model/LoginModel.dart';
import 'package:hrmsapp/support/alert_dialog_manager.dart';

import '../../constant/APIConstant.dart';
import '../../constant/ConstantString.dart';
import '../../support/PreferenceManager.dart';

class EmployeeListController extends GetxController{


  String shopId="";
  BuildContext context;
  EmployeeListController(this.context,this.shopId);
  LoginModel loginModel=LoginModel();

  EmployeeDDModel employeeDDModel=EmployeeDDModel();


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
      getEmpList();
    });
  }

  getEmpList(){
    APIConstant.gethitAPI(context, ConstantString.get, ConstantString.fetch_employees+"?shop_id=$shopId").then((onValue){
      print(onValue);
      var responce=jsonDecode(onValue);
      if(responce["status"]=="success") {
        employeeDDModel=EmployeeDDModel.fromJson(responce);
        update();
      }
    });
  }



  getDeleteEmpList(String id){
    Map<String,dynamic> body={
      "employee_id":id
    };
    APIConstant.gethitAPI(context, ConstantString.post, ConstantString.delete_employee,body: body).then((onValue){
      print(onValue);
      var responce=jsonDecode(onValue);
      if(responce["status"]=="success") {
       AlertDialogManager().isErrorAndSuccessAlertDialogMessage(context, "success", responce["message"],onTapFunction: (){
         Get.back();
         getEmpList();
       });
        update();
      }
    });
  }





}