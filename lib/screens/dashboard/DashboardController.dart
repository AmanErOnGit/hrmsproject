



import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:camera/camera.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/model/HrTaskModel.dart';
import 'package:hrmsapp/model/LoginModel.dart';
import 'package:hrmsapp/support/PunchService.dart';
import 'package:intl/intl.dart';

import '../../constant/APIConstant.dart';
import '../../constant/ConstantString.dart';
import '../../model/EmplyeeDDModel.dart';
import '../../support/EasyLoadingConfig.dart';
import '../../support/PreferenceManager.dart';
import '../../support/alert_dialog_manager.dart';
import 'package:http/http.dart' as http;
import '../../support/app_theme.dart';
import '../../support/camera.dart';


class DashboardController extends GetxController {

  BuildContext context;

  DashboardController(this.context);



  int selectedIndex = 0;

  int selectedWork = 0;

  int firstpendingIndex = -1;

  String base64Profile = "";
  Uint8List? imageByte;


  ScrollController scrollHomeController=ScrollController();


  List<Map<String, dynamic>> serviceList = [
    {
      "Name": "Fertilizers",
      "image": "assets/dashboard/fertilizer.png",
    },
    {
      "Name": "Pesticides",
      "image": "assets/dashboard/pesticide.png",
    },
    {
      "Name": "Seeding",
      "image": "assets/dashboard/seeding.png",
    },
  ];

  List<Map<String, dynamic>> otherServiceList = [
    {
      "Name": "Tractors",
      "image": "assets/dashboard/tractors.png",
    },
    {
      "Name": "Drones",
      "image": "assets/dashboard/drone.png",
    },
    {
      "Name": "Irrigation Trucks",
      "image": "assets/dashboard/delivery.png",
    },
    {
      "Name": "Harvesters",
      "image": "assets/dashboard/harvester 1.png",
    },
  ];


  bool currentBooking=true;


  List<Map<String, dynamic>> profileTabOption = [
    {
      "Name": "My Profile",
      "image": "assets/profile/profile.png",
    },
    {
      "Name": "Term & Condition",
      "image": "assets/profile/cancel.png",
    },
    {
      "Name": "Privacy Policy",
      "image": "assets/profile/privacy.png",
    },
    // {
    //   "Name": "Delete Account",
    //   "image": "assets/profile/delete.png",
    // },
    // {
    //   "Name": "FAQ",
    //   "image": "assets/profile/faq.png",
    // },
  ];

  TextEditingController  searchTextCon=TextEditingController();
  FocusNode searchFocus=FocusNode();


  var selectedDateIndex = 0; // Track the selected date index
  List<Map<String, String>> dateList = [];


  LoginModel loginModel=LoginModel();

  HrTaskModel hrTaskModel=HrTaskModel();

  Map<String,dynamic>?  today_punchDetail;
  List<EmployeeDetail> employeeList=[];

  // late DateTime startTime;
  // Timer? timer;
  // var elapsedSeconds = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();


    generateCurrentMonthDates();
    getUserData();
  }

  void getUserData() {
    PreferenceManager.instance.getUserDetails().then((onValue) async{
      loginModel = onValue;
      getEmployeeTask();
      // today_punchDetail=await PunchService().getTodayPunch();
      // print(today_punchDetail);
      getEmpList();
      update();
    });
  }


  // void startTracking() {
  //   startTime = DateTime.now();
  //   timer = Timer.periodic(const Duration(seconds: 1), (_) {
  //     final now = DateTime.now();
  //     final duration = now.difference(today_punchDetail!["datetime"]);
  //     elapsedSeconds.value = duration.inSeconds;
  //   });
  // }


  @override
  void onClose() {
    // timer?.cancel();
    // final totalDuration = DateTime.now().difference(startTime);
    // print("Total duration: ${totalDuration.inSeconds} seconds");
    super.onClose();
  }






  getEmpList(){
    String url="";
    if(loginModel.userType!.toLowerCase()=="admin") {
      url=ConstantString.fetch_employees+"?user_id=${loginModel.user!.userId??""}";
    }else{
      url=ConstantString.fetch_employees+"?shop_id=${loginModel.employee!.shopId??""}";
    }
    APIConstant.gethitAPI(context, ConstantString.get, url).then((onValue){
      print(onValue);
      var responce=jsonDecode(onValue);
      if(responce["status"]=="success") {
        if(responce["data"]!=null && responce["data"]!=[]){
          employeeList.clear();
          responce["data"].forEach((value){
            EmployeeDetail model=EmployeeDetail.fromJson(value);
            if(loginModel.userType!.toLowerCase()=="admin") {
              if (model.userId == loginModel.user!.userId) {
                employeeList.add(model);
              }
            }if(loginModel.userType!.toLowerCase()=="hr"){
              if (model.shopId == loginModel.employee!.shopId) {
                employeeList.add(model);
              }
            }
            update();
          });
        }
        update();
      }
    });
  }



  Future<dynamic> getEmployeeTask() async{
    String url="";
    if(loginModel.userType!.toLowerCase()=="admin"){
      url=ConstantString.fetch_task+"?user_id=${loginModel.user!.userId}";
    }else{
      url=ConstantString.fetch_task+"?shop_id=${loginModel.employee!.shopId}";
    }
    await APIConstant.gethitAPI(context, ConstantString.get,url).then((onValue) {
      if (onValue != null) {
        var responce=jsonDecode(onValue);
        hrTaskModel=HrTaskModel.fromJson(responce);
        update();
      }
    });
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

  void selectDate(int index) {
    selectedDateIndex = index;
    update();
  }
}




