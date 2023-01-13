// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:maiden_employer/app/config/constants/preference_constant.dart';
import 'package:maiden_employer/app/modules/helper_listing/controllers/helper_listing_controller.dart';
import 'package:maiden_employer/app/modules/helper_listing/views/helper_listing_view.dart';
import 'package:maiden_employer/app/routes/app_pages.dart';
import 'package:maiden_employer/app/shared/utils/preference_helper.dart';

class MainController extends GetxController {
  RxInt currentTab = 0.obs;
  Rx<Widget> tabPage = Container(child: HelperListingView()).obs;

  DateTime? currentBackPressTime;

  @override
  void onInit() {
    super.onInit();
  }

  Future<bool> onWillPop() async {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null || now.difference(currentBackPressTime!) > const Duration(milliseconds: 1500)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: "alert_back".tr,
        backgroundColor: Colors.grey.shade800.withOpacity(0.9),
      );
      return false;
    }
    return true;
  }

  logout() async {
    ///debug
    PreferenceHelper().delete(PreferenceConstant.USER_TOKEN);
    PreferenceHelper().delete(PreferenceConstant.USER_ID);
    PreferenceHelper().delete(PreferenceConstant.USER_EMAIL);
    PreferenceHelper().delete(PreferenceConstant.USER_TYPE);
    PreferenceHelper().delete(PreferenceConstant.USER_TYPE_LABEL);

    Get.offAllNamed(
      Routes.ON_BOARDING,
      arguments: await PreferenceHelper().get(key: PreferenceConstant.USER_ON_BOARDING),
    );
  }

  onChangeTab(int tab) {
    currentTab.value = tab;
    switch (tab) {
      case 0:
        Get.find<HelperListingController>().onInit();
        tabPage.value = Container(child: HelperListingView());
        break;

      default:
        logout();
        tabPage.value = Container(child: HelperListingView());
    }
  }
}
