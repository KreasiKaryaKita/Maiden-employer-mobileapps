import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:maiden_employer/app/config/constants/app_constant.dart';
import 'package:maiden_employer/app/models/entity/helpers_model.dart';
import 'package:maiden_employer/app/models/entity/option_country_helpers_model.dart';
import 'package:maiden_employer/app/routes/app_pages.dart';
import 'package:maiden_employer/app/shared/widgets/bottom_sheet/search_helper.dart';
import 'package:maiden_employer/app/shared/widgets/images/cached_network_image_widget.dart';

import '../controllers/helper_listing_controller.dart';

class HelperListingView extends GetView<HelperListingController> {
  const HelperListingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
        child: Obx(
          () => ListView(
            padding: const EdgeInsets.all(0),
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: SvgPicture.asset(
                      'assets/images/people.svg',
                      height: 130,
                    ),
                  ).paddingOnly(right: 20),
                  Text(
                    "header".tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: AppConstant.CENTURY_GOTHIC_FONT,
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ).paddingOnly(left: 20, right: 125, top: 20),
                ],
              ),
              InkWell(
                onTap: () {
                  Get.bottomSheet(
                    SearchHelper(),
                    isScrollControlled: true,
                    isDismissible: false,
                    barrierColor: Colors.transparent,
                  );
                },
                child: TextField(
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    fontFamily: AppConstant.SF_PRO_FONT,
                  ),
                  enabled: false,
                  textInputAction: TextInputAction.search,
                  textAlignVertical: TextAlignVertical.center,
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
                    hintText: "search".tr,
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
                ).marginOnly(right: 20, left: 20),
              ),
              SizedBox(
                height: 47,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.helpersCountry.length,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemBuilder: (context, index) {
                    OptionCountryHelpersModel item = controller.helpersCountry[index];
                    return InkWell(
                      onTap: () {
                        controller.onSelectCountryFilter(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: controller.helpersCountrySelected.value == item.value
                              ? Color(0xFFC9283E)
                              : Color(0xFFC37C7E),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        margin: const EdgeInsets.only(left: 8, right: 8),
                        child: Text(
                          item.label!,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: AppConstant.SF_PRO_FONT,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ).marginOnly(top: 20),
              GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: Get.width / 2,
                  childAspectRatio: 1 / 1.5,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: controller.helpers.length,
                itemBuilder: (BuildContext ctx, index) {
                  HelpersModel item = controller.helpers[index];
                  return InkWell(
                    onTap: () {
                      Get.toNamed(Routes.DETAIL_HELPER);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 150,
                              child: CachedNetworkImageWidget(
                                url: item.image ?? AppConstant.DEFAULT_AVATAR,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.name ?? "n/a",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Color(0xFF272B30),
                                          fontFamily: AppConstant.CENTURY_GOTHIC_FONT,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 13,
                                        ),
                                      ).marginOnly(bottom: 4),
                                      Text(
                                        "${item.age ?? "0"} ${'years_old'.tr}",
                                        style: TextStyle(
                                          color: Color(0xFF272B30),
                                          fontFamily: AppConstant.SF_PRO_FONT,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 11,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SvgPicture.asset(
                                  "assets/images/icon-country-${item.country}.svg",
                                  height: 20,
                                )
                              ],
                            ).paddingSymmetric(horizontal: 16, vertical: 10),
                            Divider(
                              thickness: 1,
                              height: 0,
                              color: Color(0xFFDEE2E6),
                            ).paddingSymmetric(horizontal: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "${item.experience ?? "0"} ${'years_experience'.tr}",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Color(0xFF272B30),
                                    fontFamily: AppConstant.SF_PRO_FONT,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13,
                                  ),
                                ).marginOnly(bottom: 6),
                                Row(
                                  children: [
                                    Text(
                                      'ready_from'.tr,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Color(0xFFADB5BD),
                                        fontFamily: AppConstant.SF_PRO_FONT,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        DateFormat('dd MMM yyyy', Get.locale.toString()).format(
                                          item.readyDate ?? DateTime.now(),
                                        ),
                                        textAlign: TextAlign.right,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Color(0xFFADB5BD),
                                          fontFamily: AppConstant.SF_PRO_FONT,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 11,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ).paddingSymmetric(horizontal: 16, vertical: 10),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
