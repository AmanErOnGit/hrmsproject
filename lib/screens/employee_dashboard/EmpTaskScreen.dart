import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrmsapp/constant/ConstantImage.dart';
import 'package:hrmsapp/screens/employee_dashboard/EmployeeDashboardController.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../../model/HrTaskModel.dart';
import '../../support/app_theme.dart';

class EmpTaskScreen {
  static getEmpTaskScreen(
      BuildContext context, EmployeeDashboardController controller) {
    return Column(
      children: [
        getAppBar(context, controller),
        if(controller.hrTaskModel.tasks!=null && controller.hrTaskModel.tasks!=[])
        Expanded(
          child: ListView.builder(
            itemCount: controller.hrTaskModel.tasks!.length,
            itemBuilder: (BuildContext context, int index) {
              Tasks model=controller.hrTaskModel.tasks![index];
              return buildTaskCard(context, controller,model);
            },
          ),
        )
      ],
    );
  }

  static getAppBar(context, controller) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey.shade400,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(5, 5))
      ]),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(17.0),
                child: Text(
                  "Task",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff252525)),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }

  static Widget buildTaskCard(BuildContext context, EmployeeDashboardController controller,Tasks task) {
    return Container(
      child:

      Padding(
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
                    fontFamily: "Sans",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  task.taskDescription??"",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Sans",
                    fontWeight: FontWeight.w400,
                    color: AppColor.textColor,
                  ),
                ),
                SizedBox(height: 16),
                Divider(),
                SizedBox(height: 8),
                Row(
                  children: [

                    Text(
                      "Task Status : ",
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
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
                // Row(
                //   children: [
                //     CircleAvatar(
                //       radius: 20,
                //       backgroundImage: AssetImage(
                //           'assets/profile.jpg'), // Replace with actual image
                //     ),
                //     SizedBox(width: 10),
                //     Text(
                //       "Assigned by ",
                //       style:
                //           TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                //     ),
                //     Expanded(child: Container()),
                //     Image.asset(
                //       ConstantImage.message,
                //       width: 20,
                //       height: 20,
                //       color: Colors.black,
                //     )
                //   ],
                // ),
                SizedBox(height: 16),
                if(task.status=="incomplete")
                SlideAction(
                  onSubmit: () {
                    controller.getCompleteTask(task.id??-1);
                  },
                  innerColor: AppColor.secondary,
                  outerColor: AppColor.slidecomplete,
                  borderRadius: 15,
                  sliderButtonIcon: Container(
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                  text: "Slide to Complete",
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
