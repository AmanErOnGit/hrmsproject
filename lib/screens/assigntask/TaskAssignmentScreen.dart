import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/constant/ConstantImage.dart';
import 'package:hrmsapp/constant/CustomWidget.dart';
import 'package:hrmsapp/model/EmplyeeDDModel.dart';
import 'package:hrmsapp/screens/assigntask/TaskAssignmentController.dart';
import 'package:hrmsapp/support/app_theme.dart';

import '../../model/LoginModel.dart';

class TaskAssignmentScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    double width=CustomWidget.getWidth(context);
    double height=CustomWidget.getHeight(context);
    return GetBuilder(
      init: Get.put(TaskAssignmentController(context)),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.grey.shade100,
          body: Column(
            children: [
              getAppBar(context,controller),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                       if( controller.emp_model.data!=null)
                       modelDropDown(controller.employee,controller.loginModel.userType!.toLowerCase()=="admin" ?controller.emp_model.data!:controller.emp_model.data!.skipWhile((test)=>test.designation=="hr").toList()??[], (value){
                         controller.employee=value;
                         controller.departmentTextCon.text=controller.employee.designation??"";
                         controller.update();
                       },colorDropDown: Colors.white,),
                        SizedBox(height: 10),
                        CustomWidget.textInputFiled(
                          controller.departmentTextCon, topPadding: 0,
                          readOnlyFiled: true,
                          textAlign: TextAlign.left,
                          fillColorFiled: true,
                          fillColors: Colors.white,
                          label: Text("Department",style: TextStyle(color: Colors.black),)
                        ),
                        SizedBox(height: 16),
                        CustomWidget.textInputFiled(
                          controller.tittleTextCon,
                          topPadding: 0,
                          textAlign: TextAlign.left,
                          fillColorFiled: true,
                          fillColors: Colors.white,
                          label: Text("Task Tittle",style: TextStyle(color: Colors.black)),
                        ),
                        SizedBox(height: 16),
                        CustomWidget.textInputFiled(
                          controller.taskdescTextCon,
                          focusNode: controller.taskdescFocus,
                          topPadding: 0,
                          textAlign: TextAlign.left,
                          fillColorFiled: true,
                          fillColors: Colors.white,
                          minLine: 3,
                          label: Text("Task Description",style: TextStyle(color: Colors.black)),
                        ),
                        SizedBox(height: 16),
                        CustomWidget.textInputFiled(
                          controller.endDateTextCon,
                          focusNode: controller.endDateFocus,
                          topPadding: 0,
                          textAlign: TextAlign.left,
                          fillColorFiled: true,
                          fillColors: Colors.white,
                          minLine: 1,
                          label: Text("Task DeadLine",style: TextStyle(color: Colors.black)),
                          onTapFunction:()async{
                            controller.endDateTextCon.text=await CustomWidget.pickDate(context, backDate: "");
                            controller.update();
                          }
                        ),
                        SizedBox(height: 10),
                        CustomWidget.stringTypeDropDown(controller.priority, controller.periorityList, (valued){
                          controller.priority=valued!;
                          controller.update();
                        }, controller.priorityFocus,label: "Priorities"),
                        SizedBox(height: 32),
                        CustomWidget.elevatedCustomButton(context, "Assign Task", () {
                           if(controller.validation()){
                             controller.createEmployeeTask();
                           }
                        }, width:width-40)
                      ],
                    ),
                  ),
                ),
              )

            ],
          ),
        );
      },

    );
  }


  static getAppBar(context,controller){
    return Container(
      padding: EdgeInsets.only(top: 30,bottom: 10),
      decoration:  BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey.shade400,spreadRadius: 2,blurRadius: 5,offset: Offset(5,5))
          ]
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(width: 15,),
          InkWell(
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
            onTap: () {
              Get.back();
            },
            child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black12)),
                child: Image.asset(
                  ConstantImage.backarrow,
                  width: 20,
                  height: 20,
                )),
          ),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Create Assign",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Color(0xff252525)),),
            ],
          )),
        ],
      ),
    );
  }


  static Widget modelDropDown(EmployeeDetail value, List<EmployeeDetail> itemList, void Function(dynamic?)? onChange,
      {Function()? onTap, Color? colorDropDown,double? marginTop,String label="",bool isMandatory=false,EdgeInsets? margin}) {
    return Stack(
      children: [
        Container(
          height: 48,
          margin: margin??EdgeInsets.symmetric(vertical: 8.0),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
          decoration: BoxDecoration(
            color: colorDropDown,
            border: Border.all(
              color: Colors.grey.shade400,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<EmployeeDetail>(
              value: value,
              onTap: onTap,
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: itemList.map<DropdownMenuItem<EmployeeDetail>>((EmployeeDetail items) {
                return DropdownMenuItem<EmployeeDetail>(
                  value: items,
                  child: Text((items.employeeId??"")+":"+(items.employeeName??"")),
                );
              }).toList(),
              onChanged: onChange,
            ),
          ),
        ),
        if(label!="")
          Positioned(
              left: 20,
              top: 0,
              child: Container(
                  color:Colors.white,
                  alignment: Alignment.topCenter,
                  child: Row(
                    children: [
                      Text(" $label ",style: TextStyle(fontSize: 12),),
                      isMandatory
                          ?Text("*",style: TextStyle(fontSize: 12,color: Colors.red),)
                          :Text(""),
                    ],
                  )
              )
          ),
      ],
    );
  }
}
