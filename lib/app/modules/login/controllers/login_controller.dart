// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maiden_employer/app/shared/utils/my_helper.dart';

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
        msgEmail.value = "login_input_email_validation_2".tr;
      } else {
        if (!MyHelpers.validateEmail(valueEmail)) {
          validateEmail.value = false;
          msgEmail.value = "login_input_email_validation".tr;
        } else {
          validateEmail.value = true;
          msgEmail.value = "";
        }
      }

      if (valuePassword.isEmpty) {
        validatePassword.value = false;
        msgPassword.value = "login_input_password_validation_2".tr;
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
    if (validation) {}
  }

  void onGoToSignup() {}

  void onGoToForgetPassword() {}

  void onFacebookPressed() {}

  void onGooglePressed() {}

  void onChangeObscurePasswordText() {
    obscurePasswordText.value = !obscurePasswordText.value;
  }
}
