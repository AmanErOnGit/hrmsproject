


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

import '../../constant/APIConstant.dart';
import '../../constant/ConstantString.dart';
import '../../model/LoginModel.dart';
import '../../support/PreferenceManager.dart';

class ShopListController extends GetxController{

  BuildContext context;

  ShopListController(this.context);

  LoginModel loginModel=LoginModel();


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserData();
  }

  void getUserData() {
    PreferenceManager.instance.getUserDetails().then((onValue) {
      loginModel = onValue;
      update();
    });
  }
}