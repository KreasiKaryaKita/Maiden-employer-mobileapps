// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maiden_employer/app/config/constants/preference_constant.dart';
import 'package:maiden_employer/app/data/repository/api_repositories.dart';
import 'package:maiden_employer/app/models/response_resend_otp.dart';
import 'package:maiden_employer/app/models/response_validate_otp.dart';
import 'package:maiden_employer/app/routes/app_pages.dart';
import 'package:maiden_employer/app/shared/common/common_function.dart';
import 'package:maiden_employer/app/shared/utils/my_helper.dart';
import 'package:maiden_employer/app/shared/utils/preference_helper.dart';

class ValidateEmailForgotPasswordController extends GetxController {
  TextEditingController inputOTP = TextEditingController();
  RxString email = "".obs;

  @override
  void onInit() async {
    super.onInit();
    email.value = MyHelpers.encryptEmailText(await PreferenceHelper().get(key: PreferenceConstant.USER_EMAIL));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
  }

  onResendOtp() async {
    CommonFunction.loadingShow();
    ApiRepositories.resenOtp(
      email: await PreferenceHelper().get(key: PreferenceConstant.USER_EMAIL),
    ).then((value) async {
      CommonFunction.loadingHide();
      if (value is ResponseResendOtp) {
        CommonFunction.snackbarHelper(message: value.message, isSuccess: true);
        PreferenceHelper().set(
          key: PreferenceConstant.USER_EMAIL,
          value: value.data!.email.toString(),
        );
        email.value = MyHelpers.encryptEmailText(value.data?.email ?? "");
      } else {
        CommonFunction.snackbarHelper(message: value?.message ?? 'Failed', isSuccess: false);
      }
    }, onError: (e) {
      CommonFunction.loadingHide();
      CommonFunction.snackbarHelper(message: e.toString(), isSuccess: false);
    });
  }

  onCompleted(value) async {
    CommonFunction.loadingShow(message: "msg_loading_2");
    ApiRepositories.validateOtp(
      email: await PreferenceHelper().get(key: PreferenceConstant.USER_EMAIL),
      otp: value.toString(),
    ).then((value) async {
      CommonFunction.loadingHide();
      if (value is ResponseValidateOtp) {
        PreferenceHelper().set(
          key: PreferenceConstant.USER_EMAIL,
          value: value.data!.email.toString(),
        );
        Get.offNamed(Routes.CREATE_PASSWORD);
      } else {
        CommonFunction.snackbarHelper(message: value?.message ?? 'Failed', isSuccess: false);
      }
    }, onError: (e) {
      CommonFunction.loadingHide();
      CommonFunction.snackbarHelper(message: e.toString(), isSuccess: false);
    });
  }
}
