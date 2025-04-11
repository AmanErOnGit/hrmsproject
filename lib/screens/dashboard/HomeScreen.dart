import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/constant/ConstantImage.dart';
import 'package:hrmsapp/constant/CustomWidget.dart';
import 'package:hrmsapp/screens/createuser/CreateUserScreen.dart';
import 'package:hrmsapp/screens/dashboard/DashboardController.dart';
import 'package:hrmsapp/screens/notification/NotificationScreen.dart';
import 'package:hrmsapp/support/app_theme.dart';

import '../../support/PunchService.dart';

class HomeScreen {
  static getHomeScreen(BuildContext context, DashboardController controller) {
    return Column(
      children: [
        getAppBar(context, controller),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [

                if(controller.loginModel.userType!=null)
                  if(controller.loginModel.userType!.toLowerCase()!="admin")
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                          List.generate(controller.dateList.length, (index) {
                        bool isSelected = controller.selectedDateIndex == index;
                        return GestureDetector(
                          onTap: () {
                            controller.selectDate(index);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColor.secondary
                                  : Colors.white,
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
                                  controller.dateList.reversed.toList()[index]
                                      ["date"]!,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                Text(
                                  controller.dateList.reversed.toList()[index]
                                      ["day"]!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color:
                                        isSelected ? Colors.white : Colors.grey,
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
                if(controller.loginModel.userType!=null)
                  if(controller.loginModel.userType!.toLowerCase()!="admin")
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade400,
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(5, 5))
                      ]),
                  child: Column(
                    children: [
                      Image.asset("assets/sun_cloud.png"),
                      Row(
                        children: [
                          Expanded(child: SizedBox()),
                          // getCard("${controller.elapsedSeconds.value/3600}"),
                          // getCard("${(controller.elapsedSeconds.value%3600)/60}"),
                          // getCard("${controller.elapsedSeconds.value%3600}"),
                          getCard("00"),
                          getCard("00"),
                          getCard("00"),
                          Expanded(
                              child: SizedBox(
                            child: Text("HRS"),
                          ))
                        ],
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        height: 3,
                        width: Get.width - 40,
                        color: Colors.grey.shade300,
                      ),
                      Text(
                        "Shift Time 09:00 AM to 06:00 PM",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomWidget.elevatedCustomButton(
                          context, "Punch In", () async{

                            // await PunchService().punchIn();
                      }),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Text(
                        "Employee List",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () async{
                          // Get.to(()=>)

                          await Get.to(() => CreateUserScreen());
                          controller.getEmpList();
                        },
                        child: Row(
                          children: [
                            Text(
                              "Create Employee",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.black54),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(Icons.person_add_outlined,
                                size: 23, color: Colors.black54)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                  if (controller.employeeList.isNotEmpty)
                    employeeCard(
                      imageUrl:
                          controller.employeeList[0].profileImage ?? "",
                      name: controller.employeeList[0].employeeName ?? "",
                      employeeId:
                          controller.employeeList[0].employeeId ?? "",
                      profile: controller.employeeList[0].designation ?? "",
                      salary: controller.employeeList[0].salary ?? "",
                      shiftTiming:
                          controller.employeeList[0].shiftTiming ?? "",
                      // task: "Create a Mobile app",
                    ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  static getAppBar(context, DashboardController controller) {
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: AppColor.secondary,
              child: Text(
                  controller.loginModel.userType!.toLowerCase()=="admin"?
                 controller.loginModel.user != null
                        ? (controller.loginModel.user!.fullName ?? "")
                            .toString()
                            .trim()[0]
                        : ""
                      :(controller.loginModel.employee!.employeeName ?? "")
                      .toString()
                      .trim()[0],
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.loginModel.userType!.toLowerCase()=="admin"?
                controller.loginModel.user != null
                    ? controller.loginModel.user!.fullName ?? ""
                    : ""
                    :controller.loginModel.employee!=null
                     ? controller.loginModel.employee!.employeeName!.toString()
                :"",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
              Text(
                controller.loginModel.userType != null
                    ? controller.loginModel.userType!.toUpperCase() ?? ""
                    : "",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade400),
              ),
            ],
          )),
          InkWell(
            onTap: () {
              Get.to(NotificationScreen());
            },
            child: Stack(
              children: [
                Container(
                    height: 40,
                    width: 40,
                    margin: EdgeInsets.only(right: 20),
                    child: Image.asset(
                      "assets/notifi.png",
                    )),
                Positioned(
                    right: 30,
                    top: 5,
                    child: Icon(
                      Icons.circle,
                      size: 10,
                      color: Colors.red,
                    ))
              ],
            ),
          )
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
    // required String task,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
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
              //  Icon, color: Colors.red, size: 28),

              Image.asset(
                ConstantImage.location,
                width: 20,
                height: 23,
              )
            ],
          ),
          SizedBox(height: 10),
          Divider(),
          // Row(
          //   children: [
          //     Icon(Icons.task_alt, color: Colors.green, size: 24),
          //     SizedBox(width: 10),
          //     Text(
          //       "Task – $task",
          //       style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

  static getCard(String data) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: AppColor.secondary.withOpacity(0.3),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Text(
        data,
      ),
    );
  }
}
