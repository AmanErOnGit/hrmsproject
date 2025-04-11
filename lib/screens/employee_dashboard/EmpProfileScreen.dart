import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/screens/employee_dashboard/EmployeeDashboardController.dart';
import 'package:hrmsapp/screens/personaldetail/personaldetailhr.dart';
import 'package:hrmsapp/support/alert_dialog_manager.dart';

class EmpProfileScreen{


  static getEmpProfileScreen(BuildContext context,EmployeeDashboardController controller){
    return Column(
      spacing: 10,
      children: [
        getAppBar(context, controller),
        getProfileItem(context,"assets/profile_detail.png","Personal Details",(){
          Get.to(()=>PersonalDetailHRScreen());
        }),
        getProfileItem(context,"assets/salary_slip.png","Salary Slip",(){}),
        getProfileItem(context,"assets/logout.png","Logout",(){
          AlertDialogManager().logoutDialog(context);
        }),
      ],
    );
  }


  static getAppBar(context,controller){
    return Container(
      decoration:  BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey.shade400,spreadRadius: 2,blurRadius: 5,offset: Offset(5,5))
          ]
      ),
      child: Row(
        children: [
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(17.0),
                child: Text("Users",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Color(0xff252525)),),
              ),
            ],
          )),
        ],
      ),
    );
  }


  static Widget getProfileItem(context,String asset,String text,Function() onTap){
    return InkWell(
      onTap:onTap,
      child: Container(
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration:  BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(color: Colors.grey.shade400,spreadRadius: 2,blurRadius: 5,offset: Offset(5,5))
            ]
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 10,),
            Container(height: 25,width: 25,child: Image.asset(asset),),
            SizedBox(width: 10,),
            Text(text,style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500),),
            Spacer(),
            Icon(CupertinoIcons.forward,size: 28,color: Colors.grey.shade600,),
            SizedBox(width: 10,)
          ],
        ),
      ),
    );

  }
}