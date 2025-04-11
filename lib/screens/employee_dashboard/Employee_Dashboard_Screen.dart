
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/screens/employee_dashboard/EmpHomeScreen.dart';
import 'package:hrmsapp/screens/employee_dashboard/EmpProfileScreen.dart';
import 'package:hrmsapp/screens/employee_dashboard/EmployeeDashboardController.dart';
import '../../constant/CustomWidget.dart';
import '../../support/app_theme.dart';
import 'EmpTaskScreen.dart';



class EmployeeDashboardScreen extends StatelessWidget {
  const EmployeeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width=CustomWidget.getWidth(context);
    double height=CustomWidget.getHeight(context);
    return GetBuilder(
        init: Get.put(EmployeeDashboardController(context)),
        builder: (controller){
          return SafeArea(
            child: Scaffold(
              backgroundColor:Colors.grey.shade200,
              body: Column(
                children: [
                  if(controller.selectedIndex==0)
                    Expanded(child: EmpHomeScreen.getEmpHomeScreen(context, controller)),
                  if(controller.selectedIndex==1)
                    Expanded(child: EmpTaskScreen.getEmpTaskScreen(context, controller)),
                  if(controller.selectedIndex==2)
                    Expanded(child: EmpProfileScreen.getEmpProfileScreen(context, controller)),
                  // if(controller.selectedIndex==3)
                  //   Expanded(child: ProfileScreen.getProfileScreen(context, controller)),
                  getCustomBottomNavigation(context, controller)
                ],
              ),
            ),
          );
        });
  }

  getCustomBottomNavigation(context,controller){
    return  Container(
      height: 65,
      decoration: BoxDecoration(
          color: AppColor.white,
          boxShadow: [
            BoxShadow(color: Colors.grey.shade200,spreadRadius: 4,blurRadius: 4)
          ]
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              hoverColor: Colors.white,
              highlightColor: Colors.transparent,
              onTap:(){
                controller.selectedIndex=0;
                controller.update();
              },
              child: Container(
                width: Get.width/4,
                child: Column(
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                  children: [
                    if(controller.selectedIndex==0)
                      Image.asset("assets/active_home.png",height: 22,width: 22,),
                    if(controller.selectedIndex!=0)
                      Image.asset("assets/home.png",height: 22,width: 22,),
                    Text("Home",style: TextStyle(color: controller.selectedIndex==0?AppColor.secondary:Color(0xff7D7D7D)),)
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              hoverColor: Colors.white,
              highlightColor: Colors.transparent,

              borderRadius: BorderRadius.horizontal(left: Radius.circular(40)),
              onTap:(){
                controller.selectedIndex=1;
                controller.update();
              },
              child:  Container(
                width: Get.width/4,
                child: Column(
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                  children: [
                    if(controller.selectedIndex==1)
                      Image.asset("assets/active_task.png",height: 22,width: 22,),
                    if(controller.selectedIndex!=1)
                      Image.asset("assets/task.png",height: 22,width: 22,),
                    Text("Task",style: TextStyle(color: controller.selectedIndex==1?AppColor.secondary:Color(0xff7D7D7D)),)
                  ],
                ),
              ),
            ),
          ),
          // Expanded(
          //   child: InkWell(
          //     hoverColor: Colors.white,
          //     highlightColor: Colors.transparent,
          //
          //     borderRadius: BorderRadius.horizontal(right: Radius.circular(40)),
          //     onTap:(){
          //       controller.selectedIndex=2;
          //       controller.update();
          //     },
          //     child:  Container(
          //       width: Get.width/4,
          //       child: Column(
          //         mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          //         children: [
          //           // Image.asset("assets/dashboard/activity.png",height: 22,width: 22,),
          //           if(controller.selectedIndex==2)
          //             Image.asset("assets/active_user.png",height: 22,width: 22,),
          //           if(controller.selectedIndex!=2)
          //             Image.asset("assets/user.png",height: 22,width: 22,),
          //           Text("Users",style: TextStyle(color: controller.selectedIndex==2?AppColor.secondary:Color(0xff7D7D7D)),)
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          Expanded(
            child: InkWell(
              hoverColor: Colors.white,
              highlightColor: Colors.transparent,

              borderRadius: BorderRadius.horizontal(right: Radius.circular(40)),
              onTap:(){
                controller.selectedIndex=2;
                controller.update();
              },
              child:  Container(
                width: Get.width/4,
                child: Column(
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                  children: [
                    if(controller.selectedIndex==3)
                      Image.asset("assets/active_profile.png",height: 22,width: 22,),
                    if(controller.selectedIndex!=3)
                      Image.asset("assets/profile.png",height: 22,width: 22,),
                    Text("Profile",style: TextStyle(color: controller.selectedIndex==3?AppColor.secondary:Color(0xff7D7D7D)),)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
