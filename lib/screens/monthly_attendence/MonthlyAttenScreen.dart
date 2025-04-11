import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/screens/monthly_attendence/MonthlyAttenController.dart';

import '../../constant/ConstantImage.dart';

class MonthlyAttenScreen extends StatelessWidget {
  const MonthlyAttenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.put(MonthlyAttenController()),
        builder: (controller) {
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
                        "Monthly Attendance",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(child: SizedBox())
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
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
                                  ? Colors.green.shade700
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
                buildShiftDetailsCard(context,controller)
              ],
            ),
          );
        });
  }


  static Widget buildShiftDetailsCard(context,controller) {
    return Container(
      color: Colors.grey.shade100,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildRow("Shift", "Morning"),
          Divider(),
          buildRow("Shift Timing", "09:45 AM_09:45 PM"),
          Divider(),
          buildRow("Punch In Time", "10:47 AM"),
          Divider(),
          buildRow("Late Hrs", "1.02"),
          Divider(),
          buildRow("Punch Out", "0.00"),
          Divider(),
          buildRow("Early Punch Out", "0.00"),
          Divider(),
          buildRow("Working Hrs", "0.00"),
          Divider(),
          buildRow("Status", "Present", valueColor: Colors.green),
        ],
      ),
    );
  }


  static Widget buildRow(String title, String value, {Color valueColor = Colors.grey}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),
            Text(
              value,
              style: TextStyle(color: valueColor, fontSize: 16),
            ),
          ],
        ),
        const Divider(color: Colors.white24, height: 20),
      ],
    );
  }

}
