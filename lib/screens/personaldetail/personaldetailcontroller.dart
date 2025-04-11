import 'package:get/get.dart';

import '../../model/LoginModel.dart';
import '../../support/PreferenceManager.dart';

class PersonalDetailController extends GetxController{



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