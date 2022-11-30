import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:maiden_employer/app/config/constants/app_constant.dart';
import 'package:maiden_employer/app/config/themes/app_colors.dart';
import 'package:maiden_employer/app/shared/widgets/buttons/button_fill.dart';

import '../controllers/create_password_success_controller.dart';

class CreatePasswordSuccessView extends GetView<CreatePasswordSuccessController> {
  const CreatePasswordSuccessView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'success'.tr.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: Color(0xFF212121),
            fontFamily: AppConstant.SF_PRO_FONT,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: SvgPicture.asset(
              'assets/images/icon-close.svg',
            ),
          ),
        ],
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              children: [
                Center(
                  child: SvgPicture.asset(
                    'assets/images/ok.svg',
                  ),
                ).marginOnly(top: 42),
                Text(
                  "new_password_created".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFE1464A),
                    fontFamily: AppConstant.CENTURY_GOTHIC_FONT,
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ).marginOnly(top: 58),
                Text(
                  "new_password_created_desc".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontFamily: AppConstant.SF_PRO_FONT,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ).marginOnly(top: 10),
              ],
            ).paddingSymmetric(horizontal: 24),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  spreadRadius: 0.2,
                  color: Color(0xFFE0E0E0),
                ),
              ],
            ),
            child: ButtonFill(
              onPressed: controller.doLogin,
              backgroundColor: AppColors.primary_60,
              text: Text(
                'new_password_created_log_in'.tr,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ).paddingOnly(bottom: (Platform.isAndroid) ? 0 : 12),
          ),
        ],
      ),
    );
  }
}
