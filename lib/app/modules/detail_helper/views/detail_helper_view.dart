import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:maiden_employer/app/config/constants/app_constant.dart';
import 'package:maiden_employer/app/models/response_helper_detail.dart';
import 'package:maiden_employer/app/shared/widgets/bottom_sheet/detail_work_experience.dart';
import 'package:maiden_employer/app/shared/widgets/buttons/button_fill.dart';
import 'package:maiden_employer/app/shared/widgets/images/cached_network_image_widget.dart';
import 'package:maiden_employer/app/shared/widgets/loading/loading_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/detail_helper_controller.dart';

class DetailHelperView extends GetView<DetailHelperController> {
  const DetailHelperView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => Container(
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
            child: LoadingWidget(
              isLoading: controller.isLoading.value,
              data: controller.helperDetail.value.id,
              child: SmartRefresher(
                controller: controller.refreshCt,
                onRefresh: () {
                  controller.onRefresh();
                },
                child: NestedScrollView(
                  headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        expandedHeight: Get.width * 0.60,
                        pinned: true,
                        snap: false,
                        floating: true,
                        backgroundColor: Color(0xFF820333),
                        elevation: 0,
                        automaticallyImplyLeading: false,
                        leading: IconButton(
                          onPressed: () => Get.back(),
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        centerTitle: true,
                        flexibleSpace: LayoutBuilder(
                          builder: (BuildContext context, BoxConstraints constraints) {
                            controller.updateCount(constraints.biggest.height);
                            return FlexibleSpaceBar(
                              centerTitle: true,
                              titlePadding: EdgeInsets.zero,
                              title: SafeArea(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AnimatedOpacity(
                                      duration: Duration(milliseconds: 300),
                                      opacity:
                                          controller.count.value == MediaQuery.of(context).padding.top + kToolbarHeight
                                              ? 1.0
                                              : 0.0,
                                      child: Text(
                                        controller.helperDetail.value.fullName?.toUpperCase() ?? '',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: AppConstant.SF_PRO_FONT,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              background: Stack(
                                children: [
                                  CachedNetworkImageWidget(
                                    url: controller.helperDetail.value.photo != null &&
                                            controller.helperDetail.value.photo!.isNotEmpty
                                        ? 'https://api.maiden.yurekadev.com/${controller.helperDetail.value.photo}'
                                            .replaceAll('public/', 'helper/')
                                        : AppConstant.DEFAULT_AVATAR,
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    bottom: 20,
                                    left: 20,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(5)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.1),
                                            offset: Offset(4, 4),
                                            blurRadius: 4,
                                            spreadRadius: 0,
                                          ),
                                        ],
                                      ),
                                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SvgPicture.asset(
                                            controller.helperCountryImage(),
                                            height: 20,
                                          ),
                                          Text(
                                            controller.helperDetail.value.country ?? '',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color(0xFF272B30),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              fontFamily: AppConstant.SF_PRO_FONT,
                                            ),
                                          ).marginOnly(left: 10)
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ];
                  },
                  body: Column(
                    children: [
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.only(bottom: 20),
                          children: [
                            Text(
                              "${controller.helperDetail.value.fullName}, (${controller.helperDetail.value.age})",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 28,
                                fontFamily: AppConstant.SF_PRO_FONT,
                              ),
                            ).paddingSymmetric(horizontal: 20).marginOnly(top: 20),
                            Row(
                              children: [
                                if (controller.helperDetail.value.country?.toLowerCase().contains('singapore') ?? false)
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF017AAD),
                                      borderRadius: BorderRadius.all(Radius.circular(100)),
                                    ),
                                    margin: EdgeInsets.only(right: 10),
                                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                    child: Text(
                                      "${'in'.tr} Singapore",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        fontFamily: AppConstant.SF_PRO_FONT,
                                      ),
                                    ),
                                  ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF303D60),
                                    borderRadius: BorderRadius.all(Radius.circular(100)),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  child: Text(
                                    controller.helperDetail.value.availabilityInterviewedEmployer
                                                ?.firstWhere((e) => e.question == 'Not available for interview',
                                                    orElse: () => AvailabilityInterviewedEmployer(answer: false))
                                                .answer ==
                                            true
                                        ? "available".tr
                                        : "Not Available",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      fontFamily: AppConstant.SF_PRO_FONT,
                                    ),
                                  ),
                                ),
                              ],
                            ).paddingSymmetric(horizontal: 20).marginOnly(top: 20),
                            if (controller.helperDetail.value.description?.isNotEmpty ?? false)
                              Text(
                                controller.helperDetail.value.description ?? '',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  fontFamily: AppConstant.SF_PRO_FONT,
                                ),
                              ).paddingSymmetric(horizontal: 20).marginOnly(top: 16),
                            Divider(
                              thickness: 1,
                              height: 0,
                              color: Colors.white,
                            ).paddingSymmetric(horizontal: 20).marginOnly(top: 26, bottom: 26),
                            Text(
                              "ready_from_to".tr,
                              style: TextStyle(
                                color: Color(0xFFFBFBFB),
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                fontFamily: AppConstant.SF_PRO_FONT,
                              ),
                            ).paddingSymmetric(horizontal: 20).marginOnly(bottom: 20),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 59, vertical: 20),
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                controller.arguments['ready_from'] == null ||
                                        controller.arguments['ready_from'] is String &&
                                            controller.arguments['ready_from'].isEmpty
                                    ? '-'
                                    : DateFormat(
                                        'dd MMM yyyy',
                                        Get.locale.toString(),
                                      ).format(controller.arguments['ready_from']),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF8C1D20),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 28,
                                  fontFamily: AppConstant.SF_PRO_FONT,
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              height: 0,
                              color: Colors.white,
                            ).paddingSymmetric(horizontal: 20).marginOnly(top: 26, bottom: 26),
                            Text(
                              "language_skills".tr,
                              style: TextStyle(
                                color: Color(0xFFFBFBFB),
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                fontFamily: AppConstant.SF_PRO_FONT,
                              ),
                            ).paddingSymmetric(horizontal: 20).marginOnly(bottom: 20),
                            SizedBox(
                              height: 80,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.languageSkills.length,
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                itemBuilder: (context, index) {
                                  var item = controller.languageSkills[index];
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFAF4447),
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                    ),
                                    width: 150,
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                                    margin: const EdgeInsets.only(left: 8, right: 8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          item['label'],
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: AppConstant.SF_PRO_FONT,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12,
                                          ),
                                        ).marginOnly(bottom: 10),
                                        Text(
                                          item['value'],
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: AppConstant.SF_PRO_FONT,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              height: 0,
                              color: Colors.white,
                            ).paddingSymmetric(horizontal: 20).marginOnly(top: 26, bottom: 26),
                            Text(
                              "work_skills".tr,
                              style: TextStyle(
                                color: Color(0xFFFBFBFB),
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                fontFamily: AppConstant.SF_PRO_FONT,
                              ),
                            ).paddingSymmetric(horizontal: 20).marginOnly(bottom: 20),
                            SizedBox(
                              height: 110,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.workSkills.length,
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                itemBuilder: (context, index) {
                                  var item = controller.workSkills[index];
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFAF4447),
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                    ),
                                    width: 110,
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                    margin: const EdgeInsets.only(left: 8, right: 8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          item['icon'],
                                          height: 48,
                                          width: 48,
                                        ),
                                        Text(
                                          item['label'],
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: AppConstant.SF_PRO_FONT,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                          ),
                                          textAlign: TextAlign.center,
                                        ).marginOnly(top: 10),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              height: 0,
                              color: Colors.white,
                            ).paddingSymmetric(horizontal: 20).marginOnly(top: 26, bottom: 26),
                            Text(
                              "willing_able_to".tr,
                              style: TextStyle(
                                color: Color(0xFFFBFBFB),
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                fontFamily: AppConstant.SF_PRO_FONT,
                              ),
                            ).paddingSymmetric(horizontal: 20).marginOnly(bottom: 20),
                            SizedBox(
                              height: 110,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.willing.length,
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                itemBuilder: (context, index) {
                                  var item = controller.willing[index];
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFAF4447),
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                    ),
                                    width: 110,
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                    margin: const EdgeInsets.only(left: 8, right: 8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          item['icon'],
                                          height: 48,
                                          width: 48,
                                        ),
                                        Text(
                                          item['label'],
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: AppConstant.SF_PRO_FONT,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                          ),
                                          textAlign: TextAlign.center,
                                        ).marginOnly(top: 10),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              height: 0,
                              color: Colors.white,
                            ).paddingSymmetric(horizontal: 20).marginOnly(top: 26, bottom: 26),
                            Text(
                              "work_experience".tr,
                              style: TextStyle(
                                color: Color(0xFFFBFBFB),
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                fontFamily: AppConstant.SF_PRO_FONT,
                              ),
                            ).paddingSymmetric(horizontal: 20).marginOnly(bottom: 10),
                            ListView.builder(
                              itemCount: controller.workExperience.length,
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var item = controller.workExperience[index];
                                return InkWell(
                                  onTap: () {
                                    Get.bottomSheet(
                                      DetailWorkExperience(item: item),
                                      isScrollControlled: true,
                                      isDismissible: false,
                                      barrierColor: Color(0xFF272B30).withOpacity(0.8),
                                    );
                                  },
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${DateFormat("yyyy").format(DateTime.parse(item['from']))} - ${DateFormat("yyyy").format(DateTime.parse(item['to']))}',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: AppConstant.SF_PRO_FONT,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14,
                                              ),
                                            ),
                                            Text(
                                              item['country'],
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: Color(0xFFF39497),
                                                fontFamily: AppConstant.SF_PRO_FONT,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                              ),
                                            ).marginOnly(top: 4),
                                          ],
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Colors.white,
                                        size: 12,
                                      ),
                                    ],
                                  ).marginOnly(top: 10, bottom: 10),
                                );
                              },
                            ),
                            Divider(
                              thickness: 1,
                              height: 0,
                              color: Colors.white,
                            ).paddingSymmetric(horizontal: 20).marginOnly(top: 16, bottom: 26),
                            Text(
                              "vaccination_status".tr,
                              style: TextStyle(
                                color: Color(0xFFFBFBFB),
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                fontFamily: AppConstant.SF_PRO_FONT,
                              ),
                            ).paddingSymmetric(horizontal: 20).marginOnly(bottom: 10),
                            ListView.builder(
                              itemCount: controller.vaccination.length,
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var item = controller.vaccination[index];
                                return InkWell(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              item['step'],
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: AppConstant.SF_PRO_FONT,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14,
                                              ),
                                            ),
                                            Text(
                                              DateFormat(
                                                'dd MMMM yyyy',
                                                Get.locale.toString(),
                                              ).format(DateTime.parse(item['label'])),
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: Color(0xFFF39497),
                                                fontFamily: AppConstant.SF_PRO_FONT,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                              ),
                                            ).marginOnly(top: 4),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(4)),
                                          border: Border.all(color: Colors.white, width: 0.5),
                                        ),
                                        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                                        child: Text(
                                          item['type'],
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Color(0xFFFFFFFF),
                                            fontFamily: AppConstant.SF_PRO_FONT,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ).marginOnly(top: 10, bottom: 10),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                      Container(
                        color: Color(0xFF820333),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: controller.onDownloadPdfPressed,
                                child: Text(
                                  "download_pdf".tr,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontFamily: AppConstant.SF_PRO_FONT,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: ButtonFill(
                                onPressed: () {},
                                backgroundColor: Colors.white,
                                height: 48,
                                text: Text(
                                  'request_for_interview'.tr,
                                  style: TextStyle(
                                    color: Color(0xFFE1464A),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    fontFamily: AppConstant.SF_PRO_FONT,
                                  ),
                                ),
                              ).marginOnly(left: 20),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
