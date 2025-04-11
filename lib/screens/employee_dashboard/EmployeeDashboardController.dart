


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/model/HrTaskModel.dart';
import 'package:hrmsapp/model/LoginModel.dart';
import 'package:intl/intl.dart';

import '../../constant/APIConstant.dart';
import '../../constant/ConstantString.dart';
import '../../support/PreferenceManager.dart';

class EmployeeDashboardController extends GetxController{

  BuildContext context;

  EmployeeDashboardController(this.context);

  int selectedIndex = 0;

  int selectedWork = 0;

  int firstpendingIndex = -1;

  String base64Profile = "";
  Uint8List? imageByte;

  ScrollController scrollHomeController=ScrollController();

  bool currentBooking=true;

  TextEditingController  searchTextCon=TextEditingController();
  FocusNode searchFocus=FocusNode();


  var selectedDateIndex = 0; // Track the selected date index
  List<Map<String, String>> dateList = [];



  LoginModel loginModel=LoginModel();


  HrTaskModel hrTaskModel=HrTaskModel();


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();


    generateCurrentMonthDates();
    getUserData();
  }

  void getUserData() {
    PreferenceManager.instance.getUserDetails().then((onValue) {
      loginModel = onValue;
      getEmployeeTask();
    });
  }



  Future<dynamic> getServices() async{
    //   await APIConstant.gethitAPI(
    //       context, ConstantString.get, ConstantString.appservice, body: {
    //     // "phone":numberTextCon.text
    //   },).then((onValue) {
    //     if (onValue != null) {
    //       var responce=jsonDecode(onValue);
    //       servicemodel=Servicemodel.fromJson(responce);
    //       update();
    //     }
    //   });
  }




  void generateCurrentMonthDates() {
    DateTime now = DateTime.now();
    int totalDays = DateTime(now.year, now.month + 1, 0).day; // Get total days in month

    dateList.clear();
    for (int i = now.day; i > 0; i--) {
      DateTime date = DateTime(now.year, now.month, i);
      dateList.add({
        "day": DateFormat('EEE').format(date), // Short Day Name (e.g., Mon)
        "date": DateFormat('d').format(date), // Date (e.g., 12)
      });

    }
    selectedDateIndex=dateList.length-1;
    update(); // Notify UI
  }



  Future<dynamic> getEmployeeTask() async{
    String url=ConstantString.fetch_task+"?employee_id=${loginModel.employee!.id}";

    await APIConstant.gethitAPI(context, ConstantString.get,url).then((onValue) {
      if (onValue != null) {
        var responce=jsonDecode(onValue);
        hrTaskModel=HrTaskModel.fromJson(responce);
        update();
      }
    });
  }



  Future<dynamic> getCompleteTask(int taskId) async{
    String url=ConstantString.update_task_status;
    Map<String,dynamic> body={
      "task_id": taskId,
      "status": "complete"
    };
    await APIConstant.gethitAPI(context, ConstantString.post,url,body: body).then((onValue) {
      if (onValue != null) {
        getEmployeeTask();
        update();
      }
    });
  }

  void selectDate(int index) {
    selectedDateIndex = index;
    update();
  }
}