


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/model/EmplyeeDDModel.dart';
import 'package:intl/intl.dart';

import '../../constant/APIConstant.dart';
import '../../constant/ConstantString.dart';
import '../../model/LoginModel.dart';
import '../../support/PreferenceManager.dart';
import '../../support/alert_dialog_manager.dart';

class TaskAssignmentController extends GetxController{





  TextEditingController departmentTextCon=TextEditingController();
  TextEditingController tittleTextCon=TextEditingController();
  TextEditingController taskdescTextCon=TextEditingController();
  TextEditingController endDateTextCon=TextEditingController();
  List<String>    periorityList=['Low', 'Medium', 'High'];
  BuildContext context;
  TaskAssignmentController(this.context);
  LoginModel loginModel=LoginModel();


  EmployeeDDModel emp_model=EmployeeDDModel();

  EmployeeDetail employee=EmployeeDetail();
  String priority="";
  FocusNode priorityFocus=FocusNode();
  FocusNode tittleFocus=FocusNode();
  FocusNode taskdescFocus=FocusNode();
  FocusNode endDateFocus=FocusNode();


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserData();
    priority=periorityList[0];
    endDateTextCon.text=Intl().date("yyyy-MM-dd ").format(DateTime.now());
  }


  getUserData(){
    PreferenceManager.instance.getUserDetails().then((onValue){
      loginModel=onValue;
      getEmpList();
      update();
    });
  }


  getEmpList(){
    String url="";
    if(loginModel.userType!.toLowerCase()=="admin"){
      url=ConstantString.fetch_employees+"?user_id=${loginModel.user!.userId}";
    }else{
      url=ConstantString.fetch_employees+"?shop_id=${loginModel.employee!.shopId}";
    }
    APIConstant.gethitAPI(context, ConstantString.get, url).then((onValue){
      print(onValue);
      var responce=jsonDecode(onValue);
      if(responce["status"]=="success") {
        emp_model=EmployeeDDModel.fromJson(responce);
        if(emp_model.data!=null && emp_model.data!=[]) {
          if(emp_model.data![0].designation=="admin") {
            employee = emp_model.data![0];
            departmentTextCon.text = employee.designation ?? "";
          }else {
            if (emp_model.data![0].designation == "hr") {
              employee = emp_model.data![1];
              departmentTextCon.text = employee.designation ?? "";
            } else {
              employee = emp_model.data![0];
              departmentTextCon.text = employee.designation ?? "";
            }
          }
        }
        update();
      }
    });
  }



  bool validation(){
    if(emp_model.data==null || emp_model.data==[]){
      AlertDialogManager.getSnackBarMsg("Message", "Please create employee first", false, context);
      return false;
    } else if(tittleTextCon.text.isEmpty){
      tittleFocus.requestFocus();
      AlertDialogManager.getSnackBarMsg("Message", "Task tittle can't be Empty", false, context);
      return false;
    }else if(taskdescTextCon.text.isEmpty){
      tittleFocus.requestFocus();
      AlertDialogManager.getSnackBarMsg("Message", "Task Description can't be Empty", false, context);
      return false;
    }else if(endDateTextCon.text.isEmpty){
      tittleFocus.requestFocus();
      AlertDialogManager.getSnackBarMsg("Message", "Task Deadline can't be Empty", false, context);
      return false;
    }else{
      return true;
    }
  }




  createEmployeeTask(){
    Map<String,dynamic>  body={
      "employee_id": employee.id.toString(),
      "department": departmentTextCon.text,
      "task_title": tittleTextCon.text,
      "task_description": taskdescTextCon.text,
      "deadline": endDateTextCon.text,
      "priority": priority.toLowerCase()
    };
    APIConstant.gethitAPI(context, ConstantString.post, ConstantString.create_task,body: body).then((onValue)async{
      print(onValue);
      var responce=jsonDecode(onValue);
      if(responce["status"]=="success") {
        await AlertDialogManager().isErrorAndSuccessAlertDialogMessage(context, "Success", responce["message"],onTapFunction: (){
          Get.back();
          Get.back();
        });
        priority=periorityList[0];
        taskdescTextCon.clear();
        tittleTextCon.clear();
        endDateTextCon.clear();
        update();
      }
    });
  }









}