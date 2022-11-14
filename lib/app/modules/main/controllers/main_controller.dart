// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:maiden_employer/app/modules/helper_listing/views/helper_listing_view.dart';

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

  onChangeTab(int tab) {
    currentTab.value = tab;
    switch (tab) {
      case 0:
        tabPage.value = Container(child: HelperListingView());
        break;

      default:
        tabPage.value = Container(child: HelperListingView());
    }
  }
}
