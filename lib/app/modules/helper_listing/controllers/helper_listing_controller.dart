// ignore_for_file: unnecessary_overrides

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maiden_employer/app/config/constants/app_constant.dart';
import 'package:maiden_employer/app/models/entity/helpers_model.dart';
import 'package:maiden_employer/app/models/entity/option_country_helpers_model.dart';
import 'package:maiden_employer/app/modules/account/authentication/register/models/option_month.dart';
import 'package:maiden_employer/app/modules/account/authentication/register/models/option_year.dart';

class HelperListingController extends GetxController {
  TextEditingController inputSearch = TextEditingController();
  var helpers = <HelpersModel>[].obs;
  var helpersCountry = <OptionCountryHelpersModel>[].obs;
  RxString helpersCountrySelected = "".obs;

  var months = <OptionMonth>[].obs;
  var selectedMonth = OptionMonth().obs;

  var year = <OptionYear>[].obs;
  var selectedYear = OptionYear().obs;
  var now = DateTime.now();

  Rx<RangeValues> currentRangeValues = RangeValues(21, 50).obs;

  ExpandableController skillsIsExpanded = ExpandableController(initialExpanded: true);
  ExpandableController readyIsExpanded = ExpandableController(initialExpanded: false);
  ExpandableController ageIsExpanded = ExpandableController(initialExpanded: false);

  @override
  void onInit() {
    super.onInit();
    months.assignAll([
      OptionMonth(label: "Jan", value: "01"),
      OptionMonth(label: "Feb", value: "02"),
      OptionMonth(label: "Mar", value: "03"),
      OptionMonth(label: "Apr", value: "04"),
      OptionMonth(label: "May", value: "05"),
      OptionMonth(label: "Jun", value: "06"),
      OptionMonth(label: "Jul", value: "07"),
      OptionMonth(label: "Aug", value: "08"),
      OptionMonth(label: "Sep", value: "09"),
      OptionMonth(label: "Nov", value: "11"),
      OptionMonth(label: "Dec", value: "12"),
    ]);
    selectedMonth.value = months[0];

    for (var i = 0; i <= 5; i++) {
      year.add(OptionYear(
        value: "${now.year + i}",
        label: "${now.year + i}",
      ));
    }
    selectedYear.value = year[0];

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

  onSelectReadyMonth(OptionMonth value) {
    selectedMonth.value = value;
  }

  onSelectReadyYear(OptionYear value) {
    selectedYear.value = value;
  }

  onChangeRangeAge(RangeValues values) {
    currentRangeValues.value = values;
  }

  onChangeIsExpanded(int index) {
    switch (index) {
      case 0:
        skillsIsExpanded.value = true;
        readyIsExpanded.value = false;
        ageIsExpanded.value = false;
        break;

      case 1:
        skillsIsExpanded.value = false;
        readyIsExpanded.value = true;
        ageIsExpanded.value = false;
        break;

      case 2:
        skillsIsExpanded.value = false;
        readyIsExpanded.value = false;
        ageIsExpanded.value = true;
        break;
      default:
    }
  }
}
