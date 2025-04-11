







import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/model/EmplyeeDDModel.dart';
import 'package:hrmsapp/screens/dashboard/DashboardController.dart';
import 'package:hrmsapp/screens/professionaldetail/ProfessionalDetailScreen.dart';


class UserScreen{


  static getUserScreen(BuildContext context,DashboardController controller){
    return Column(
      children: [
        getAppBar(context, controller),
        if(controller.employeeList!=[])
        Expanded(
          child: ListView.builder(
            itemCount: controller.employeeList.length,
            itemBuilder: (BuildContext context, int index) {
              EmployeeDetail model=controller.employeeList[index];
              return employeeCard(
                  imageUrl: model.profileImage??"",
                  name: model.employeeName??"",
                  employeeId: model.employeeId??"",
                  profile: model.designation??"",
                  salary: model.salary??'',
                  shiftTiming: model.shiftTiming??"",
                  emp: model);
            }, 
          ),
        )

      ],
    );
  }


  static getAppBar(context,DashboardController controller){
    return Container(
      decoration:  BoxDecoration(
          color: Colors.white,
          // boxShadow: [
          //   BoxShadow(color: Colors.grey.shade400,spreadRadius: 2,blurRadius: 5,offset: Offset(5,5))
          // ]
      ),
      child: Row(
        children: [
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(17.0),
                child: Text("Users",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Color(0xff252525)),),
              ),
            ],
          )),
        ],
      ),
    );
  }




  static Widget employeeCard({
    required String imageUrl,
    required String name,
    required String employeeId,
    required String profile,
    required String salary,
    required String shiftTiming,
    required EmployeeDetail emp,
  }) {
    return CupertinoButton(

      onPressed: () {

        Get.to(()=>ProfessionalDetailScreen(emp));

      },
      child: Container(
        padding: EdgeInsets.all(16),
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
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Container(height: 20,width: 20,child: Image.asset("assets/userIcon.png",)),
            //     SizedBox(width: 10),
            //     Text(
            //       "Task – $task",
            //       style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}