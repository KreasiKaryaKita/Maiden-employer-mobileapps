// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhonePrefixModel {
  final String? icon;
  final String? name;
  PhonePrefixModel({this.icon, this.name});
}

class RegisterStepTwoController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var isAutoValidate = false.obs;
  var nameCt = TextEditingController();
  var phonePrefixes = <PhonePrefixModel>[].obs;
  var selectedPhonePrefix = PhonePrefixModel();
  var phoneCt = TextEditingController();
  var dateCt = TextEditingController();
  var months = <String>[].obs;
  var selectedMonth = ''.obs;
  var yearCt = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    init();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  init() {
    phonePrefixes.assignAll([PhonePrefixModel(icon: 'assets/images/icon-country-singapore.svg', name: '+65')]);

    months.assignAll([
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Okt',
      'Nov',
      'Dec',
    ]);
  }

  onPhonePrefixChanged(PhonePrefixModel value) {
    selectedPhonePrefix = value;
    phonePrefixes.refresh();
  }

  onMonthChanged(String value) {
    selectedMonth.value = value;
  }

  bool isRegisterEnabled() {
    return selectedPhonePrefix.name != null;
  }

  onRegisterStepTwo() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    } else {
      isAutoValidate.value = true;
    }
  }
}
