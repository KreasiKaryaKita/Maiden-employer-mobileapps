import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:maiden_employer/app/config/constants/app_constant.dart';
import 'package:maiden_employer/app/models/entity/option_status_helpers_model.dart';
import 'package:maiden_employer/app/modules/account/authentication/register/models/option_month.dart';
import 'package:maiden_employer/app/modules/account/authentication/register/models/option_year.dart';
import 'package:maiden_employer/app/modules/helper_listing/controllers/helper_listing_controller.dart';
import 'package:maiden_employer/app/shared/widgets/bottom_sheet/filter_education_helper.dart';
import 'package:maiden_employer/app/shared/widgets/bottom_sheet/filter_language_helper.dart';
import 'package:maiden_employer/app/shared/widgets/bottom_sheet/filter_marital_status_helper.dart';
import 'package:maiden_employer/app/shared/widgets/bottom_sheet/filter_nationality_helper.dart';
import 'package:maiden_employer/app/shared/widgets/bottom_sheet/filter_religion_helper.dart';
import 'package:maiden_employer/app/shared/widgets/bottom_sheet/filter_sort_helper.dart';
import 'package:maiden_employer/app/shared/widgets/bottom_sheet/filter_work_experience_helper.dart';
import 'package:maiden_employer/app/shared/widgets/bottom_sheet/filter_work_skill_helper.dart';
import 'package:maiden_employer/app/shared/widgets/buttons/button_fill.dart';

class FilterHelper extends StatelessWidget {
  FilterHelper({Key? key, required this.statusBar}) : super(key: key);

