import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:maiden_employer/app/config/constants/app_constant.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Stack(
          children: [
            Scaffold(
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
            if (controller.showSearchPage.value)
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
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
                  child: SafeArea(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: controller.onChangeShowSearchPage,
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
                        ).marginOnly(top: 20),
                      ],
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
