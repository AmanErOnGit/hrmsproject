import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/constant/ConstantImage.dart';
import 'package:hrmsapp/model/EmplyeeDDModel.dart';
import 'package:hrmsapp/screens/professionaldetail/ProfessionalDetailController.dart';

class ProfessionalDetailScreen extends StatelessWidget {

  EmployeeDetail data;
  ProfessionalDetailScreen(this.data,{super.key});

  @override
  Widget build(BuildContext context) {
    final ProfessionalDetailController professionalDetailController =
        Get.put(ProfessionalDetailController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with Back Button and Title
              Container(
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 10,),
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
                      "Professional Details",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Employee Info Section
              Container(
                padding: const EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          child: Image.network(
                            data.profileImage??"",

                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                    data.employeeName??'',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                              Text(
                                    data.phoneNumber??"",//need to add emplyee Phone Number
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                            ],
                          ),
                        ),
                        Image.asset(
                          ConstantImage.call,
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          ConstantImage.message,
                          width: 20,
                          height: 20,
                        ),
                      ],
                    ),
                    const Divider(height: 30),
                    _buildDetailRow("Employee Id",
                        (data.employeeId??"").toString()),
                    const Divider(),
                    // _buildDetailRow("Department",
                    //     (data.designation??"").toString()),
                    // const Divider(),
                    _buildDetailRow("Designation",
                        (data.designation??"").toString()),
                    const Divider(),
                    _buildDetailRow("Email",
                        (data.email??"").toString()),
                    const Divider(),
                    _buildDetailRow("Password",
                        (data.password??"").toString()),
                    const Divider(),
                    _buildDetailRow(
                        "Salary", (data.salary??"").toString()),
                    const Divider(),
                    _buildDetailRow(
                        "Shift",(data.shiftTiming??"").toString()),
                    const Divider(),
                    _buildDetailRow("Employment Type",
                        (data.employmentType??"").toString()),
                    const Divider(),
                    _buildDetailRow("Shop Name",
                        (data.shopName??"").toString()),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Punch In/Out Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildPunchCard(
                      "PUNCH IN",
                      professionalDetailController.punchInTime.value,
                      "Not Yet",
                      Colors.green,
                    ),
                    _buildPunchCard(
                      "PUNCH OUT",
                      professionalDetailController.punchOutTime.value,
                      "",
                      Colors.grey,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Attendance Stats
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStatCard(
                      "On Time \n ",
                      professionalDetailController.onTimePercentage.value,
                      Colors.green,
                    ),
                    _buildStatCard(
                      "Total Attendance",
                      professionalDetailController.totalAttendance.value,
                      Colors.grey,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Reporting Manager Section
              // Container(
              //   padding: const EdgeInsets.all(15),
              //   margin: const EdgeInsets.all( 12.0),
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(12),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.grey.withOpacity(0.1),
              //         spreadRadius: 5,
              //         blurRadius: 7,
              //         offset: const Offset(0, 3),
              //       ),
              //     ],
              //   ),
              //   child: Row(
              //     children: [
              //       Image.asset(
              //         ConstantImage.profile,
              //         width: 50,
              //         height: 50,
              //       ),
              //       const SizedBox(width: 10),
              //       Expanded(
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Obx(() => Text(
              //                   professionalDetailController
              //                       .reportingManager.value,
              //                   style: const TextStyle(
              //                     fontSize: 18,
              //                     fontWeight: FontWeight.bold,
              //                   ),
              //                 )),
              //             const Text(
              //               "Reporting Manager",
              //               style: TextStyle(
              //                 fontSize: 14,
              //                 color: Colors.grey,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       Image.asset(
              //         ConstantImage.call,
              //         width: 20,
              //         height: 20,
              //       ),
              //       const SizedBox(width: 10),
              //       Image.asset(
              //         ConstantImage.message,
              //         width: 20,
              //         height: 20,
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget for detail rows
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
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
        ],
      ),
    );
  }

  // Helper widget for punch in/out cards
  Widget _buildPunchCard(
      String title, String time, String status, Color iconColor) {
    return Container(
      width: Get.width * 0.42,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Icon(
                Icons.fingerprint,
                color: iconColor,
                size: 30,
              ),
            ],
          )

          /* Row(
                children: [
                  Icon(
                    Icons.fingerprint,
                    color: iconColor,
                    size: 30,
                  ),
                  const SizedBox(width: 10),
                  */ /*Text(
                    status,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),*/ /*
                ],
              ),*/
        ],
      ),
    );
  }

  // Helper widget for attendance stats cards
  Widget _buildStatCard(String title, String value, Color iconColor) {
    return Container(
      width: Get.width * 0.43,
      padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          Icon(
            title == "On Time" ? Icons.check_box : Icons.calendar_today,
            color: iconColor,
            size: 25,
          ),
        ],
      ),
    );
  }
}
