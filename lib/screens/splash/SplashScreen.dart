import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/constant/ConstantImage.dart';
import 'package:hrmsapp/screens/dashboard/dashboard_screen.dart';
import 'package:hrmsapp/screens/intro/IntroScreen.dart';
import 'package:hrmsapp/screens/shop_entry/ShopEntryScreen.dart';

import '../../support/PreferenceManager.dart';
import '../disciplinary/DisciplineScreen.dart';
import '../employee_dashboard/Employee_Dashboard_Screen.dart';
import '../plan/ChoosePlanScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2),(){

      PreferenceManager.instance.getUserDetails().then((onValue){


        if(onValue.user!=null){
          Map<String,dynamic> responce=onValue.toJson();
          if(responce["user_type"].toString().toLowerCase()=="admin"){
            if(responce["user"]["plan_id"]==null){
              Get.offAll(ChoosePlanScreen());
            }else {
              if (responce["user"]["shop_number"]==0) {
                Get.offAll(ShopEntryScreen());
              } else {
                Get.offAll(DashboardScreen());
              }
            }
          }
        }else if(onValue.employee!=null){
          Map<String,dynamic> responce=onValue.toJson();
          if(responce["user_type"].toString().toLowerCase()=="hr"){
            Get.offAll(DashboardScreen());
          }else if(responce["user_type"].toString().toLowerCase()=="employee") {
            Get.offAll(EmployeeDashboardScreen());
          }
        }else{
          Get.off(DisciplineScreen(isHr: true,),
              transition: Transition.rightToLeft,
              duration: Duration(milliseconds: 400),
              curve: Curves.ease);
        }
      });

    }
    );



  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        
          children: [
        
        SizedBox(width: 118,
            height: 138,
            child:
        Image.asset(ConstantImage.splashlogo))
        
        
        ],),
      ),


    ));
  }
}
