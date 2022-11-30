import 'dart:io';
import 'dart:ui';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:maiden_employer/app/config/constants/app_constant.dart';
import 'package:maiden_employer/app/models/entity/option_work_skill_helpers_model.dart';
import 'package:maiden_employer/app/modules/account/authentication/register/models/option_month.dart';
import 'package:maiden_employer/app/modules/account/authentication/register/models/option_year.dart';
import 'package:maiden_employer/app/modules/helper_listing/controllers/helper_listing_controller.dart';
import 'package:maiden_employer/app/shared/widgets/buttons/button_fill.dart';
import 'package:maiden_employer/app/shared/widgets/buttons/button_text.dart';

class SearchHelper extends StatelessWidget {
  SearchHelper({Key? key, required this.statusBar}) : super(key: key);

  final HelperListingController controller = Get.find<HelperListingController>();
  final double statusBar;

  @override
  Widget build(BuildContext context) {
    controller.onChangeIsExpanded(0);
    return Obx(
      () => WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            height: Get.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF820333).withOpacity(0.9),
                  const Color(0xFF540032).withOpacity(0.9),
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
                      Icons.close_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  title: Text(
                    "search_title".tr.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppConstant.SF_PRO_FONT,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                ).marginOnly(top: statusBar),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.all(20),
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: ExpandableTheme(
                          data: ExpandableThemeData(hasIcon: false),
                          child: ExpandablePanel(
                            controller: controller.skillsIsExpanded,
                            collapsed: InkWell(
                              onTap: () {
                                controller.onChangeIsExpanded(0);
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "helper_skills".tr,
                                    style: TextStyle(
                                      color: Color(0xFF272B30),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      fontFamily: AppConstant.SF_PRO_FONT,
                                    ),
                                  ),
                                  Expanded(
                                    child: Builder(builder: (context) {
                                      var selecteds =
                                          controller.helpersWorkSkill.where((p) => p.selected ?? false).toList();
                                      return Text(
                                        selecteds.isEmpty
                                            ? "add_helper_skills".tr
                                            : selecteds.length > 1
                                                ? '${selecteds[0].label!},+${selecteds.length - 1}'
                                                : selecteds[0].label!,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Color(0xFF8C1D20),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          fontFamily: AppConstant.SF_PRO_FONT,
                                        ),
                                      );
                                    }),
                                  ),
                                ],
                              ).paddingAll(20),
                            ),
                            expanded: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "search_skill_header".tr,
                                  style: TextStyle(
                                    color: Color(0xFF8C1D20),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    fontFamily: AppConstant.CENTURY_GOTHIC_FONT,
                                  ),
                                ).marginOnly(bottom: 20),
                                TypeAheadField<OptionWorkSkillHelpersModel>(
                                  suggestionsBoxDecoration: SuggestionsBoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  animationStart: 0,
                                  textFieldConfiguration: TextFieldConfiguration(
                                    autofocus: false,
                                    controller: controller.helperSkillsTextCt,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      fontFamily: AppConstant.SF_PRO_FONT,
                                    ),
                                    decoration: InputDecoration(
                                      counterText: '',
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFE1464A),
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFE1464A),
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFFFBFBFB),
                                      hintText: "search_skill".tr,
                                      hintStyle: const TextStyle(
                                        color: Color(0xFF6A7178),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        fontFamily: AppConstant.SF_PRO_FONT,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: const BorderSide(
                                          color: Color(0xFFE1464A),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: const BorderSide(
                                          color: Color(0xFFE1464A),
                                        ),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.search_rounded,
                                        color: Color(0xFFE1464A),
                                      ),
                                    ),
                                  ),
                                  suggestionsCallback: (pattern) async {
                                    return controller.helpersWorkSkill
                                        .where((p) => p.label?.toLowerCase().contains(pattern.toLowerCase()) ?? false);
                                  },
                                  itemBuilder: (context, suggestion) {
                                    return ListTile(
                                      title: Text(suggestion.label ?? ''),
                                    );
                                  },
                                  onSuggestionSelected: (suggestion) => controller.onSkillSearchSelected(suggestion),
                                  noItemsFoundBuilder: (context) {
                                    return Text(
                                      "No Skills Found",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: AppConstant.SF_PRO_FONT,
                                        color: Colors.grey,
                                      ),
                                    ).paddingAll(8);
                                  },
                                ),
                                if (controller.helpersWorkSkill.where((p) => p.selected ?? false).toList().isNotEmpty)
                                  SizedBox(height: 20),
                                if (controller.helpersWorkSkill.where((p) => p.selected ?? false).toList().isNotEmpty)
                                  SizedBox(
                                    width: double.infinity,
                                    child: Wrap(
                                      runSpacing: 8,
                                      spacing: 8,
                                      children: List.generate(
                                          controller.helpersWorkSkill.where((p) => p.selected ?? false).toList().length,
                                          (index) {
                                        var sel =
                                            controller.helpersWorkSkill.where((p) => p.selected ?? false).toList();
                                        return GestureDetector(
                                          onTap: () => controller.onSkillSearchRemoveSelected(sel[index].value!),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8.5),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(4)),
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color(0xFF2E112D),
                                                  Color(0xFF540032),
                                                ],
                                              ),
                                            ),
                                            child: Row(mainAxisSize: MainAxisSize.min, children: [
                                              Text(
                                                sel[index].label ?? '',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white,
                                                  fontFamily: AppConstant.SF_PRO_FONT,
                                                ),
                                              ),
                                              SizedBox(width: 12),
                                              Icon(Icons.close, color: Colors.white, size: 16)
                                            ]),
                                          ),
                                        );
                                      }),
                                    ),
                                  )
                              ],
                            ).paddingAll(20),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        margin: EdgeInsets.only(top: 20),
                        child: ExpandableTheme(
                          data: ExpandableThemeData(hasIcon: false),
                          child: ExpandablePanel(
                            controller: controller.readyIsExpanded,
                            collapsed: InkWell(
                              onTap: () {
                                controller.onChangeIsExpanded(1);
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "ready_from".tr,
                                    style: TextStyle(
                                      color: Color(0xFF272B30),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      fontFamily: AppConstant.SF_PRO_FONT,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      !controller.isMonthYearFiltered.value
                                          ? "add_ready_from".tr
                                          : '${controller.selectedMonth.value.label} ${controller.selectedYear.value.label}',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xFF8C1D20),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        fontFamily: AppConstant.SF_PRO_FONT,
                                      ),
                                    ),
                                  ),
                                ],
                              ).paddingAll(20),
                            ),
                            expanded: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "search_ready_header".tr,
                                  style: TextStyle(
                                    color: Color(0xFF8C1D20),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    fontFamily: AppConstant.CENTURY_GOTHIC_FONT,
                                  ),
                                ).marginOnly(bottom: 20),
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
                                                color: Color(0xFF8C1D20),
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
                                                          color: Color(0xFF8C1D20),
                                                          fontWeight: FontWeight.w700,
                                                          fontSize: 16,
                                                          fontFamily: AppConstant.SF_PRO_FONT,
                                                        ),
                                                      ),
                                                      Divider(
                                                        color: Color(0xFFADB5BD),
                                                        thickness: 1,
                                                      ),
                                                      Text(
                                                        "search_ready_month".tr,
                                                        style: TextStyle(
                                                          color: Color(0xFF8C1D20),
                                                          fontWeight: FontWeight.w400,
                                                          fontSize: 12,
                                                          fontFamily: AppConstant.SF_PRO_FONT,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.keyboard_arrow_down_rounded,
                                                  color: Color(0xFF8C1D20),
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
                                          }),
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
                                              color: Color(0xFF8C1D20),
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
                                                        color: Color(0xFF8C1D20),
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: 16,
                                                        fontFamily: AppConstant.SF_PRO_FONT,
                                                      ),
                                                    ),
                                                    Divider(
                                                      color: Color(0xFFADB5BD),
                                                      thickness: 1,
                                                    ),
                                                    Text(
                                                      "search_ready_year".tr,
                                                      style: TextStyle(
                                                        color: Color(0xFF8C1D20),
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 12,
                                                        fontFamily: AppConstant.SF_PRO_FONT,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Icon(
                                                Icons.keyboard_arrow_down_rounded,
                                                color: Color(0xFF8C1D20),
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
                                ),
                              ],
                            ).paddingAll(20),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        margin: EdgeInsets.only(top: 20),
                        child: ExpandableTheme(
                          data: ExpandableThemeData(hasIcon: false),
                          child: ExpandablePanel(
                            controller: controller.ageIsExpanded,
                            collapsed: InkWell(
                              onTap: () {
                                controller.onChangeIsExpanded(2);
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "age".tr,
                                    style: TextStyle(
                                      color: Color(0xFF272B30),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      fontFamily: AppConstant.SF_PRO_FONT,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      !controller.isAgeFiltered.value
                                          ? "add_age".tr
                                          : '${controller.currentRangeValues.value.start.toStringAsFixed(0)}-${controller.currentRangeValues.value.end.toStringAsFixed(0)} years old',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xFF8C1D20),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        fontFamily: AppConstant.SF_PRO_FONT,
                                      ),
                                    ),
                                  ),
                                ],
                              ).paddingAll(20),
                            ),
                            expanded: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "search_age_header".tr,
                                  style: TextStyle(
                                    color: Color(0xFF8C1D20),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    fontFamily: AppConstant.CENTURY_GOTHIC_FONT,
                                  ),
                                ),
                                Container(
                                  height: 80,
                                  child: SliderTheme(
                                    data: SliderThemeData(
                                      trackHeight: 1,
                                      overlayShape: SliderComponentShape.noThumb,
                                    ),
                                    child: RangeSlider(
                                      values: controller.currentRangeValues.value,
                                      max: 80,
                                      min: 15,
                                      onChanged: controller.onChangeRangeAge,
                                      inactiveColor: Color(0xFFCED4DA),
                                      activeColor: Color(0xFF8C1D20),
                                    ),
                                  ).paddingOnly(left: 10, right: 10),
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
                                          color: Color(0xFF8C1D20),
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
                                              color: Color(0xFF8C1D20),
                                            ),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          disabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0xFF8C1D20),
                                            ),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8),
                                            borderSide: const BorderSide(
                                              color: Color(0xFF8C1D20),
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8),
                                            borderSide: const BorderSide(
                                              color: Color(0xFF8C1D20),
                                            ),
                                          ),
                                          suffix: Text(
                                            'search_age_year'.tr,
                                            style: TextStyle(
                                              color: Color(0xFF8C1D20),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: AppConstant.SF_PRO_FONT,
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
                                          color: Color(0xFF8C1D20),
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
                                              color: Color(0xFF8C1D20),
                                            ),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          disabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0xFF8C1D20),
                                            ),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8),
                                            borderSide: const BorderSide(
                                              color: Color(0xFF8C1D20),
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8),
                                            borderSide: const BorderSide(
                                              color: Color(0xFF8C1D20),
                                            ),
                                          ),
                                          suffix: Text(
                                            'search_age_year'.tr,
                                            style: TextStyle(
                                              color: Color(0xFF8C1D20),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: AppConstant.SF_PRO_FONT,
                                            ),
                                          ),
                                        ),
                                      ).marginOnly(left: 16),
                                    ),
                                  ],
                                ),
                              ],
                            ).paddingAll(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Color(0xFF820333),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: ButtonText(
                          onPressed: () {
                            Get.back();
                            controller.onClearSearch();
                          },
                          text: Text(
                            "clear_all".tr,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontFamily: AppConstant.SF_PRO_FONT,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ).marginOnly(right: 20),
                      ),
                      Expanded(
                        child: ButtonFill(
                          onPressed: () async {
                            if (controller.ageIsExpanded.value) {
                              await controller.onSubmitAgeStart(controller.inputAgeStart.text);
                              await controller.onSubmitAgeEnd(controller.inputAgeEnd.text);
                              await controller.onChangeRangeAge(controller.currentRangeValues.value);
                            }
                            controller.onSubmitSearch();
                          },
                          backgroundColor: Colors.white,
                          height: 48,
                          text: Text(
                            "${'search_title'.tr} (${controller.helpersCountSearch.value})",
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              fontFamily: AppConstant.SF_PRO_FONT,
                            ),
                          ),
                        ),
                      )
                    ],
                  ).paddingOnly(bottom: (Platform.isAndroid) ? 0 : 12),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
