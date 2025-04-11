import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/constant/ConstantImage.dart';
import 'package:hrmsapp/constant/CustomWidget.dart';
import 'package:hrmsapp/screens/createuser/UserController.dart';

import '../../support/app_theme.dart';

class CreateUserScreen extends StatelessWidget {
  CreateUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.put(UserController(context)),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Get.back(),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.notifications_outlined, color: Colors.black),
                  onPressed: () {},
                ),
              ],
            ),
            body: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create New User",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Add user details like - Name, Employee Id, Profile, Salary & Shift Time",
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                    SizedBox(height: 10),

                    // Input Fields
                    _buildTextField("Name", controller.nameController),
                    /*_buildTextField(
                        "Employee Id", controller.employeeIdController),*/
                    _buildTextField("Email", controller.emailController),

                    Text("Contact Number", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                    SizedBox(height: 5),
                    CustomWidget.textInputFiled(controller.contactNoController,
                      focusNode: controller.contactNoFocus,
                      textAlign: TextAlign.left,
                      topPadding: 8,
                      leftPadding: 0,
                      rightPadding: 0,
                      bottomPadding: 0,
                      textInputType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10)
                      ],
                      hintText: "Enter Contact Number",
                      fillColorFiled: true,
                      enableBorder: false,
                      fillColors: Colors.grey.shade200,
                    ),
                    _buildTextField(
                        "Designation", controller.designationController),
                    SizedBox(height: 5),
                    Text("Salary", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                    CustomWidget.textInputFiled(controller.salaryController,
                      textAlign: TextAlign.left,
                      topPadding: 8,
                      leftPadding: 0,
                      rightPadding: 0,
                      bottomPadding: 0,
                      textInputType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10)
                      ],
                      hintText: "Enter Salary",
                      fillColorFiled: true,
                      enableBorder: false,
                      fillColors: Colors.grey.shade100,
                      prefixIconWidget: Container(child: Text("  € ",style: TextStyle(fontSize: 28,color: Colors.grey.shade400),))
                    ),
                    SizedBox(height: 10,),
                    Text("Shift Timing",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),

                    Row(
                      children: [
                        Expanded(
                          child: CustomWidget.stringTypeDropDown(
                              controller.inHr, controller.hrList, (value) {
                            controller.inHr = value.toString();
                            controller.update();
                          }, controller.inHrFocus,
                              label: "In Hrs",
                              colorDropDown: Colors.grey.shade100,
                              hideBorder: true),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CustomWidget.stringTypeDropDown(
                              controller.inMin, controller.minList, (value) {
                            controller.inMin = value.toString();
                            controller.update();
                          }, controller.inMinFocus,
                              label: "In Min",
                              colorDropDown: Colors.grey.shade100,
                              hideBorder: true),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CustomWidget.stringTypeDropDown(
                              controller.OutHr, controller.hrList, (value) {
                            controller.OutHr = value.toString();
                            controller.update();
                          }, controller.OutHrFocus,
                              label: "Out Hrs",
                              colorDropDown: Colors.grey.shade100,
                              hideBorder: true),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CustomWidget.stringTypeDropDown(
                              controller.OutMin, controller.minList, (value) {
                            controller.OutMin = value.toString();
                            controller.update();
                          }, controller.OutMinFocus,
                              label: "Out Min",
                              colorDropDown: Colors.grey.shade100,
                              hideBorder: true),
                        ),
                      ],
                    ),

                    _buildTextField(
                        "Shift Type", controller.shiftTypeController),

                    _buildTextField(
                        "Employment Type", controller.empTypeController),

                    Text("Employee Password",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                    // SizedBox(height: 5),
                    // _buildTextField2(
                    //   controller: controller.passwordTextCon,
                    //   focusNode: controller.passwordFocus,
                    //   hintText: "**********",
                    //   icon: Icons.lock_outline,
                    //   obscureText: true,
                    // ),
                    CustomWidget.textInputFiled(controller.passwordTextCon,
                        focusNode: controller.passwordFocus,
                        textAlign: TextAlign.left,
                        topPadding: 8,
                        leftPadding: 0,
                        rightPadding: 0,
                        bottomPadding: 0,
                        textInputType: TextInputType.text,
                        hintText: "**********",
                        fillColorFiled: true,
                        enableBorder: false,
                        fillColors: Colors.grey.shade100,
                        maxLine: 1,
                        passwordHide: controller.passwordHide,
                        prefixIconWidget: Icon(Icons.lock,color: AppColor.secondary,),
                        suffixIconWidget: InkWell(
                          onTap: (){
                            controller.passwordHide=!controller.passwordHide;
                            controller.update();
                          },
                          child: Icon(controller.passwordHide?Icons.visibility_off:Icons.visibility))
                    ),
                    // _buildTextFieldShopName(
                    //     "Shop Name", controller.shopNameController,
                    //       ConstantImage.dropdown),
                    SizedBox(
                      height: 10,
                    ),
                    if(controller.loginModel.userType!=null)
                      if(controller.loginModel.userType!.toLowerCase()=="admin")
                    Text("Shop Name", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                    SizedBox(height: 5),
                    if(controller.loginModel.userType!=null)
                      if(controller.loginModel.userType!.toLowerCase()=="admin")
                    CustomWidget.modelDropDown(
                      controller.shops,
                      controller.loginModel.shops ?? [],
                      (value) {
                        controller.shops = value;
                        controller.update();
                      },
                      label: "",
                      colorDropDown: Colors.grey.shade100,
                    ),

                    SizedBox(height: 5),

                    Text('Upload Employee Image',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),

                    SizedBox(height: 5),
                    InkWell(
                      onTap: () {
                        CustomWidget().getBottomSheetForProfile(context, () {
                          controller.navigateAndDisplaySelection(context, 1);
                        }, () {
                          controller.navigateAndDisplaySelection(context, 2);
                        });

                        controller.base64Profile;
                      },
                      child: Stack(
                        children: [
                          controller.base64Profile==""?
                          Image.asset(ConstantImage.rectangleupload):
                              Container(
                                  height: 200,
                                  width: Get.width-40,
                                  color: Colors.grey.shade100,
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  alignment: Alignment.center,
                                  child: Image.memory(base64Decode(controller.base64Profile))),
                          Positioned(
                            top: 70,
                            left: 80,
                            child: Center(
                              child:controller.base64Profile==""? Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Image.asset(ConstantImage.cameraicon,
                                    width: 35, height: 35,),
                                  SizedBox(width: 10),
                                  Text("Browse Image")
                                ],
                              ):SizedBox(),
                            ),
                          )
                        ],
                      ),
                    ),

                    SizedBox(height: 30),

                    // Buttons
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              Get.back();
                            },
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 14),
                              side: BorderSide(color: Colors.grey),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10), // Reduce circular effect
                              ),
                            ),
                            child: Text("Cancel",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black)),
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              //Get.to(ProfessionalDetailScreen());
                               if(controller.validation()) {
                                 controller.createEmployee();
                               }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 14),
                              backgroundColor: Color(0xFF93A500),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10), // Reduce circular effect
                              ),
                            ),
                            child: Text("Create",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          );
        });
  }

  // Common TextField Widget
  Widget _buildTextField(String label, TextEditingController controller,
      {String prefix = ""}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12),
        Text(label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        SizedBox(height: 5),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[100],
            hintText: label,
            prefixText: prefix,
            hintStyle: TextStyle(color: Colors.grey[500]),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
            contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 15),
          ),
        ),
      ],
    );
  }



  Widget _buildTextField2({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    FocusNode? focusNode,
    required bool obscureText,
    Color iconColor = AppColor.primary
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        focusNode: focusNode,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color:iconColor),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black45),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }

  Widget _buildTextFieldShopName(
      String label, TextEditingController controller, String asset,
      {String prefix = ""}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12),
        Text(label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        SizedBox(height: 5),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[100],
            hintText: label,
            prefixText: prefix,
            suffixIcon: Padding(
              padding: EdgeInsets.all(15.0),
              child: Image.asset(asset, width: 10, height: 10),
            ),
            hintStyle: TextStyle(color: Colors.grey[500]),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
            contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 15),
          ),
        ),
      ],
    );
  }
}
