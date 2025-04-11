







import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/screens/dashboard/DashboardController.dart';
import 'package:hrmsapp/screens/monthly_attendence/MonthlyAttenScreen.dart';
import 'package:hrmsapp/screens/personaldetail/personaldetailhr.dart';
import 'package:hrmsapp/screens/shop_entry/ShopEntryScreen.dart';
import 'package:hrmsapp/screens/shop_list/ShopListScreen.dart';
import 'package:hrmsapp/support/alert_dialog_manager.dart';

import '../intro/IntroScreen.dart';

class ProfileScreen{


  static getProfileScreen(BuildContext context,DashboardController controller){
    return Column(
      spacing: 10,
      children: [
        getAppBar(context, controller),

        getProfileItem(context,"assets/profile_detail.png","Personal Details",(){Get.to(()=>PersonalDetailHRScreen());}),

        if(controller.loginModel.userType!=null)
        if(controller.loginModel.userType!.toLowerCase()=="admin")
        getProfileItem(context,"assets/shop.png","Create a Shop",(){
          Get.to(()=>ShopEntryScreen(backEnable: true,));
        }),
        if(controller.loginModel.userType!=null)
          if(controller.loginModel.userType!.toLowerCase()=="admin")
        getProfileItem(context,"assets/salary_slip.png","Shop List",(){
          Get.to(ShopListScreen());
        }),
        getProfileItem(context,"assets/attendence.png","Monthly Attendence",(){
          Get.to(MonthlyAttenScreen());
        }),
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
              if(controller.loginModel.userType!=null)
              Padding(
                padding: const EdgeInsets.all(17.0),
                child: Text("${(controller.loginModel.userType??"").toUpperCase()}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Color(0xff252525)),),
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