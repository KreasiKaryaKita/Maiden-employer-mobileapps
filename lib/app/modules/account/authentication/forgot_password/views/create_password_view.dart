import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                    ),
                  ).marginOnly(bottom: 8, top: 10),
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
                  ).marginOnly(bottom: 24),
                  Text(
                    '${'conf_new_password'.tr}*',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      fontFamily: AppConstant.SF_PRO_FONT,
                    ),
                  ).marginOnly(bottom: 8),
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
                  'submit'.tr,
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
