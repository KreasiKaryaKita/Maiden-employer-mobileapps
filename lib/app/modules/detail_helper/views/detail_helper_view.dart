import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:maiden_employer/app/config/constants/app_constant.dart';
import 'package:maiden_employer/app/shared/widgets/buttons/button_fill.dart';
import 'package:maiden_employer/app/shared/widgets/images/cached_network_image_widget.dart';

import '../controllers/detail_helper_controller.dart';

class DetailHelperView extends GetView<DetailHelperController> {
  const DetailHelperView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      printInfo(info: (MediaQuery.of(context).padding.top + kToolbarHeight).toString());
                      return FlexibleSpaceBar(
                        centerTitle: true,
                        titlePadding: EdgeInsets.zero,
                        title: SafeArea(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AnimatedOpacity(
                                duration: Duration(milliseconds: 300),
                                opacity: controller.count.value == MediaQuery.of(context).padding.top + kToolbarHeight
                                    ? 1.0
                                    : 0.0,
                                child: Text(
                                  "Susilawati Riandy".toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        background: Stack(
                          children: [
                            CachedNetworkImageWidget(
                              url: AppConstant.DEFAULT_AVATAR,
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
                                      "assets/images/icon-country-indonesia.svg",
                                      height: 20,
                                    ),
                                    Text(
                                      "Indonesia",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF272B30),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
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
                        "Susilawati Riandy, 28",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 28,
                        ),
                      ).paddingSymmetric(horizontal: 20).marginOnly(top: 20),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF017AAD),
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            child: Text(
                              "${'in'.tr} Singapore",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF303D60),
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            margin: EdgeInsets.only(left: 10),
                            child: Text(
                              "available".tr,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 20).marginOnly(top: 20),
                      Text(
                        "She is very experienced with children. She has 2 children of her own and has taken care of 4 children by herself when working in Malaysia. She can cook chinese and Indonesian food. She was with her last employer for 3 years and finished her contract. She is willing to learn new skills, to take care of pets or elderly. She will work hard for your family and do her best.",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
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
                          "25 Oct 2022",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF8C1D20),
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
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
                          fontSize: 16,
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
                                      fontSize: 14,
                                    ),
                                  ).marginOnly(bottom: 10),
                                  RatingBar(
                                    initialRating: item['rating'],
                                    direction: Axis.horizontal,
                                    itemCount: 5,
                                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                    ratingWidget: RatingWidget(
                                      full: Icon(
                                        Icons.star_rounded,
                                        size: 10,
                                        color: Color(0xFFF8BC4C),
                                      ),
                                      half: Icon(
                                        Icons.star_half_rounded,
                                        size: 10,
                                        color: Color(0xFFF8BC4C),
                                      ),
                                      empty: Icon(
                                        Icons.star_rounded,
                                        size: 10,
                                        color: Color(0xFFFFFFFF),
                                      ),
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                    ignoreGestures: true,
                                    itemSize: 20,
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
                          fontSize: 16,
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
                                      fontSize: 14,
                                    ),
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
                          fontSize: 16,
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
                                      fontSize: 14,
                                    ),
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
                          fontSize: 16,
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
                                Container(
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
                                              "${item['year']} ${item['label'].toString().toUpperCase()}",
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
                                                        "5",
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
                                                        "4 Room HDB",
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
                                                        "-",
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
                                                  "assets/images/Handshake.svg",
                                                  height: 24,
                                                  width: 24,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "employer_feedback".tr,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                          color: Color(0xFFFBFBFB),
                                                          fontFamily: AppConstant.SF_PRO_FONT,
                                                          fontWeight: FontWeight.w400,
                                                          fontSize: 12,
                                                        ),
                                                      ).marginOnly(bottom: 5),
                                                      Text(
                                                        "Good and Pleasant worker.",
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
                                              itemCount: controller.workDuties.length,
                                              itemBuilder: (BuildContext ctx, index) {
                                                var item = controller.workDuties[index];
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
                                                          fontSize: 14,
                                                        ),
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
                                  ),
                                ),
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
                                        item['year'],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: AppConstant.SF_PRO_FONT,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        item['label'],
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
                          fontSize: 16,
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
                                        item['label'],
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
                    children: [
                      Text(
                        "download_pdf".tr,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontFamily: AppConstant.SF_PRO_FONT,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ).marginOnly(right: 20),
                      Expanded(
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