import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/constant/ConstantImage.dart';
import 'package:hrmsapp/model/HrTaskModel.dart';
import 'package:hrmsapp/screens/assigntask/TaskAssignmentScreen.dart';

import 'package:hrmsapp/screens/dashboard/DashboardController.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../../support/app_theme.dart';

class TaskScreen {


  static getTaskScreen(BuildContext context, DashboardController controller) {
    Size size = MediaQuery
        .of(context)
        .size;
    return
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          getAppBar(context, controller),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
                "Here Task is Created and Assigned By Hr.For All Employee"),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20,),
            child: ElevatedButton(
              onPressed: () async{
               var result= await Get.to(TaskAssignmentScreen());
               controller.getEmployeeTask();
               controller.update();
              },
              style: ElevatedButton.styleFrom(

                backgroundColor: AppColor.primary,
                minimumSize: Size(size.width, 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [

                    Image.asset(
                        ConstantImage.taskassign, width: 15, height: 15),
                    SizedBox(width: 10,),
                    Text(
                      "Create Task For Employee",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text("Your Task",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
          ),

          SizedBox(height: 10,),
          Padding(

            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "See Task Details of all employees",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
          ),
          if(controller.hrTaskModel.tasks!=null)
          if(controller.hrTaskModel.tasks!=[])
          Expanded(
            child: ListView.builder(
              itemCount: controller.hrTaskModel.tasks!.length,
              itemBuilder: (BuildContext context, int index) {
                Tasks task=controller.hrTaskModel.tasks![index];
                return buildTaskCard(context,task);
              },
            ),
          )
        ],
      );
  }

  static getAppBar(context, controller) {
    return Container(
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(17.0),
                child: Text("Task", style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff252525)),),
              ),
            ],
          )),
        ],
      ),
    );
  }


  static Widget buildTaskCard(BuildContext context,
      Tasks task) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        color: Colors.white,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.taskTitle??"",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                task.taskDescription??"",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 8),
              Row(
                children: [
                  // CircleAvatar(
                  //   radius: 20,
                  //   backgroundImage: AssetImage(
                  //       'assets/profile.jpg'), // Replace with actual image
                  // ),
                  // SizedBox(width: 10),
                  Text(
                    "Assigned by Hr",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    "Employee Name :",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 10),
                  Text(
                    (task.employeeName??""),
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Row(
                children: [

                  Text(
                    "Task Status : ",
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "${task.status}",
                    style:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: task.status=="incomplete"?Colors.red:Colors.green),
                  ),
                  // Expanded(child: Container()),
                  // Image.asset(
                  //   ConstantImage.message,
                  //   width: 20,
                  //   height: 20,
                  //   color: Colors.black,
                  // )
                ],
              ),
              Row(
                children: [

                  Text(
                    "Priority : ",
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "${task.priority}".toUpperCase(),
                    style:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Colors.black),
                  ),
                  // Expanded(child: Container()),
                  // Image.asset(
                  //   ConstantImage.message,
                  //   width: 20,
                  //   height: 20,
                  //   color: Colors.black,
                  // )
                ],
              ),
              Divider(),
              // SlideAction(
              //   onSubmit: () {
              //     ScaffoldMessenger.of(context).showSnackBar(
              //       SnackBar(content: Text("Task Completed!")),
              //     );
              //   },
              //   innerColor: AppColor.secondary,
              //   alignment: Alignment.center,
              //   height: 55,
              //   outerColor: AppColor.slidecomplete,
              //   borderRadius: 15,
              //   sliderButtonIcon: Container(
              //     height: 15,
              //     alignment: Alignment.center,
              //     child: Icon(
              //       Icons.arrow_forward, size: 17,
              //       color: Colors.white,
              //     ),
              //   ),
              //   text: "Slide to Complete",
              //   textStyle: TextStyle(
              //     fontSize: 16,
              //     fontWeight: FontWeight.w500,
              //     color: Colors.black,
              //   ),
              // ),

            ],
          ),
        ),
      ),
    );
  }
}