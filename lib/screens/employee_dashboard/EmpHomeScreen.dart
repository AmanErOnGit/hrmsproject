




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/constant/ConstantImage.dart';

import 'package:hrmsapp/screens/employee_dashboard/EmployeeDashboardController.dart';
import 'package:slide_to_act/slide_to_act.dart';


import '../../model/HrTaskModel.dart';
import '../../support/app_theme.dart';

class EmpHomeScreen {

  static getEmpHomeScreen(BuildContext context,EmployeeDashboardController controller){
    return Column(
      children: [
        getAppBar(context, controller),
        SizedBox(height: 10,),

        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(controller.dateList.length, (index) {
                        bool isSelected = controller.selectedDateIndex == index;
                        return GestureDetector(
                          onTap: () {
                            controller.selectDate(index);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                            decoration: BoxDecoration(
                              color: isSelected ? AppColor.positiveButton : Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Text(
                                  controller.dateList.reversed.toList()[index]["date"]!,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: isSelected ? Colors.white : Colors.black,
                                  ),
                                ),
                                Text(
                                  controller.dateList.reversed.toList()[index]["day"]!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: isSelected ? Colors.white : Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                  ),
                  child: Column(
                    children: [
                    Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                    child: Row(
                      children: [
                        Text("Attendance",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black),),
                        ],
                       ),
                    ),
                      getPunchInCard(),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Card(
                          color: Colors.grey.shade100,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buildPunchColumn(ConstantImage.punchingreen_undeline, "09:00 AM", "Punch In"),
                                buildPunchColumn(ConstantImage.punchout_redunderline, "--", "Punch Out"),
                                buildPunchColumn(ConstantImage.blueworkinghour, "12:00", "Working Hrs"),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Text("Today Task",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black),),
                          Spacer(),
                          InkWell(
                            onTap: (){
                             controller.selectedIndex=1;
                             controller.update();
                            },
                            child: Row(
                              children: [
                                Text("See All",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: Colors.black54),),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    if(controller.hrTaskModel.tasks!=null && controller.hrTaskModel.tasks!.isNotEmpty)
                    buildTaskCard(context, controller, controller.hrTaskModel.tasks![0]),
                    SizedBox(height: 20,)
                  ],),
                )


              ],
            ),
          ),
        )

      ],
    );

  }

  static Widget buildPunchColumn(String asset, String time, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(asset,width: 25,height: 25),
        SizedBox(height: 8),
        Text(
          time,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),
      ],
    );
  }


  static getAppBar(context,EmployeeDashboardController controller){
    return Container(
      decoration:  BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey.shade400,spreadRadius: 2,blurRadius: 5,offset: Offset(5,5))
          ]
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: AppColor.secondary,
              child: Text("A",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),),
            ),
          ),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(controller.loginModel.employee!=null)
              Text("${controller.loginModel.employee!.employeeName}",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
              Text("${controller.loginModel.userType??""}".toUpperCase(),style: TextStyle(fontSize:15,fontWeight: FontWeight.w600,color: Colors.grey.shade400),),
            ],
          )),
          Stack(
            children: [
              Container(
                  height: 40,width: 40,
                  margin: EdgeInsets.only(right: 20),
                  child: Image.asset("assets/notifi.png",)),
              Positioned(
                  right: 30,
                  top: 5,
                  child: Icon(Icons.circle,size: 10,color: Colors.red,))
            ],
          )
        ],
      ),
    );
  }


  // static Widget employeeCard({
  //   required String imageUrl,
  //   required String name,
  //   required String employeeId,
  //   required String profile,
  //   required String salary,
  //   required String shiftTiming,
  //   required String task,
  // }) {
  //   return Container(
  //     padding: EdgeInsets.all(16),
  //     margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(20),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.black12,
  //           blurRadius: 5,
  //           spreadRadius: 2,
  //         ),
  //       ],
  //     ),
  //     child: Column(
  //       children: [
  //         Row(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             CircleAvatar(
  //               radius: 40,
  //               backgroundImage: NetworkImage(imageUrl),
  //             ),
  //             SizedBox(width: 16),
  //             Expanded(
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     name,
  //                     style: TextStyle(
  //                       fontSize: 18,
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //                   ),
  //                   SizedBox(height: 5),
  //                   Text(
  //                     "Employe Id – $employeeId",
  //                     style: TextStyle(color: Colors.grey, fontSize: 14),
  //                   ),
  //                   Text(
  //                     "Profile – $profile",
  //                     style: TextStyle(color: Colors.grey, fontSize: 14),
  //                   ),
  //                   Text(
  //                     "Salary– € $salary",
  //                     style: TextStyle(color: Colors.grey, fontSize: 14),
  //                   ),
  //                   Text(
  //                     "Shift Timing – $shiftTiming",
  //                     style: TextStyle(color: Colors.grey, fontSize: 14),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             Container(height: 20,width: 20,child: Image.asset("assets/location.png",)),
  //           ],
  //         ),
  //         SizedBox(height: 10),
  //         Divider(),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Container(height: 20,width: 20,child: Image.asset("assets/userIcon.png",)),
  //             SizedBox(width: 10),
  //             Text(
  //               "Task – $task",
  //               style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }


  static Widget buildTaskCard(BuildContext context, EmployeeDashboardController controller,Tasks task) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          color: Colors.grey.shade200,
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
                //
                //     Text(
                //       "Task Status : ",
                //       style:
                //           TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                //     ),
                //     Text(
                //       "${task.status}",
                //       style:
                //       TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: task.status=="incomplete"?Colors.red:Colors.green),
                //     ),
                //     // Expanded(child: Container()),
                //     // Image.asset(
                //     //   ConstantImage.message,
                //     //   width: 20,
                //     //   height: 20,
                //     //   color: Colors.black,
                //     // )
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



  static Widget getPunchInCard(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
         color: Colors.grey.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "09:00 AM",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Sat, March 14",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 16),
              /*Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,



                  border: Border.all(color: AppColor.positiveButton, width: 10),
                ),
                padding: EdgeInsets.all(40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(ConstantImage.handvector,width: 50,height: 50),
                    SizedBox(height: 8),
                    Text(
                      "Punch In",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )*/
              Image.asset(ConstantImage.punchin,width: 120,height: 120,),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on, color: Colors.grey[600]),
                  SizedBox(width: 4),
                  Text(
                    "Location: You are in office reach",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}