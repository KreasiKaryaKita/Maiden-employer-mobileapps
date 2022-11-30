import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        body: WillPopScope(
          onWillPop: controller.onWillPop,
          child: PageStorage(
            bucket: PageStorageBucket(),
            child: controller.tabPage.value,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 65,
            decoration: BoxDecoration(
              color: Color(0xFF820333),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(0, -10),
                  blurRadius: 30,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      controller.onChangeTab(0);
                    },
                    child: SvgPicture.asset(
                      "assets/images/icon-helper-list.svg",
                      color: controller.currentTab.value == 0 ? Colors.white : Color(0xFFC79697),
                      height: 24,
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      controller.onChangeTab(1);
                    },
                    child: SvgPicture.asset(
                      "assets/images/icon-profile.svg",
                      color: controller.currentTab.value == 1 ? Colors.white : Color(0xFFC79697),
                      height: 24,
                    ),
                  ),
                ),
              ],
            ).paddingSymmetric(vertical: 8),
          ),
        ),
      ),
    );
  }
}
