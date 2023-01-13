import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maiden_employer/app/config/constants/app_constant.dart';
import 'package:maiden_employer/app/shared/widgets/buttons/button_fill.dart';
import 'package:maiden_employer/app/shared/widgets/buttons/button_text.dart';

import '../controllers/on_boarding_controller.dart';

class OnBoardingView extends GetView<OnBoardingController> {
  const OnBoardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            if (controller.currentPageIndex.value < controller.pages.length - 1)
              Align(
                alignment: Alignment.center,
                child: ButtonText(
                  onPressed: () {
                    controller.onPageJumped(controller.pages.length);
                  },
                  text: Text(
                    "skip".tr.toUpperCase(),
                    style: TextStyle(
                      color: Color(0xFF272B30),
                      fontFamily: AppConstant.SF_PRO_FONT,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ).paddingSymmetric(horizontal: 20)
          ],
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView.builder(
              controller: controller.controller,
              itemCount: controller.pages.length,
              itemBuilder: (BuildContext context, int index) {
                return controller.pages[index];
              },
              physics: controller.currentPageIndex.value < controller.pages.length - 1
                  ? null
                  : NeverScrollableScrollPhysics(),
              onPageChanged: controller.onPageChanged,
            ),
            if (controller.currentPageIndex.value < controller.pages.length - 1)
              Positioned(
                bottom: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: controller.pages.asMap().entries.map((entry) {
                    return Container(
                      width: 10,
                      height: 10,
                      margin: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 4.0,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.currentPageIndex.value == entry.key ? Color(0xFFE1464A) : Color(0xFFDEE2E6),
                      ),
                    );
                  }).toList(),
                ),
              )
            else
              Positioned(
                bottom: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonFill(
                      onPressed: controller.onGetStartedPressed,
                      width: Get.width * 0.85,
                      text: Text(
                        'get_started'.tr,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Colors.white,
                          fontFamily: AppConstant.SF_PRO_FONT,
                        ),
                      ),
                      backgroundColor: Color(0xFFE1464A),
                    ),
                    ButtonText(
                      onPressed: controller.onLoginPressed,
                      text: Text(
                        'new_password_created_log_in'.tr,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Color(0xFFE1464A),
                          fontFamily: AppConstant.SF_PRO_FONT,
                        ),
                      ),
                    ).marginOnly(top: 20),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
