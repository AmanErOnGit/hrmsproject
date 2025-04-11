import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hrmsapp/constant/APIConstant.dart';
import 'package:hrmsapp/model/LoginModel.dart';
import 'package:hrmsapp/support/EasyLoadingConfig.dart';

import '../../constant/ConstantString.dart';
import '../../support/PreferenceManager.dart';
import '../../support/alert_dialog_manager.dart';
import '../../support/camera.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  BuildContext context;

  LoginModel loginModel = LoginModel();

  UserController(this.context);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactNoController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();
  final TextEditingController shiftTimingController = TextEditingController();
  final TextEditingController shiftTypeController = TextEditingController();
  final TextEditingController empTypeController = TextEditingController();
  final TextEditingController shopNameController = TextEditingController();
  final TextEditingController passwordTextCon = TextEditingController();

  Shops shops = Shops();
  FocusNode nameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode contactNoFocus = FocusNode();
  FocusNode desigFocus = FocusNode();
  FocusNode salaryFocus = FocusNode();
  FocusNode shiftTimeFocus = FocusNode();
  FocusNode shiftTypeFocus = FocusNode();
  FocusNode empTypeFocus = FocusNode();
  FocusNode shopNameFocus = FocusNode();
  FocusNode uploadImageFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  bool passwordHide=true;





  List<String> hrList=["00","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24"];
  List<String> minList=[
    "00","01","02","03","04","05","06","07","08","09",
    "10","11","12","13","14","15","16","17","18","19",
    "20","21","22","23","24","25","26","27","28","29",
    "30","31","32","33","34","35","36","37","38","39",
    "40","41","42","43","44","45","46","47","48","49",
    "50","51","52","53","54","55","56","57","58","59"
  ];
  String inHr="";
  FocusNode inHrFocus=FocusNode();
  String inMin="";
  FocusNode inMinFocus=FocusNode();
  String OutHr="";
  FocusNode OutHrFocus=FocusNode();
  String OutMin="";
  FocusNode OutMinFocus=FocusNode();


  String base64Profile = "";
  String path="";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    inHr=hrList[0];
    inMin=minList[0];
    OutHr=hrList[0];
    OutMin=minList[0];
    update();
    getUserData();
  }

  getUserData() {
    PreferenceManager.instance.getUserDetails().then((onValue) {
      loginModel = onValue;
      if (loginModel.shops != null && loginModel.shops != []) {
        shops = loginModel.shops![0];
      }
      update();
    });
  }

  createEmployee() async{
    Map<String, String> body = {
      "shop_id": loginModel.userType!.toLowerCase()=="admin"?shops.shopId.toString():(loginModel.employee!.shopId??"").toString(),
      "employee_name":nameController.text,
      "salary": salaryController.text,
      "email":emailController.text,
      "phone_number":contactNoController.text,
      "shift_timing": inHr+":"+inMin+"-"+OutHr+":"+OutMin,
      "shift_type": shiftTypeController.text,
      "employment_type": empTypeController.text,
      "designation": designationController.text,
      "password": passwordTextCon.text,
    };
    try {
      EasyLoadingConfig.show();
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://hrms.volvrit.in/create_employee.php'));
      request.fields.addAll(body);
      print(path);
      request.files.add(await http.MultipartFile.fromPath(
          'profile_image', path,));

      http.StreamedResponse response = await request.send();
      var responsesdata = await http.Response.fromStream(response);
      String responceJson = responsesdata.body;
      var responsebody = jsonDecode(responceJson);
      EasyLoadingConfig.dismiss();
      if (response.statusCode == 200) {
        if (responsebody["status"] == "success") {
          resetFeilds();
          AlertDialogManager().isErrorAndSuccessAlertDialogMessage(
              context, 'Success', responsebody["message"],onTapFunction: (){
                Get.back();
                Get.back();
          });
        } else {
          AlertDialogManager().sendMessageAlert(
              context, 'Error', responsebody["message"]);
        }
      }else if(response.statusCode >= 400 && response.statusCode <500){
        AlertDialogManager().sendMessageAlert(
            context, 'Error', responsebody["message"]);
      }
      else {
        print(">>>>>>>>>>>>>>>>${response.statusCode}");
        AlertDialogManager().sendMessageAlert(
            context, 'Error', "Something went wrong");
      }
    }catch(e){
      print(e);
      EasyLoadingConfig.dismiss();
      AlertDialogManager().sendMessageAlert(
          context, 'Error', "Something went wrong");
    }
  }
  bool validation(){
    if(nameController.text.isEmpty){
      nameFocus.requestFocus();
      AlertDialogManager.getSnackBarMsg("Message", "Name can't be Empty", false, context);
      return false;
    } if(emailController.text.isEmpty){
      emailFocus.requestFocus();
      AlertDialogManager.getSnackBarMsg("Message", "Email can't be Empty", false, context);
      return false;
    } if(contactNoController.text.isEmpty){
      contactNoFocus.requestFocus();
      AlertDialogManager.getSnackBarMsg("Message", "Contact Number can't be Empty", false, context);
      return false;
    } else if(designationController.text.isEmpty){
      desigFocus.requestFocus();
      AlertDialogManager.getSnackBarMsg("Message", "Designation No can't be Empty", false, context);
      return false;
    }
    else if(salaryController.text.isEmpty){
      salaryFocus.requestFocus();
      AlertDialogManager.getSnackBarMsg("Message", "Salary can't be Empty", false, context);
      return false;
    }
    else if(shiftTypeController.text.isEmpty){
      shiftTypeFocus.requestFocus();
      AlertDialogManager.getSnackBarMsg("Message", "shift Type can't be Empty", false, context);
      return false;
    }
    else if(empTypeController.text.isEmpty){
      empTypeFocus.requestFocus();
      AlertDialogManager.getSnackBarMsg("Message", "employee can't be Empty", false, context);
      return false;
    }
    // else if(shopNameController.text.isEmpty){
    //   shopNameFocus.requestFocus();
    //   AlertDialogManager.getSnackBarMsg("Message", "shop Name can't be Empty", false, context);
    //   return false;
    // }
    else if(passwordTextCon.text.isEmpty){
      passwordFocus.requestFocus();
      AlertDialogManager.getSnackBarMsg("Message", "Password can't be Empty", false, context);
      return false;
    }
    else if(base64Profile.isEmpty){
      AlertDialogManager.getSnackBarMsg("Message", "image can't be Empty", false, context);
      return false;
    } else{
      return true;
    }
  }


  Future<void> navigateAndDisplaySelection(
      BuildContext context, int option) async {
    var result;
    Get.back();
    switch (option) {
      case 1:
        List<CameraDescription>? cameras;
        await availableCameras().then((value) {
          cameras = value;
        });
        result =
            await Get.to(ImagePickerConst(cameras: cameras, type: "camera"));

        break;
      case 2:
        List<CameraDescription>? cameras;
        await availableCameras().then((value) {
          cameras = value;
        });
        result = await Get.to(ImagePickerConst(
          cameras: cameras,
          type: "gallery",
        ));

        break;
    }

    if (result != null) {
      base64Profile = result["image64"];
      // imageByte =result["imageByte"];
      path=result["imagePath"];
      update();
    }
  }



  resetFeilds(){
     nameController.clear();
     emailController.clear();
     contactNoController.clear();
     designationController.clear();
     salaryController.clear();
     shiftTimingController.clear();
     shiftTypeController.clear();
     empTypeController.clear();
     shopNameController.clear();
     passwordTextCon.clear();
     base64Profile="";
     path="";
     inHr=hrList[0];
     inMin=minList[0];
     OutHr=hrList[0];
     OutMin=minList[0];
     update();
  }
}
