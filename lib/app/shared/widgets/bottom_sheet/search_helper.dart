import 'dart:ui';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:maiden_employer/app/config/constants/app_constant.dart';
import 'package:maiden_employer/app/modules/account/authentication/register/models/option_month.dart';
import 'package:maiden_employer/app/modules/account/authentication/register/models/option_year.dart';
import 'package:maiden_employer/app/modules/helper_listing/controllers/helper_listing_controller.dart';
import 'package:maiden_employer/app/shared/widgets/buttons/button_fill.dart';

class SearchHelper extends StatelessWidget {
  SearchHelper({Key? key}) : super(key: key);

  final HelperListingController controller = Get.find<HelperListingController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            height: Get.height,
            margin: EdgeInsets.only(top: 24),
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
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "search_title".tr.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: AppConstant.SF_PRO_FONT,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.close_rounded,
                        color: Colors.transparent,
                        size: 24,
                      ),
                    ),
                  ],
                ).marginOnly(top: 8, bottom: 8),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.all(20),
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                                    child: Text(
                                      "add_helper_skills".tr,
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
                                  "search_skill_header".tr,
                                  style: TextStyle(
                                    color: Color(0xFF8C1D20),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    fontFamily: AppConstant.CENTURY_GOTHIC_FONT,
                                  ),
                                ).marginOnly(bottom: 20),
                                TypeAheadField(
                                  suggestionsBoxDecoration: SuggestionsBoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  animationStart: 0,
                                  textFieldConfiguration: TextFieldConfiguration(
                                    autofocus: false,
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
                                    return [];
                                  },
                                  itemBuilder: (context, suggestion) {
                                    return ListTile(
                                      leading: Icon(Icons.shopping_cart),
                                      title: Text(""),
                                    );
                                  },
                                  onSuggestionSelected: (suggestion) {},
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
                                      "add_ready_from".tr,
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
                                        onSelected: controller.selectedMonth,
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
                                        onSelected: controller.selectedYear,
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
                                      "add_age".tr,
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
                                      max: 50,
                                      min: 21,
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
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 9, vertical: 12),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Color(0xFF8C1D20),
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      child: RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: "${controller.currentRangeValues.value.start.round()} ",
                                              style: const TextStyle(
                                                color: Color(0xFF8C1D20),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            TextSpan(
                                              text: 'search_age_year'.tr,
                                              style: const TextStyle(
                                                color: Color(0xFF8C1D20),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 9, vertical: 12),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Color(0xFF8C1D20),
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      child: RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: "${controller.currentRangeValues.value.end.round()} ",
                                              style: const TextStyle(
                                                color: Color(0xFF8C1D20),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            TextSpan(
                                              text: 'search_age_year'.tr,
                                              style: const TextStyle(
                                                color: Color(0xFF8C1D20),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
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
                        child: Text(
                          "clear_all".tr,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontFamily: AppConstant.SF_PRO_FONT,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ).marginOnly(right: 20),
                      ),
                      Expanded(
                        child: ButtonFill(
                          onPressed: () {},
                          backgroundColor: Colors.white,
                          height: 48,
                          text: Text(
                            "${'search_title'.tr} (300)",
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
