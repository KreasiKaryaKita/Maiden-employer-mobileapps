// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:maiden_employer/app/config/constants/preference_constant.dart';
import 'package:maiden_employer/app/data/repository/api_repositories.dart';
import 'package:maiden_employer/app/models/response_login.dart';
import 'package:maiden_employer/app/routes/app_pages.dart';
import 'package:maiden_employer/app/shared/common/common_function.dart';
import 'package:maiden_employer/app/shared/utils/my_helper.dart';
import 'package:maiden_employer/app/shared/utils/preference_helper.dart';

class LoginController extends GetxController {
  RxBool isValidateFirst = false.obs;

  TextEditingController inputEmail = TextEditingController();
  RxBool validateEmail = true.obs;
  RxString msgEmail = "".obs;

  TextEditingController inputPassword = TextEditingController();
  RxBool validatePassword = true.obs, obscurePasswordText = true.obs;
  RxString msgPassword = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onValidationFormInput(String? val) {
    if (isValidateFirst.value) {
      String valueEmail = inputEmail.text.toString().trim();
      String valuePassword = inputPassword.text.toString().trim();

      if (valueEmail.isEmpty) {
        validateEmail.value = false;
        msgEmail.value = "email_validation_2".tr;
      } else {
        if (!MyHelpers.validateEmail(valueEmail)) {
          validateEmail.value = false;
          msgEmail.value = "email_validation".tr;
        } else {
          validateEmail.value = true;
          msgEmail.value = "";
        }
      }

      if (valuePassword.isEmpty) {
        validatePassword.value = false;
        msgPassword.value = "password_validation_2".tr;
      } else {
        validatePassword.value = true;
        msgPassword.value = "";
      }
    }

    return validateEmail.value && validatePassword.value;
  }

  Future doLogin() async {
    isValidateFirst.value = true;
    bool validation = onValidationFormInput(null);
    if (validation) {
      CommonFunction.loadingShow();
      ApiRepositories.login(
        username: inputEmail.text.toString().trim(),
        password: inputPassword.text.toString().trim(),
      ).then((value) async {
        CommonFunction.loadingHide();
        if (value is ResponseLogin) {
          PreferenceHelper().set(
            key: PreferenceConstant.USER_EMAIL,
            value: value.data!.email.toString(),
          );
          if (value.error == 200) {
            Get.offAllNamed(Routes.MAIN);
            PreferenceHelper().set(
              key: PreferenceConstant.USER_TOKEN,
              value: value.data!.token ?? "",
            );
            PreferenceHelper().set(
              key: PreferenceConstant.USER_ID,
              value: value.data!.userId.toString(),
            );
            PreferenceHelper().set(
              key: PreferenceConstant.USER_FIRST_NAME,
              value: value.data!.firstName.toString(),
            );
            PreferenceHelper().set(
              key: PreferenceConstant.USER_LAST_NAME,
              value: value.data!.lastName.toString(),
            );
            if (value.data!.birthDate != null) {
              PreferenceHelper().set(
                key: PreferenceConstant.USER_BIRTH_DATE,
                value: DateFormat(
                  'dd-MM-yyyy',
                  Get.locale.toString(),
                ).format(value.data!.birthDate!).toString(),
              );
            }
            PreferenceHelper().set(
              key: PreferenceConstant.USER_TYPE,
              value: value.data!.userType.toString(),
            );
            PreferenceHelper().set(
              key: PreferenceConstant.USER_TYPE_LABEL,
              value: value.data!.userTypeLabel.toString(),
            );
          } else {
            Get.dialog(
              CommonFunction.loginCompleteSignUp(code: value.error ?? 0),
            );
          }
        } else {
          CommonFunction.snackbarHelper(message: value!.message!, isSuccess: false);
        }
      }, onError: (e) {
        CommonFunction.loadingHide();
        CommonFunction.snackbarHelper(message: e.toString(), isSuccess: false);
      });
    }
  }

  void onGoToSignup() {}

  void onGoToForgetPassword() {
    Get.toNamed(Routes.FORGOT_PASSWORD);
  }

  void onFacebookPressed() {}

  void onGooglePressed() {}

  void onChangeObscurePasswordText() {
    obscurePasswordText.value = !obscurePasswordText.value;
  }
}
