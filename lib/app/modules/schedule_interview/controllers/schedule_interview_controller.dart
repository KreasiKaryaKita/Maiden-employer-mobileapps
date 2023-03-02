// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maiden_employer/app/data/repository/api_repositories.dart';
import 'package:maiden_employer/app/models/response_helper_detail.dart';
import 'package:maiden_employer/app/models/response_interview_time_slot.dart';
import 'package:maiden_employer/app/models/response_standard.dart';
import 'package:maiden_employer/app/shared/common/common_function.dart';

class ScheduleInterviewController extends GetxController {
  Rx<DateTime> focusedDay = DateTime.now().obs;
  Rx<DateTime> selectedDay = DateTime.now().obs;
  Rx<DateTime> firstDay = DateTime.now().obs;
  Rx<DateTime> lastDay = DateTime.now().add(Duration(days: 90)).obs;
  RxList<DateTime> notAvailable = <DateTime>[].obs;
  var timeSlot = <InterviewTimeSlotModel>[].obs;
  var timeSlotSelected = InterviewTimeSlotModel().obs;
  TextEditingController inputRemarks = TextEditingController();
  var helperDetail = HelperDetailModel().obs;

  @override
  void onInit() {
    super.onInit();

    var data = Get.arguments;
    if (data != null) {
      helperDetail.value = data['helper'];
    }

    for (var i = 3; i < 13; i++) {
      if (i % 3 > 0) {
        notAvailable.add(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + i));
      }
    }
    getTimeSlot();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getTimeSlot() {
    timeSlot.clear();
    ApiRepositories.interviewTimeSlot(helperId: helperDetail.value.id ?? 0, date: selectedDay.value).then((value) {
      if (value is ResponseInterviewTimeSlot) {
        timeSlot.assignAll(value.data!.list!.where((e) => e.isAvailable!).toList());
      } else {
        CommonFunction.snackbarHelper(isSuccess: false, title: 'Failed', message: value?.message ?? '');
      }
    }, onError: (e) {
      CommonFunction.snackbarHelper(isSuccess: false, title: 'Failed', message: e.toString());
    });
  }

  setSelectedDay(DateTime val) {
    selectedDay.value = val;
    focusedDay.value = val;
    getTimeSlot();
    timeSlotSelected.value = InterviewTimeSlotModel();
  }

  onTimeSlotSelected(InterviewTimeSlotModel ts) {
    timeSlotSelected.value = ts;
    timeSlot.refresh();
  }

  onSetSchedulePressed() {
    if (timeSlotSelected.value.timeLabel == null) {
      CommonFunction.snackbarHelper(
          isSuccess: false, title: 'Warning', message: 'You must select one of available timslot for interview');
      return;
    }

    CommonFunction.loadingShow();
    ApiRepositories.interviewCreate(
            helperId: helperDetail.value.id ?? 0,
            date: selectedDay.value,
            startTime: timeSlotSelected.value.timeStart ?? '',
            endTime: timeSlotSelected.value.timeFinish ?? '',
            remark: inputRemarks.text)
        .then((value) {
      CommonFunction.loadingHide();
      if (value is ResponseStandard && value.error == 200) {
        Get.back();
        CommonFunction.snackbarHelper(title: 'Success', message: value.message ?? '');
      } else {
        CommonFunction.snackbarHelper(isSuccess: false, title: 'Failed', message: value?.message ?? '');
      }
    }, onError: (e) {
      CommonFunction.loadingHide();
      CommonFunction.snackbarHelper(isSuccess: false, title: 'Failed', message: e.toString());
    });
  }
}
