// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maiden_employer/app/config/constants/app_constant.dart';
import 'package:maiden_employer/app/models/entity/helpers_model.dart';
import 'package:maiden_employer/app/models/entity/option_country_helpers_model.dart';

class HelperListingController extends GetxController {
  TextEditingController inputSearch = TextEditingController();
  var helpers = <HelpersModel>[].obs;
  var helpersCountry = <OptionCountryHelpersModel>[].obs;
  RxString helpersCountrySelected = "".obs;

  @override
  void onInit() {
    super.onInit();
    helpers.assignAll(
      [
        HelpersModel(
          image: AppConstant.DEFAULT_AVATAR,
          age: 28,
          country: "indonesia",
          experience: 3,
          name: "Susilawati Riandy",
          readyDate: DateTime.parse("2022-11-25"),
        ),
        HelpersModel(
          image: AppConstant.DEFAULT_AVATAR,
          age: 22,
          country: "indonesia",
          experience: 2,
          name: "Maryani Frida",
          readyDate: DateTime.parse("2022-11-28"),
        ),
        HelpersModel(
          image: AppConstant.DEFAULT_AVATAR,
          age: 25,
          country: "singapore",
          experience: 5,
          name: "Herlina Gustiana",
          readyDate: DateTime.parse("2022-11-29"),
        ),
      ],
    );
    helpersCountry.assignAll([
      OptionCountryHelpersModel(label: "all".tr, value: "all"),
      OptionCountryHelpersModel(label: "Indonesian".tr, value: "Indonesian"),
      OptionCountryHelpersModel(label: "Phillippines".tr, value: "Phillippines"),
      OptionCountryHelpersModel(label: "Myanmar".tr, value: "Myanmar"),
    ]);
    helpersCountrySelected.value = helpersCountry[0].value!;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onSelectCountryFilter(int index) {
    helpersCountrySelected.value = helpersCountry[index].value!;
    helpersCountry.refresh();
  }
}
