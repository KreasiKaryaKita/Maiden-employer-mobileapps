import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:maiden_employer/app/config/constants/app_constant.dart';
import 'package:maiden_employer/app/config/themes/app_colors.dart';
import 'package:maiden_employer/app/shared/widgets/buttons/button_fill.dart';
import 'package:maiden_employer/app/shared/widgets/buttons/button_text.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../controllers/validate_email_forgot_password_controller.dart';

class ValidateEmailForgotPasswordView extends GetView<ValidateEmailForgotPasswordController> {
  const ValidateEmailForgotPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'forgot_password_desc_5'.tr.toUpperCase(),
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
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  Text(
                    '${'step'.tr.toUpperCase()} 2 ${'of'.tr.toUpperCase()} 3',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Color(0xFF333333),
                      fontFamily: AppConstant.SF_PRO_FONT,
                    ),
                  ).marginOnly(top: 10),
                  Text(
                    'forgot_password_desc_6'.tr,
                    style: TextStyle(
                      fontFamily: AppConstant.CENTURY_GOTHIC_FONT,
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Color(0xFF333333),
                    ),
                  ).marginOnly(top: 10),
                  Text(
                    'forgot_password_desc_7'.tr,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xFF828282),
                      fontFamily: AppConstant.SF_PRO_FONT,
                    ),
                  ).marginOnly(top: 10, bottom: 32),
                  PinCodeTextField(
                    controller: controller.inputOTP,
                    pinTheme: PinTheme(
                      fieldWidth: 48,
                      fieldHeight: 61,
                      inactiveFillColor: const Color(0xFFFFFFFFF),
                      inactiveColor: const Color(0xFFEBEBEB),
                      activeFillColor: const Color(0xFFFFFFFFF),
                      activeColor: const Color(0xFFEBEBEB),
                      selectedFillColor: const Color(0xFFFFFFFFF),
                      selectedColor: const Color(0xFFEBEBEB),
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      borderWidth: 1,
                    ),
                    length: 6,
                    enableActiveFill: true,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    obscureText: false,
                    autoFocus: true,
                    animationType: AnimationType.fade,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                    cursorColor: const Color(0xFF333333),
                    textStyle: const TextStyle(
                      color: Color(0xFF333333),
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      fontFamily: AppConstant.SF_PRO_FONT,
                    ),
                    animationDuration: const Duration(
                      milliseconds: 300,
                    ),
                    onChanged: (value) {},
                    appContext: context,
                  ).marginOnly(bottom: 24),
                  if (controller.start.value > 0)
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xFF828282),
                          fontFamily: AppConstant.SF_PRO_FONT,
                        ),
                        children: [
                          TextSpan(
                            text: "verification_resend".tr,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(0xFF828282),
                              fontFamily: AppConstant.SF_PRO_FONT,
                            ),
                          ),
                          TextSpan(
                            text: " 00:${controller.start.toString().padLeft(2, '0')} ",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(0xFF828282),
                              fontFamily: AppConstant.SF_PRO_FONT,
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (controller.start.value == 0)
                    Center(
                      child: ButtonText(
                        onPressed: controller.startTimer,
                        text: Text(
                          "verification_resend_code".tr,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color(0xFF828282),
                            fontFamily: AppConstant.SF_PRO_FONT,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
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
                onPressed: () {},
                backgroundColor: AppColors.primary_60,
                text: Text(
                  'continue'.tr,
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
      ),
    );
  }
}
