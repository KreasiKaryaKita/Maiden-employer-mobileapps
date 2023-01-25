import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:maiden_employer/app/config/constants/app_constant.dart';
import 'package:maiden_employer/app/modules/detail_helper/controllers/detail_helper_controller.dart';

class DetailWorkExperience extends StatelessWidget {
  DetailWorkExperience({super.key, required this.item});

  final controller = Get.find<DetailHelperController>();
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.9,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF820333),
            const Color(0xFF540032),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 3,
              width: 68,
              margin: EdgeInsets.only(top: 15, bottom: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.transparent,
                  size: 24,
                ),
              ),
              Expanded(
                child: Text(
                  '${DateFormat("yyyy").format(DateTime.parse(item['from']))} - ${DateFormat("yyyy").format(DateTime.parse(item['to']))} ${item['country'].toString().toUpperCase()}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFBFBFB),
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                    fontFamily: AppConstant.CENTURY_GOTHIC_FONT,
                  ),
                ),
              ),
              IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.close_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              )
            ],
          ).paddingSymmetric(horizontal: 12).marginOnly(bottom: 24),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                Text(
                  "work_information".tr,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: AppConstant.SF_PRO_FONT,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ).marginOnly(bottom: 20),
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/images/team.svg",
                      height: 24,
                      width: 24,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "no_of_pax_in_household".tr,
                            style: TextStyle(
                              color: Color(0xFFFBFBFB),
                              fontFamily: AppConstant.SF_PRO_FONT,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ).marginOnly(bottom: 5),
                          Text(
                            item['no_of_pax'],
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color(0xFFFBFBFB),
                              fontFamily: AppConstant.SF_PRO_FONT,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ).marginOnly(left: 16),
                    ),
                  ],
                ).marginOnly(bottom: 20),
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/images/home.svg",
                      height: 24,
                      width: 24,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "house_type".tr,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color(0xFFFBFBFB),
                              fontFamily: AppConstant.SF_PRO_FONT,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ).marginOnly(bottom: 5),
                          Text(
                            item['house_type'],
                            style: TextStyle(
                              color: Color(0xFFFBFBFB),
                              fontFamily: AppConstant.SF_PRO_FONT,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ).marginOnly(left: 16),
                    ),
                  ],
                ).marginOnly(bottom: 20),
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/images/Activity-History.svg",
                      height: 24,
                      width: 24,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "reason_for_termination".tr,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color(0xFFFBFBFB),
                              fontFamily: AppConstant.SF_PRO_FONT,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ).marginOnly(bottom: 5),
                          Text(
                            item['reason_termination'],
                            style: TextStyle(
                              color: Color(0xFFFBFBFB),
                              fontFamily: AppConstant.SF_PRO_FONT,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ).marginOnly(left: 16),
                    ),
                  ],
                ).marginOnly(bottom: 20),
                // Row(
                //   children: [
                //     SvgPicture.asset(
                //       "assets/images/Handshake.svg",
                //       height: 24,
                //       width: 24,
                //     ),
                //     Expanded(
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         children: [
                //           Text(
                //             "employer_feedback".tr,
                //             overflow: TextOverflow.ellipsis,
                //             style: TextStyle(
                //               color: Color(0xFFFBFBFB),
                //               fontFamily: AppConstant.SF_PRO_FONT,
                //               fontWeight: FontWeight.w400,
                //               fontSize: 12,
                //             ),
                //           ).marginOnly(bottom: 5),
                //           Text(
                //             "Good and Pleasant worker.",
                //             style: TextStyle(
                //               color: Color(0xFFFBFBFB),
                //               fontFamily: AppConstant.SF_PRO_FONT,
                //               fontWeight: FontWeight.w700,
                //               fontSize: 15,
                //             ),
                //           ),
                //         ],
                //       ).marginOnly(left: 16),
                //     ),
                //   ],
                // ).marginOnly(bottom: 20),
                Divider(
                  height: 0,
                  thickness: 1,
                  color: Colors.white,
                ).marginOnly(bottom: 20),
                Text(
                  "work_duties".tr,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: AppConstant.SF_PRO_FONT,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ).marginOnly(bottom: 20),
                GridView.builder(
                  padding: const EdgeInsets.only(bottom: 20),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: Get.width / 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: item['work_duties'].length,
                  itemBuilder: (BuildContext ctx, index) {
                    var tempItem = item['work_duties'][index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFAF4447),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            tempItem['icon'],
                            height: 48,
                            width: 48,
                          ),
                          Text(
                            tempItem['label'],
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: AppConstant.SF_PRO_FONT,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ).marginOnly(top: 10),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ).paddingOnly(bottom: (Platform.isAndroid) ? 0 : 20),
    );
  }
}
