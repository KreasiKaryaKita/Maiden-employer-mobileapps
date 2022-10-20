// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maiden_employer/app/shared/utils/my_helper.dart';

class PhonePrefixModel {
  final String? icon;
  final String? name;
  PhonePrefixModel({this.icon, this.name});
}

class RegisterStepTwoController extends GetxController {
  RxBool isValidateFirst = false.obs;
  TextEditingController inputName = TextEditingController();
  RxBool validateName = true.obs;
  RxString msgName = "".obs;

  TextEditingController inputPhone = TextEditingController();
  RxBool validatePhone = true.obs;
  RxString msgPhone = "".obs;

  var phonePrefixes = <PhonePrefixModel>[].obs;
  var selectedPhonePrefix = PhonePrefixModel();
  var dateCt = TextEditingController();
  var months = <String>[].obs;
  var selectedMonth = ''.obs;
  var yearCt = TextEditingController();
  RxBool validateDate = true.obs;
  RxString msgDate = "".obs;

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
    onPhonePrefixChanged(phonePrefixes[0]);

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
    selectedMonth.value = months[0];
    doContinue();
  }

  onPhonePrefixChanged(PhonePrefixModel value) {
    selectedPhonePrefix = value;
  }

  onMonthChanged(String value) {
    selectedMonth.value = value;
  }

  onValidationFormInput(String? val) {
    if (isValidateFirst.value) {
      String valueName = inputName.text.toString().trim();
      String valuePhone = inputPhone.text.toString().trim();
      String valueDate = dateCt.text.toString().trim();
      String valueYear = yearCt.text.toString().trim();

      if (valueName.isEmpty) {
        validateName.value = false;
        msgName.value = "name_validation".tr;
      } else {
        validateName.value = true;
        msgName.value = "";
      }

      if (valuePhone.isEmpty) {
        validatePhone.value = false;
        msgPhone.value = "phone_number_validation".tr;
      } else {
        if (!MyHelpers.validateInputPhoneNumber(valuePhone)) {
          validatePhone.value = false;
          msgPhone.value = "phone_number_validation_2".tr;
        } else {
          validatePhone.value = true;
          msgPhone.value = "";
        }
      }

      printInfo(info: "valueDate : ${int.parse(valueDate)}");
      printInfo(info: "valueYear : ${int.parse(valueYear)}");
      printInfo(
          info:
              "valueYear : ${(int.parse(valueDate) > 0 && int.parse(valueDate) <= 31) && (int.parse(valueYear) <= DateTime.now().year)}");

      if (valueDate.isEmpty || valueYear.isEmpty) {
        validateDate.value = false;
        msgDate.value = "date_of_birth_validation".tr;
      } else {
        if ((int.parse(valueDate) > 0 && int.parse(valueDate) <= 31) && (int.parse(valueYear) <= DateTime.now().year)) {
          validateDate.value = true;
          msgDate.value = "";
        } else {
          validateDate.value = false;
          msgDate.value = "date_of_birth_validation".tr;
        }
      }
    }

    return validateName.value && validatePhone.value;
  }

  Future doContinue() async {
    isValidateFirst.value = true;
    bool validation = onValidationFormInput(null);
    // if (validation) {
    //   Get.toNamed(Routes.REGISTER_STEP_TWO);
    // }
  }
}
