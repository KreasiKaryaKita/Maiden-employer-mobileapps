import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:maiden_employer/app/config/constants/app_constant.dart';
import 'package:maiden_employer/app/shared/utils/my_helper.dart';
import 'package:maiden_employer/app/shared/widgets/buttons/button_text.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../controllers/validate_email_register_controller.dart';

class ValidateEmailRegisterView extends GetView<ValidateEmailRegisterController> {
  const ValidateEmailRegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'authentication'.tr.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: Color(0xFF212121),
            fontFamily: AppConstant.SF_PRO_FONT,
          ),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xFF373131),
            size: 24,
          ),
        ),
        elevation: 0,
      ),
      body: ListView(
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
            'verify_your_email'.tr,
            style: TextStyle(
              fontFamily: AppConstant.CENTURY_GOTHIC_FONT,
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: Color(0xFF333333),
            ),
          ).marginOnly(top: 10),
          Text(
            "${'verify_your_email_desc'.tr}\n${MyHelpers.encryptEmailText("afrizalsyahrul@gmail.com")}.",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xFF828282),
              fontFamily: AppConstant.SF_PRO_FONT,
            ),
          ).marginOnly(top: 10, bottom: 61),
          Text(
            'enter_otp_below'.tr,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12,
              fontFamily: AppConstant.SF_PRO_FONT,
              color: Color(0xFF333333),
            ),
          ).marginOnly(bottom: 8),
          PinCodeTextField(
            controller: controller.inputOTP,
            pinTheme: PinTheme(
              fieldWidth: 52,
              fieldHeight: 52,
              inactiveFillColor: const Color(0xFFFFFFFFF),
              inactiveColor: const Color(0xFFEBEBEB),
              activeFillColor: const Color(0xFFFFFFFFF),
              activeColor: const Color(0xFFB4B4B4),
              selectedFillColor: const Color(0xFFFFFFFFF),
              selectedColor: const Color(0xFFB4B4B4),
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(10),
              borderWidth: 1,
            ),
            length: 6,
            enableActiveFill: true,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          ).marginOnly(bottom: 53),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "otp_exp_1".tr,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xFF333333),
                    fontFamily: AppConstant.SF_PRO_FONT,
                  ),
                ),
                TextSpan(
                  text: " 3 ${'otp_exp_2'.tr}.",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Color(0xFF333333),
                    fontFamily: AppConstant.SF_PRO_FONT,
                  ),
                ),
              ],
            ),
          ).marginOnly(bottom: 10),
          Text(
            "${'otp_exp_3'.tr}?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              fontFamily: AppConstant.SF_PRO_FONT,
              color: Color(0xFF333333),
            ),
          ).marginOnly(bottom: 10),
          Center(
            child: ButtonText(
              onPressed: controller.startTimer,
              text: Text(
                "otp_exp_4".tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Color(0xFFE1464A),
                  fontFamily: AppConstant.SF_PRO_FONT,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
