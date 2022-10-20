import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:maiden_employer/app/config/themes/app_colors.dart';
import 'package:maiden_employer/app/shared/widgets/buttons/button_fill.dart';
import 'package:maiden_employer/app/shared/widgets/buttons/button_text.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFFE1464A), Color(0xFF8C1D20)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: controller.isShownOnboarding.value
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/logo.png', width: 155, height: 45),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(35, 30, 35, 30),
                            child: ButtonFill(
                              onPressed: controller.onGetStartedPressed,
                              text: Text('get_started'.tr,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700, fontSize: 16, color: AppColors.primary_60)),
                              backgroundColor: Colors.white,
                            ),
                          ),
                          ButtonText(
                              onPressed: controller.onLoginPressed,
                              text: Text('login'.tr,
                                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Colors.white))),
                        ],
                      ),
                    ],
                  )
                : Center(child: Image.asset('assets/images/logo.png', width: 155, height: 45)),
          )),
    );
  }
}
