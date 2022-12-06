import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:maiden_employer/app/config/constants/app_constant.dart';
import 'package:maiden_employer/app/config/themes/app_colors.dart';
import 'package:maiden_employer/app/shared/widgets/buttons/button_fill.dart';
import 'package:maiden_employer/app/shared/widgets/buttons/button_text.dart';
import 'package:maiden_employer/app/shared/widgets/text_field/default_input_text_field.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'login'.tr.toUpperCase(),
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
                    '${'email'.tr}*',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      fontFamily: AppConstant.SF_PRO_FONT,
                      color: controller.validateEmail.value ? Color(0xFF333333) : Color(0xFFE1464A),
                    ),
                  ).marginOnly(top: 100, bottom: 8),
                  DefaultCustomErrorInputTextField(
                    controller: controller.inputEmail,
                    hintText: 'Eg. johndoe@gmail.com',
                    msgError: controller.msgEmail.value,
                    validate: controller.validateEmail.value,
                    obscureText: false,
                    suffixIcon: null,
                    keyboardType: TextInputType.emailAddress,
                    textCapitalization: TextCapitalization.none,
                    label: 'email'.tr,
                    maxLines: 1,
                    onChangeValue: controller.onValidationFormInput,
                    action: TextInputAction.done,
                    onSubmited: null,
                    prefixIcon: null,
                    radius: 8,
                  ).marginOnly(bottom: 24),
                  Text(
                    '${'password'.tr}*',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      fontFamily: AppConstant.SF_PRO_FONT,
                    ),
                  ).marginOnly(bottom: 8),
                  DefaultCustomErrorInputTextField(
                    controller: controller.inputPassword,
                    hintText: 'Eg. ********',
                    msgError: controller.msgPassword.value,
                    validate: controller.validatePassword.value,
                    obscureText: controller.obscurePasswordText.value,
                    suffixIcon: IconButton(
                      icon: Icon(
                        !controller.obscurePasswordText.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Color(0xFFBDBDBD),
                        size: 20,
                      ),
                      onPressed: controller.onChangeObscurePasswordText,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textCapitalization: TextCapitalization.none,
                    label: 'password'.tr,
                    maxLines: 1,
                    onChangeValue: controller.onValidationFormInput,
                    action: TextInputAction.done,
                    onSubmited: null,
                    prefixIcon: null,
                    radius: 8,
                  ).marginOnly(bottom: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ButtonText(
                        onPressed: controller.onGoToForgetPassword,
                        text: Text(
                          "${'login_forgot_password'.tr}?",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFFE1464A),
                            fontWeight: FontWeight.w700,
                            fontFamily: AppConstant.SF_PRO_FONT,
                          ),
                        ),
                      )
                    ],
                  ).marginOnly(bottom: 50),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Divider(
                  //         height: 1,
                  //         thickness: 1,
                  //         color: Color(0xFFE8E8E8),
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 12),
                  //       child: Text(
                  //         'or'.tr,
                  //         style: TextStyle(
                  //           fontWeight: FontWeight.w700,
                  //           fontSize: 12,
                  //           color: Color(0xFFB4B4B4),
                  //         ),
                  //       ),
                  //     ),
                  //     Expanded(
                  //       child: Divider(
                  //         height: 1,
                  //         thickness: 1,
                  //         color: Color(0xFFE8E8E8),
                  //       ),
                  //     ),
                  //   ],
                  // ).marginSymmetric(vertical: 20),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: ButtonOutline(
                  //         radius: 4,
                  //         backgroundColor: Color(0xFFE1464A),
                  //         onPressed: controller.onFacebookPressed,
                  //         text: Row(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             SvgPicture.asset('assets/images/icon-facebook.svg'),
                  //             SizedBox(width: 10),
                  //             Text(
                  //               'Facebook',
                  //               style: TextStyle(
                  //                 color: Color(0xFFE1464A),
                  //                 fontWeight: FontWeight.w400,
                  //                 fontSize: 12,
                  //               ),
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //     SizedBox(width: 20),
                  //     Expanded(
                  //       child: ButtonOutline(
                  //         radius: 4,
                  //         backgroundColor: Color(0xFFE1464A),
                  //         onPressed: controller.onGooglePressed,
                  //         text: Row(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             SvgPicture.asset('assets/images/icon-google.svg'),
                  //             SizedBox(width: 10),
                  //             Text(
                  //               'Google',
                  //               style: TextStyle(
                  //                 color: Color(0xFFE1464A),
                  //                 fontWeight: FontWeight.w400,
                  //                 fontSize: 12,
                  //               ),
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
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
      ),
    );
  }
}
