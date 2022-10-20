import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:maiden_employer/app/config/constants/app_constant.dart';
import 'package:maiden_employer/app/config/themes/app_colors.dart';
import 'package:maiden_employer/app/shared/utils/validator_helper.dart';
import 'package:maiden_employer/app/shared/widgets/buttons/button_fill.dart';
import 'package:maiden_employer/app/shared/widgets/buttons/button_outline.dart';

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
        () => Form(
          key: controller.formKey,
          autovalidateMode: controller.isAutoValidate.value ? AutovalidateMode.always : AutovalidateMode.disabled,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 27),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${'step'.tr.toUpperCase()} 1 ${'of'.tr.toUpperCase()} 2',
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
                              ),
                            ).marginOnly(top: 10, bottom: 8),
                            TextFormField(
                              controller: controller.emailCt,
                              validator: (value) => ValidatorHelper.email(value!),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(horizontal: 9, vertical: 13),
                                hintText: 'Eg. johndoe@gmail.com',
                              ),
                            ),
                            Text(
                              '${'password'.tr}*',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                fontFamily: AppConstant.SF_PRO_FONT,
                              ),
                            ).marginOnly(top: 15, bottom: 8),
                            TextFormField(
                              controller: controller.passCt,
                              validator: (value) => ValidatorHelper.password(value!),
                              obscureText: controller.isPassSecure.value,
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(horizontal: 9, vertical: 13),
                                hintText: 'Eg. **********',
                                suffixIcon: IconButton(
                                  onPressed: controller.onPassSecureChanged,
                                  icon: SvgPicture.asset(
                                    controller.isPassSecure.value
                                        ? 'assets/images/icon-hide.svg'
                                        : 'assets/images/icon-eye.svg',
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              '${'confirm_password'.tr}*',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              ),
                            ).marginOnly(top: 15, bottom: 8),
                            TextFormField(
                              controller: controller.confirmPassCt,
                              validator: (value) => ValidatorHelper.passwordRepeat(value!, controller.passCt.text),
                              obscureText: controller.isPassConfirmSecure.value,
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(horizontal: 9, vertical: 13),
                                hintText: 'Eg. **********',
                                suffixIcon: IconButton(
                                  onPressed: controller.onConfirmPassSecureChanged,
                                  icon: SvgPicture.asset(
                                    controller.isPassConfirmSecure.value
                                        ? 'assets/images/icon-hide.svg'
                                        : 'assets/images/icon-eye.svg',
                                  ),
                                ),
                              ),
                            ),
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
                            Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    height: 1,
                                    thickness: 1,
                                    color: Color(0xFFE8E8E8),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  child: Text(
                                    'or'.tr,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                      color: Color(0xFFB4B4B4),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    height: 1,
                                    thickness: 1,
                                    color: Color(0xFFE8E8E8),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: ButtonOutline(
                                    radius: 4,
                                    backgroundColor: Color(0xFFE1464A),
                                    onPressed: controller.onFacebookPressed(),
                                    text: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset('assets/images/icon-facebook.svg'),
                                        SizedBox(width: 10),
                                        Text(
                                          'Facebook',
                                          style: TextStyle(
                                            color: Color(0xFFE1464A),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: ButtonOutline(
                                    radius: 4,
                                    backgroundColor: Color(0xFFE1464A),
                                    onPressed: controller.onGooglePressed(),
                                    text: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset('assets/images/icon-google.svg'),
                                        SizedBox(width: 10),
                                        Text(
                                          'Google',
                                          style: TextStyle(
                                            color: Color(0xFFE1464A),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
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
                  onPressed: !controller.isRegisterEnabled() ? null : controller.onRegisterStepOne,
                  backgroundColor: !controller.isRegisterEnabled() ? Color(0xFFB4B4B4) : AppColors.primary_60,
                  text: Text(
                    'continue'.tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