  final HelperListingController controller = Get.find<HelperListingController>();
  final double statusBar;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Container(
          height: Get.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFF820333),
                const Color(0xFF540032),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                leading: IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                title: Text(
                  "filters".tr.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppConstant.SF_PRO_FONT,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
                actions: [
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                        controller.onClearSearch();
                      },
                      child: Text(
                        "clear_all".tr.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: AppConstant.SF_PRO_FONT,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                        ),
                      ).paddingOnly(right: 20),
                    ),
                  ),
                ],
              ).marginOnly(top: statusBar),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  children: [
                    InkWell(
                      onTap: () {
                        Get.bottomSheet(
                          FilterSortHelper(statusBar: statusBar),
                          isScrollControlled: true,
                          isDismissible: false,
                          barrierColor: Colors.transparent,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFFC7595C),
                            ),
                          ),
                        ),
                        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "filters_sort_by".tr,
                                    style: TextStyle(
                                      fontFamily: AppConstant.CENTURY_GOTHIC_FONT,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ).marginOnly(bottom: 3),
                                  Text(
                                    controller.selectedSortBy.value.label!,
                                    style: TextStyle(
                                      fontFamily: AppConstant.SF_PRO_FONT,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                              size: 12,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xFFC7595C),
                          ),
                        ),
                      ),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "filters_status".tr,
                            style: TextStyle(
                              fontFamily: AppConstant.CENTURY_GOTHIC_FONT,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 47,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: controller.helpersStatus.length,
                              padding: const EdgeInsets.all(0),
                              itemBuilder: (context, index) {
                                OptionStatusHelpersModel item = controller.helpersStatus[index];
                                return InkWell(
                                  onTap: () {
                                    controller.onSelectStatusFilter(index);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          const Color(0xFF2E112D),
                                          const Color(0xFF540032),
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                                    margin: EdgeInsets.only(
                                      left: index == 0 ? 0 : 4,
                                      right: index == controller.helpersStatus.length - 1 ? 0 : 4,
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          item.label!,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: AppConstant.SF_PRO_FONT,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                          ),
                                        ),
                                        if (item.value == controller.helpersStatusSelected.value.value)
                                          Icon(
                                            Icons.check_rounded,
                                            color: Colors.white,
                                            size: 18,
                                          ).marginOnly(left: 8),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ).marginOnly(top: 20),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xFFC7595C),
                          ),
                        ),
                      ),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "age".tr,
                            style: TextStyle(
                              fontFamily: AppConstant.CENTURY_GOTHIC_FONT,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                          Container(
                            height: 80,
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: SliderTheme(
                              data: SliderThemeData(
                                trackHeight: 1,
                                overlayShape: SliderComponentShape.noThumb,
                              ),
                              child: RangeSlider(
                                values: controller.currentRangeValues.value,
                                max: controller.minMaxAgeRange.value.end,
                                min: controller.minMaxAgeRange.value.start,
                                onChanged: controller.onChangeRangeAge,
                                inactiveColor: Color(0xFF2E112D),
                                activeColor: Color(0xFFCE5D60),
                              ),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: controller.inputAgeStart,
                                  style: const TextStyle(
                                    fontFamily: AppConstant.SF_PRO_FONT,
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textInputAction: TextInputAction.done,
                                  onSubmitted: (value) async {
                                    await controller.onSubmitAgeStart(value);
                                    await controller.onSubmitAgeEnd(controller.inputAgeEnd.text);
                                    controller.onChangeRangeAge(controller.currentRangeValues.value);
                                  },
                                  textAlignVertical: TextAlignVertical.center,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                                  decoration: InputDecoration(
                                    counterText: '',
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                    isDense: false,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    suffix: Text(
                                      'search_age_year'.tr,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ).marginOnly(right: 16),
                              ),
                              Expanded(
                                child: Container(),
                              ),
                              Expanded(
                                child: TextField(
                                  controller: controller.inputAgeEnd,
                                  style: const TextStyle(
                                    fontFamily: AppConstant.SF_PRO_FONT,
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textInputAction: TextInputAction.done,
                                  onSubmitted: (value) async {
                                    await controller.onSubmitAgeStart(controller.inputAgeStart.text);
                                    await controller.onSubmitAgeEnd(value);
                                    controller.onChangeRangeAge(controller.currentRangeValues.value);
                                  },
                                  textAlignVertical: TextAlignVertical.center,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                                  decoration: InputDecoration(
                                    counterText: '',
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                    isDense: false,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    suffix: Text(
                                      'search_age_year'.tr,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ).marginOnly(left: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xFFC7595C),
                          ),
                        ),
                      ),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "filters_helper_ready_from".tr,
                            style: TextStyle(
                              fontFamily: AppConstant.CENTURY_GOTHIC_FONT,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: PopupMenuButton<OptionMonth>(
                                  itemBuilder: (context) => controller.months
                                      .map(
                                        (element) => PopupMenuItem(
                                          value: element,
                                          child: Text(
                                            element.label!,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Color(0xFF001833),
                                              fontFamily: AppConstant.CENTURY_GOTHIC_FONT,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(6),
                                    ),
                                  ),
                                  constraints: BoxConstraints(maxHeight: 200),
                                  position: PopupMenuPosition.under,
                                  color: Colors.white,
                                  padding: const EdgeInsets.all(0),
                                  iconSize: 80,
                                  icon: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 9, vertical: 12),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                controller.selectedMonth.value.label!,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Divider(
                                                color: Color(0xFFADB5BD),
                                                thickness: 1,
                                              ),
                                              Text(
                                                "search_ready_month".tr,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: Colors.white,
                                          size: 24,
                                        ).marginOnly(top: 4, left: 20),
                                      ],
                                    ),
                                  ),
                                  elevation: 2,
                                  onSelected: (month) {
                                    controller.isMonthYearFiltered.value = true;
                                    controller.selectedMonth.value = month;

                                    controller.getHelpersCount();
                                  },
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: PopupMenuButton<OptionYear>(
                                  itemBuilder: (context) => controller.year
                                      .map(
                                        (element) => PopupMenuItem(
                                          value: element,
                                          child: Text(
                                            element.label!,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Color(0xFF001833),
                                              fontFamily: AppConstant.CENTURY_GOTHIC_FONT,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(6),
                                    ),
                                  ),
                                  constraints: BoxConstraints(maxHeight: 200),
                                  position: PopupMenuPosition.under,
                                  color: Colors.white,
                                  padding: const EdgeInsets.all(0),
                                  iconSize: 80,
                                  icon: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 9, vertical: 12),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                controller.selectedYear.value.label!,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Divider(
                                                color: Color(0xFFADB5BD),
                                                thickness: 1,
                                              ),
                                              Text(
                                                "search_ready_year".tr,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: Colors.white,
                                          size: 24,
                                        ).marginOnly(top: 4, left: 20),
                                      ],
                                    ),
                                  ),
                                  elevation: 2,
                                  onSelected: (year) {
                                    controller.isMonthYearFiltered.value = true;
                                    controller.selectedYear.value = year;

                                    controller.getHelpersCount();
                                  },
                                ),
                              ),
                            ],
                          ).marginOnly(top: 20),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.bottomSheet(
                          FilterNationalityHelper(statusBar: statusBar),
                          isScrollControlled: true,
                          isDismissible: false,
                          barrierColor: Colors.transparent,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFFC7595C),
                            ),
                          ),
                        ),
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "filters_nationality".tr,
                                    style: TextStyle(
                                      fontFamily: AppConstant.CENTURY_GOTHIC_FONT,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ).marginOnly(bottom: 3),
                                  Text(
                                    (controller.helpersNationalitySelected.isEmpty ||
                                            controller.helpersNationalitySelected.length ==
                                                controller.helpersNationality.length)
                                        ? "all".tr
                                        : controller.helpersNationalitySelected.map((val) => val.label).join(', '),
                                    style: TextStyle(
                                      fontFamily: AppConstant.SF_PRO_FONT,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                              size: 12,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.bottomSheet(
                          FilterLanguageHelper(statusBar: statusBar),
                          isScrollControlled: true,
                          isDismissible: false,
                          barrierColor: Colors.transparent,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFFC7595C),
                            ),
                          ),
                        ),
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "filters_language".tr,
                                    style: TextStyle(
                                      fontFamily: AppConstant.CENTURY_GOTHIC_FONT,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ).marginOnly(bottom: 3),
                                  Text(
                                    (controller.helpersLanguageSelected.isEmpty ||
                                            controller.helpersLanguageSelected.length ==
                                                controller.helpersLanguage.length)
                                        ? "all".tr
                                        : controller.helpersLanguageSelected.map((val) => val.label).join(', '),
                                    style: TextStyle(
                                      fontFamily: AppConstant.SF_PRO_FONT,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                              size: 12,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.bottomSheet(
                          FilterReligionHelper(statusBar: statusBar),
                          isScrollControlled: true,
                          isDismissible: false,
                          barrierColor: Colors.transparent,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFFC7595C),
                            ),
                          ),
                        ),
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "filters_religion".tr,
                                    style: TextStyle(
                                      fontFamily: AppConstant.CENTURY_GOTHIC_FONT,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ).marginOnly(bottom: 3),
                                  Text(
                                    (controller.helpersReligionSelected.isEmpty ||
                                            controller.helpersReligionSelected.length ==
                                                controller.helpersReligion.length)
                                        ? "all".tr
                                        : controller.helpersReligionSelected.map((val) => val.label).join(', '),
                                    style: TextStyle(
                                      fontFamily: AppConstant.SF_PRO_FONT,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                              size: 12,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.bottomSheet(
                          FilterEducationHelper(statusBar: statusBar),
                          isScrollControlled: true,
                          isDismissible: false,
                          barrierColor: Colors.transparent,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFFC7595C),
                            ),
                          ),
                        ),
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "filters_education".tr,
                                    style: TextStyle(
                                      fontFamily: AppConstant.CENTURY_GOTHIC_FONT,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ).marginOnly(bottom: 3),
                                  Text(
                                    (controller.helpersEducationSelected.isEmpty ||
                                            controller.helpersEducationSelected.length ==
                                                controller.helpersEducation.length)
                                        ? "all".tr
                                        : controller.helpersEducationSelected.map((val) => val.label).join(', '),
                                    style: TextStyle(
                                      fontFamily: AppConstant.SF_PRO_FONT,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                              size: 12,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.bottomSheet(
                          FilterMaritalStatusHelper(statusBar: statusBar),
                          isScrollControlled: true,
                          isDismissible: false,
                          barrierColor: Colors.transparent,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFFC7595C),
                            ),
                          ),
                        ),
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "filters_marital_status".tr,
                                    style: TextStyle(
                                      fontFamily: AppConstant.CENTURY_GOTHIC_FONT,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ).marginOnly(bottom: 3),
                                  Text(
                                    (controller.helpersMaritalStatusSelected.isEmpty ||
                                            controller.helpersMaritalStatusSelected.length ==
                                                controller.helpersMaritalStatus.length)
                                        ? "all".tr
                                        : controller.helpersMaritalStatusSelected.map((val) => val.label).join(', '),
                                    style: TextStyle(
                                      fontFamily: AppConstant.SF_PRO_FONT,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                              size: 12,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.bottomSheet(
                          FilterWorkSkillHelper(statusBar: statusBar),
                          isScrollControlled: true,
                          isDismissible: false,
                          barrierColor: Colors.transparent,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFFC7595C),
                            ),
                          ),
                        ),
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "work_skills".tr,
                                    style: TextStyle(
                                      fontFamily: AppConstant.CENTURY_GOTHIC_FONT,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ).marginOnly(bottom: 3),
                                  Text(
                                    (controller.helpersWorkSkillSelected.isEmpty ||
                                            controller.helpersWorkSkillSelected.length ==
                                                controller.helpersWorkSkill.length)
                                        ? "all".tr
                                        : controller.helpersWorkSkillSelected.map((val) => val.label).join(', '),
                                    style: TextStyle(
                                      fontFamily: AppConstant.SF_PRO_FONT,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                              size: 12,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.bottomSheet(
                          FilterWorkExperienceHelper(statusBar: statusBar),
                          isScrollControlled: true,
                          isDismissible: false,
                          barrierColor: Colors.transparent,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFFC7595C),
                            ),
                          ),
                        ),
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "work_experience".tr,
                                    style: TextStyle(
                                      fontFamily: AppConstant.CENTURY_GOTHIC_FONT,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ).marginOnly(bottom: 3),
                                  Text(
                                    (controller.helpersWorkExperienceSelected.isEmpty ||
                                            controller.helpersWorkExperienceSelected.length ==
                                                controller.helpersWorkExperience.length)
                                        ? "all".tr
                                        : controller.helpersWorkExperienceSelected.map((val) => val.label).join(', '),
                                    style: TextStyle(
                                      fontFamily: AppConstant.SF_PRO_FONT,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                              size: 12,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Color(0xFF820333),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: ButtonFill(
                  onPressed: () async {
                    await controller.onSubmitAgeStart(controller.inputAgeStart.text);
                    await controller.onSubmitAgeEnd(controller.inputAgeEnd.text);
                    await controller.onChangeRangeAge(controller.currentRangeValues.value);
                    controller.onSubmitSearch();
                  },
                  backgroundColor: Colors.white,
                  height: 48,
                  text: Text(
                    "${'filters_apply_all'.tr} (${controller.helpersCountSearch.value})",
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      fontFamily: AppConstant.SF_PRO_FONT,
                    ),
                  ),
                ).paddingOnly(bottom: (Platform.isAndroid) ? 0 : 12),
              )
            ],
          ),
        ),
      ),
    );
  }
}
