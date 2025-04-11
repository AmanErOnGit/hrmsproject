import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/constant/ConstantImage.dart';
import 'package:hrmsapp/screens/personaldetail/personaldetailcontroller.dart';

class PersonalDetailHRScreen extends StatelessWidget {
  const PersonalDetailHRScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          'Personal Details',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[100],
      body: GetBuilder(
        init: Get.put(PersonalDetailController()),
            builder: (controller) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile picture
                if(controller.loginModel.userType!.toLowerCase()!="admin")
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: NetworkImage(controller.loginModel.employee!.profileImage!),
                ),
                const SizedBox(height: 8),
                // Employee ID
                Container(
                  alignment: Alignment.center,
                  child: Text("Name",
                    //'Employee Id - ${"controller.employee.value.employeeId"}',
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                ),
                 SizedBox(height: 2),
                // Employee Name
                if(controller.loginModel.user!=null)
                Text("${controller.loginModel.user!.fullName}",
                 // "controller.employee.value.name",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 SizedBox(height: 10),
                // Details Card
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        _buildDetailRow(
                          'Department',

                            controller.loginModel.userType!.toUpperCase(),
                        ),
                        const Divider(),
                        _buildDetailRow(
                          'Position',
                           controller.loginModel.userType!.toLowerCase()=="admin"
                               ?"ADMIN":
                           controller.loginModel.userType!.toLowerCase()=="hr"
                               ?"HR":controller.loginModel.employee!=null
                               ?controller.loginModel.employee!.designation??"":""
                        ),
                        if(controller.loginModel.userType!.toLowerCase()!="admin")
                        const Divider(),
                        if(controller.loginModel.userType!.toLowerCase()!="admin")
                        _buildDetailRow(
                          'Salary',
                          controller.loginModel.employee!.salary??"",
                        ),
                        if(controller.loginModel.userType!.toLowerCase()!="admin")
                        const Divider(),
                        if(controller.loginModel.userType!.toLowerCase()!="admin")
                        _buildDetailRow(
                          'Shift',
                          controller.loginModel.employee!.shiftTiming??"",
                        ),
                        if(controller.loginModel.userType!.toLowerCase()!="admin")
                        const Divider(),
                        if(controller.loginModel.userType!.toLowerCase()!="admin")
                        _buildDetailRow(
                          'Employment Type',
                          controller.loginModel.employee!.employmentType??"",
                        ),
                        if(controller.loginModel.userType!.toLowerCase()!="admin")
                        const Divider(),
                        if(controller.loginModel.userType!.toLowerCase()!="admin")
                          _buildDetailRow(
                            'Email',
                            controller.loginModel.employee!.email??"",
                          ),
                        if(controller.loginModel.userType!.toLowerCase()!="admin")
                        const Divider(),
                        if(controller.loginModel.userType!.toLowerCase()!="admin")
                          _buildDetailRow(
                            'Paswword',
                            controller.loginModel.employee!.password??"",
                          ),
                        // if(controller.loginModel.userType!.toLowerCase()!="admin")
                        // const Divider(),
                        // if(controller.loginModel.userType!.toLowerCase()!="admin")
                        // _buildDetailRow(
                        //   'Head Quarter',
                        //   "controller.employee.value",
                        // ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                // const Spacer(),
                // Logo at the bottom
                Image.asset(
                  ConstantImage.splashlogo,width: 90,height: 90,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );

  }
}
