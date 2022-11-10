// ignore_for_file: unnecessary_overrides

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:maiden_employer/app/routes/app_pages.dart';
import 'package:maiden_employer/app/shared/utils/my_helper.dart';

class RegisterStepOneController extends GetxController {
  RxBool isAgree = false.obs;
  RxBool isValidateFirst = false.obs;

  TextEditingController inputEmail = TextEditingController();
  RxBool validateEmail = true.obs;
  RxString msgEmail = "".obs;

  TextEditingController inputPassword = TextEditingController();
  RxBool validatePassword = true.obs, obscurePasswordText = true.obs;
  RxString msgPassword = "".obs;

  TextEditingController inputConfPassword = TextEditingController();
  RxBool validateConfPassword = true.obs, obscureConfPasswordText = true.obs;
  RxString msgConfPassword = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  onPassSecureChanged() {
    obscurePasswordText.value = !obscurePasswordText.value;
  }

  onConfirmPassSecureChanged() {
    obscureConfPasswordText.value = !obscureConfPasswordText.value;
  }

  onAgreeChanged(bool value) {
    isAgree.value = !isAgree.value;
  }

  onFacebookPressed() {}

  onGooglePressed() {}

  onValidationFormInput(String? val) {
    if (isValidateFirst.value) {
      String valueEmail = inputEmail.text.toString().trim();
      String valuePassword = inputPassword.text.toString().trim();
      String valueConfPassword = inputConfPassword.text.toString().trim();

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
        if (MyHelpers.validateInputPassword(valuePassword)) {
          validatePassword.value = false;
          msgPassword.value = "password_validation".tr;
        } else {
          validatePassword.value = true;
          msgPassword.value = "";
        }
      }

      if (valueConfPassword.isEmpty) {
        validateConfPassword.value = false;
        msgConfPassword.value = "conf_password_validation_2".tr;
      } else {
        if (valueConfPassword != valuePassword) {
          validateConfPassword.value = false;
          msgConfPassword.value = "conf_password_validation".tr;
        } else {
          validateConfPassword.value = true;
          msgConfPassword.value = "";
        }
      }
    }

    return validateEmail.value && validatePassword.value && validateConfPassword.value;
  }

  Future doContinue() async {
    isValidateFirst.value = true;
    bool validation = onValidationFormInput(null);
    if (validation) {
      Get.toNamed(
        Routes.REGISTER_STEP_TWO,
        arguments: {
          "email": inputEmail.text.toString().trim(),
          "password": inputPassword.text.toString().trim(),
        },
      );
    }
  }
}
