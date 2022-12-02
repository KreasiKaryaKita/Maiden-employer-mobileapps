import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:maiden_employer/app/config/constants/app_constant.dart';
import 'package:maiden_employer/app/config/themes/app_colors.dart';
import 'package:maiden_employer/app/shared/widgets/buttons/button_fill.dart';
import 'package:maiden_employer/app/shared/widgets/text_field/default_input_text_field.dart';

import '../controllers/register_step_one_controller.dart';

class RegisterStepOneView extends GetView<RegisterStepOneController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'get_started'.tr.toUpperCase(),
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
                    '${'step'.tr.toUpperCase()} 1 ${'of'.tr.toUpperCase()} 3',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Color(0xFF333333),
                      fontFamily: AppConstant.SF_PRO_FONT,
                    ),
                  ).marginOnly(top: 10),
                  Text(
                    'get_started'.tr,
                    style: TextStyle(
                      fontFamily: AppConstant.CENTURY_GOTHIC_FONT,
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Color(0xFF333333),
                    ),
                  ).marginOnly(top: 10),
                  Text(
                    'register_one_info'.tr,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xFF828282),
                      fontFamily: AppConstant.SF_PRO_FONT,
                    ),
                  ).marginOnly(top: 10, bottom: 24),
                  Text(
                    '${'email'.tr}*',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      fontFamily: AppConstant.SF_PRO_FONT,
                      color: controller.validateEmail.value ? Color(0xFF333333) : Color(0xFFE1464A),
                    ),
                  ).marginOnly(top: 10, bottom: 8),
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
                      color: Color(0xFF333333),
                    ),
                  ).marginOnly(bottom: 8),
                  DefaultCustomErrorInputTextField(
                    controller: controller.inputPassword,
                    hintText: 'Eg. ********',
                    msgError: "",
                    validate: true,
                    obscureText: controller.obscurePasswordText.value,
                    suffixIcon: IconButton(
                      icon: Icon(
                        !controller.obscurePasswordText.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Color(0xFFBDBDBD),
                        size: 20,
                      ),
                      onPressed: controller.onPassSecureChanged,
                    ),
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.none,
                    label: 'password'.tr,
                    maxLines: 1,
                    onChangeValue: controller.onValidationFormInput,
                    action: TextInputAction.done,
                    onSubmited: null,
                    prefixIcon: null,
                    radius: 8,
                  ).marginOnly(bottom: 15),
                  Text(
                    '${'password_validation_3'.tr} :',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      fontFamily: AppConstant.SF_PRO_FONT,
                      color: Color(0xFFB4B4B4),
                    ),
                  ).marginOnly(bottom: 4),
                  RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.check_rounded,
                            size: 12,
                            color: !controller.validatePasswordLength.value ? Color(0xFFB4B4B4) : Color(0xFF29823B),
                          ).marginOnly(right: 12),
                        ),
                        TextSpan(
                          text: "Min. ".tr,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: !controller.validatePasswordLength.value ? Color(0xFFB4B4B4) : Color(0xFF29823B),
                            fontFamily: AppConstant.SF_PRO_FONT,
                          ),
                        ),
                        TextSpan(
                          text: "password_validation_4".tr,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: !controller.validatePasswordLength.value ? Color(0xFFB4B4B4) : Color(0xFF29823B),
                            fontFamily: AppConstant.SF_PRO_FONT,
                          ),
                        ),
                      ],
                    ),
                  ).marginOnly(bottom: 4),
                  RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.check_rounded,
                            size: 12,
                            color: !controller.validatePasswordCaseChar.value ? Color(0xFFB4B4B4) : Color(0xFF29823B),
                          ).marginOnly(right: 12),
                        ),
                        TextSpan(
                          text: "${'password_validation_5.1'.tr} ",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: !controller.validatePasswordCaseChar.value ? Color(0xFFB4B4B4) : Color(0xFF29823B),
                            fontFamily: AppConstant.SF_PRO_FONT,
                          ),
                        ),
                        TextSpan(
                          text: "${'password_validation_5.2'.tr} ",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: !controller.validatePasswordCaseChar.value ? Color(0xFFB4B4B4) : Color(0xFF29823B),
                            fontFamily: AppConstant.SF_PRO_FONT,
                          ),
                        ),
                        TextSpan(
                          text: "${'password_validation_5.3'.tr} ",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: !controller.validatePasswordCaseChar.value ? Color(0xFFB4B4B4) : Color(0xFF29823B),
                            fontFamily: AppConstant.SF_PRO_FONT,
                          ),
                        ),
                        TextSpan(
                          text: "${'password_validation_5.4'.tr} ",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: !controller.validatePasswordCaseChar.value ? Color(0xFFB4B4B4) : Color(0xFF29823B),
                            fontFamily: AppConstant.SF_PRO_FONT,
                          ),
                        ),
                      ],
                    ),
                  ).marginOnly(bottom: 4),
                  RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.check_rounded,
                            size: 12,
                            color:
                                !controller.validatePasswordSpecialChar.value ? Color(0xFFB4B4B4) : Color(0xFF29823B),
                          ).marginOnly(right: 12),
                        ),
                        TextSpan(
                          text: "${'password_validation_6.1'.tr} ",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color:
                                !controller.validatePasswordSpecialChar.value ? Color(0xFFB4B4B4) : Color(0xFF29823B),
                            fontFamily: AppConstant.SF_PRO_FONT,
                          ),
                        ),
                        TextSpan(
                          text: "${'password_validation_6.2'.tr} ",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color:
                                !controller.validatePasswordSpecialChar.value ? Color(0xFFB4B4B4) : Color(0xFF29823B),
                            fontFamily: AppConstant.SF_PRO_FONT,
                          ),
                        ),
                        TextSpan(
                          text: "${'password_validation_6.3'.tr} ",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color:
                                !controller.validatePasswordSpecialChar.value ? Color(0xFFB4B4B4) : Color(0xFF29823B),
                            fontFamily: AppConstant.SF_PRO_FONT,
                          ),
                        ),
                        TextSpan(
                          text: "${'password_validation_6.4'.tr} ",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color:
                                !controller.validatePasswordSpecialChar.value ? Color(0xFFB4B4B4) : Color(0xFF29823B),
                            fontFamily: AppConstant.SF_PRO_FONT,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '${'conf_password'.tr}*',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      fontFamily: AppConstant.SF_PRO_FONT,
                      color: controller.validateConfPassword.value ? Color(0xFF333333) : Color(0xFFE1464A),
                    ),
                  ).marginOnly(bottom: 8, top: 24),
                  DefaultCustomErrorInputTextField(
                    controller: controller.inputConfPassword,
                    hintText: 'Eg. ********',
                    msgError: controller.msgConfPassword.value,
                    validate: controller.validateConfPassword.value,
                    obscureText: controller.obscureConfPasswordText.value,
                    suffixIcon: IconButton(
                      icon: Icon(
                        !controller.obscureConfPasswordText.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Color(0xFFBDBDBD),
                        size: 20,
                      ),
                      onPressed: controller.onConfirmPassSecureChanged,
                    ),
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.none,
                    label: 'conf_password'.tr,
                    maxLines: 1,
                    onChangeValue: controller.onValidationFormInput,
                    action: TextInputAction.done,
                    onSubmited: null,
                    prefixIcon: null,
                    radius: 8,
                  ).marginOnly(bottom: 24),
                  Transform.translate(
                    offset: Offset(-10, 0),
                    child: Row(
                      children: [
                        Checkbox(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          value: controller.isAgree.value,
                          onChanged: (value) => controller.onAgreeChanged(value!),
                        ),
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              text: 'i_agree'.tr,
                              children: [
                                TextSpan(
                                  text: 'terms_of_service'.tr,
                                  style: TextStyle(
                                    color: Color(0xFFE1464A),
                                  ),
                                ),
                                TextSpan(text: 'and_the'.tr),
                                TextSpan(
                                  text: 'privacy_policy'.tr,
                                  style: TextStyle(
                                    color: Color(0xFFE1464A),
                                  ),
                                ),
                              ],
                            ),
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(0xFF333333),
                            ),
                          ),
                        )
                      ],
                    ).marginOnly(top: 15, bottom: 22),
                  ),
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
                  // ),
                  // SizedBox(height: 20),
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
                  // SizedBox(height: 20),
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
                onPressed: !controller.isAgree.value ? null : controller.doContinue,
                backgroundColor: !controller.isAgree.value ? Color(0xFFB4B4B4) : AppColors.primary_60,
                text: Text(
                  'create_account'.tr,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ).paddingOnly(bottom: (Platform.isAndroid) ? 0 : 12),
            )
          ],
        ),
      ),
    );
  }
}
