


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/constant/ConstantImage.dart';
import 'package:hrmsapp/screens/employee_list/EmployeeListController.dart';

import '../../model/EmplyeeDDModel.dart';
import '../professionaldetail/ProfessionalDetailScreen.dart';

class EmployeeListScreen extends StatelessWidget {



  String shopID;
  EmployeeListScreen(this.shopID,{super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.put(EmployeeListController(context,shopID)),
        builder: (controller){
      return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: Column(
          children: [
            Container(
              height: 80,
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.vertical(bottom: Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    overlayColor:
                    const WidgetStatePropertyAll(Colors.transparent),
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Image.asset(
                        ConstantImage.backarrow,
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  const Text(
                    "Employee",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(child: SizedBox())
                ],
              ),
            ),
           if( controller.employeeDDModel.data!=null)
            Expanded(
                child: ListView.builder(
                  itemCount: controller.employeeDDModel.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    EmployeeDetail model=controller.employeeDDModel.data![index];
                    return employeeCard(
                        imageUrl: model.profileImage??"",
                        name: model.employeeName??"",
                        employeeId: model.employeeId??"",
                        profile: model.designation??"",
                        salary: model.salary??'',
                        shiftTiming: model.shiftTiming??"",
                         controller: controller,
                         id: model.id??-1
                        );
                  },
                ),)
          ],
        ),
      );
    });
  }


  static Widget employeeCard({
    required String imageUrl,
    required String name,
    required String employeeId,
    required String profile,
    required String salary,
    required String shiftTiming,
    required EmployeeListController controller,
    required int id,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      // margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 5,
        //     spreadRadius: 2,
        //   ),
        // ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(imageUrl),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Employe Id – $employeeId",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    Text(
                      "Profile – $profile",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    Text(
                      "Salary– € $salary",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    Text(
                      "Shift Timing – $shiftTiming",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
              ),
              Container(height: 20,width: 20,child: Image.asset("assets/location.png",)),
            ],
          ),
          SizedBox(height: 10),
          Divider(),
          InkWell(
            onTap: (){
              controller.getDeleteEmpList(id.toString());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(height: 20,width: 20,child: Icon(CupertinoIcons.delete,color: Colors.red,size: 20,)),
                SizedBox(width: 10),
                Text(
                  "Delete Employee",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500,color: Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
