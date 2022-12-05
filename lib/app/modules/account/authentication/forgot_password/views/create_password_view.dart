import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maiden_employer/app/config/constants/app_constant.dart';
import 'package:maiden_employer/app/config/themes/app_colors.dart';
import 'package:maiden_employer/app/shared/widgets/buttons/button_fill.dart';
import 'package:maiden_employer/app/shared/widgets/text_field/default_input_text_field.dart';

import '../controllers/create_password_controller.dart';

class CreatePasswordView extends GetView<CreatePasswordController> {
  const CreatePasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'forgot_password_desc_3'.tr.toUpperCase(),
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
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  Text(
                    '${'step'.tr.toUpperCase()} 3 ${'of'.tr.toUpperCase()} 3',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Color(0xFF333333),
                      fontFamily: AppConstant.SF_PRO_FONT,
                    ),
                  ).marginOnly(top: 10),
                  Text(
                    'forgot_password_desc_3'.tr,
                    style: TextStyle(
                      fontFamily: AppConstant.CENTURY_GOTHIC_FONT,
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Color(0xFF333333),
                    ),
                  ).marginOnly(top: 10),
                  Text(
                    'forgot_password_desc_4'.tr,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xFF828282),
                      fontFamily: AppConstant.SF_PRO_FONT,
                    ),
                  ).marginOnly(top: 10, bottom: 24),
                  Text(
                    '${'new_password'.tr}*',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      fontFamily: AppConstant.SF_PRO_FONT,
                      color: Color(0xFF333333),
                    ),
                  ).marginOnly(bottom: 8, top: 10),
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
                    label: 'new_password'.tr,
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
                    '${'conf_new_password'.tr}*',
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
                    label: 'conf_new_password'.tr,
                    maxLines: 1,
                    onChangeValue: controller.onValidationFormInput,
                    action: TextInputAction.done,
                    onSubmited: null,
                    prefixIcon: null,
                    radius: 8,
                  ).marginOnly(bottom: 24),
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
                onPressed: controller.doCreatePassword,
                backgroundColor: AppColors.primary_60,
                text: Text(
                  'change_password'.tr,
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
