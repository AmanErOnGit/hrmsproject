



import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/constant/CustomWidget.dart';
import 'package:hrmsapp/screens/dashboard/dashboard_screen.dart';
import 'package:hrmsapp/screens/login/LoginScreen.dart';
import 'package:hrmsapp/screens/shop_entry/ShopEntryController.dart';

import '../../support/app_theme.dart';

class ShopEntryScreen extends StatelessWidget {

  bool? backEnable=false;
   ShopEntryScreen({this.backEnable=false,super.key});

  @override
  Widget build(BuildContext context) {
    double height=CustomWidget.getHeight(context);
    double width=CustomWidget.getWidth(context);
    return GetBuilder(
        init: Get.put(ShopEntryController(context)),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.grey.shade200,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  getAppBar(context, controller,backEnable!),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      SizedBox(width: 25,),
                      Text("Fill the form to create a shop ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize:22),),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 25,),
                      GestureDetector(
                        onTap: (){
                          Get.to(()=>LoginScreen());
                        },
                        child: const Text(
                          "Create the Shop by Entering basic details \nand continue",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 25,),
                      Text("Shop Name",style: TextStyle(color: AppColor.textColor2,fontWeight: FontWeight.w500,fontSize: 14),),
                    ],
                  ),
                  CustomWidget.textInputFiled(controller.shopNameTextCon,
                    focusNode: controller.shopNameNode,
                    textAlign: TextAlign.left,
                    topPadding: 8,
                    leftPadding: 20,
                    rightPadding: 20,
                    bottomPadding: 10,
                    textInputType: TextInputType.text,
                    hintText: "Enter Name",
                    fillColorFiled: true,
                    enableBorder: false,
                    fillColors: Colors.white,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 25,),
                      Text("Shop Contact Number",style: TextStyle(color: AppColor.textColor2,fontWeight: FontWeight.w500,fontSize: 14),),
                    ],
                  ),
                  CustomWidget.textInputFiled(controller.shopConNumTextCon,
                    focusNode: controller.shopConNumNode,
                    textAlign: TextAlign.left,
                    topPadding: 8,
                    leftPadding: 20,
                    rightPadding: 20,
                    bottomPadding: 10,
                    textInputType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10)
                    ],
                    hintText: "Enter Contact Number",
                    fillColorFiled: true,
                    enableBorder: false,
                    fillColors: Colors.white,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 25,),
                      Text("Shop Address",style: TextStyle(color: AppColor.textColor2,fontWeight: FontWeight.w500,fontSize: 14),),
                    ],
                  ),
                  CustomWidget.textInputFiled(controller.shopAddressTextCon,
                    focusNode: controller.shopAddressNode,
                    textAlign: TextAlign.left,
                    topPadding: 8,
                    leftPadding: 20,
                    rightPadding: 20,
                    bottomPadding: 10,
                    textInputType: TextInputType.text,
                    hintText: "Enter Address",
                    fillColorFiled: true,
                    enableBorder: false,
                    fillColors: Colors.white,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 25,),
                      Text("Email",style: TextStyle(color: AppColor.textColor2,fontWeight: FontWeight.w500,fontSize: 14),),
                    ],
                  ),
                  CustomWidget.textInputFiled(controller.shopEmailTextCon,
                    focusNode: controller.shopEmailNode,
                    textAlign: TextAlign.left,
                    topPadding: 8,
                    leftPadding: 20,
                    rightPadding: 20,
                    bottomPadding: 10,
                    textInputType: TextInputType.text,
                    hintText: "Enter Email",
                    fillColorFiled: true,
                    enableBorder: false,
                    fillColors: Colors.white,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 25,),
                      Text("Shop Description",style: TextStyle(color: AppColor.textColor2,fontWeight: FontWeight.w500,fontSize: 14),),
                    ],
                  ),
                  CustomWidget.textInputFiled(controller.shopDescTextCon,
                    focusNode: controller.shopDescNode,
                    textAlign: TextAlign.left,
                    topPadding: 8,
                    leftPadding: 20,
                    rightPadding: 20,
                    bottomPadding: 10,
                    textInputType: TextInputType.text,
                    hintText: "Enter Shop Description",
                    fillColorFiled: true,
                    enableBorder: false,
                    minLine: 3,
                    fillColors: Colors.white,
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: CustomWidget.elevatedCustomButton(context, "Create Shop", (){
                       //Get.to(()=>DashboardScreen());
                      controller.createShop();
                    },width: width-40),
                  ),

                ],
              ),
            ),
          );
        });
  }


  static getAppBar(context, controller,bool backenabled) {
    return Container(
      width: CustomWidget.getWidth(context),
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey.shade400,
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(5, 5))
          ]
      ),
      child: Row(
        children: [
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if(backenabled)
              InkWell(
                onTap: (){
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black,width: 1)
                  ),
                  child: Icon(Icons.arrow_back,size: 30,),
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}
