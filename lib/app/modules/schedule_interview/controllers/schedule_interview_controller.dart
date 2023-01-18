// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScheduleInterviewController extends GetxController {
  Rx<DateTime> focusedDay = DateTime.now().obs;
  Rx<DateTime> selectedDay = DateTime.now().obs;
  Rx<DateTime> firstDay = DateTime.now().obs;
  Rx<DateTime> lastDay = DateTime.now().add(Duration(days: 90)).obs;
  RxList<DateTime> notAvailable = <DateTime>[].obs;
  RxList<Map> timeSlot = <Map>[].obs;
  RxMap timeSlotSelected = {}.obs;
  TextEditingController inputRemarks = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    for (var i = 3; i < 13; i++) {
      if (i % 3 > 0) {
        notAvailable.add(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + i));
      }
    }
    timeSlot.assignAll([
      {
        "time": "10am - 11am",
        "is_available": true,
      },
      {
        "time": "1pm - 2pm",
        "is_available": false,
      },
      {
        "time": "3pm - 4pm",
        "is_available": false,
      },
    ]);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  setSelectedDay(DateTime val) {
    selectedDay.value = val;
    focusedDay.value = val;
  }
}
