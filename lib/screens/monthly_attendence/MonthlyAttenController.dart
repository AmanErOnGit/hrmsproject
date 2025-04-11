


import 'package:get/get.dart';
import 'package:intl/intl.dart';

class   MonthlyAttenController extends GetxController{




  var selectedDateIndex = 0; // Track the selected date index
  List<Map<String, String>> dateList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    generateCurrentMonthDates();
  }




  void generateCurrentMonthDates() {
    DateTime now = DateTime.now();
    int totalDays = DateTime(now.year, now.month + 1, 0).day; // Get total days in month

    dateList.clear();
    for (int i = now.day; i > 0; i--) {
      DateTime date = DateTime(now.year, now.month, i);
      dateList.add({
        "day": DateFormat('EEE').format(date), // Short Day Name (e.g., Mon)
        "date": DateFormat('d').format(date), // Date (e.g., 12)
      });

    }
    selectedDateIndex=dateList.length-1;
    update(); // Notify UI
  }

  void selectDate(int index) {
    selectedDateIndex = index;
    update();
  }

}