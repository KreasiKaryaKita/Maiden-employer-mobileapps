// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maiden_employer/app/config/constants/preference_constant.dart';
import 'package:maiden_employer/app/routes/app_pages.dart';
import 'package:maiden_employer/app/shared/utils/preference_helper.dart';
import 'package:maiden_employer/app/shared/widgets/organism/intro_page.dart';

class OnBoardingController extends GetxController {
  final controller = PageController(initialPage: 0, keepPage: false);
  var pages = <IntroPage>[].obs;
  RxInt currentPageIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments == "") {
      pages.assignAll(
        [
          const IntroPage(
            "assets/images/onboarding1.svg",
            "on_boarding_1_title",
            "on_boarding_1_desc",
          ),
          const IntroPage(
            "assets/images/onboarding2.svg",
            "on_boarding_2_title",
            "on_boarding_2_desc",
          ),
          const IntroPage(
            "assets/images/onboarding3.svg",
            "on_boarding_3_title",
            "on_boarding_3_desc",
          )
        ],
      );
    } else {
      pages.assignAll(
        [
          const IntroPage(
            "assets/images/onboarding1.svg",
            "on_boarding_1_title",
            "on_boarding_1_desc",
          ),
        ],
      );
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onPageChanged(int p) {
    if (p == pages.length - 1) {
      PreferenceHelper().set(
        key: PreferenceConstant.USER_ON_BOARDING,
        value: "true",
      );
    }
    currentPageIndex.value = p;
  }

  onPageJumped(int p) {
    if (p == pages.length - 1) {
      PreferenceHelper().set(
        key: PreferenceConstant.USER_ON_BOARDING,
        value: "true",
      );
    }
    controller.animateToPage(p, curve: Curves.easeIn, duration: Duration(milliseconds: 500));
  }

  onGetStartedPressed() {
    Get.toNamed(Routes.REGISTER_STEP_ONE);
  }

  onLoginPressed() {
    Get.toNamed(Routes.LOGIN);
  }
}
