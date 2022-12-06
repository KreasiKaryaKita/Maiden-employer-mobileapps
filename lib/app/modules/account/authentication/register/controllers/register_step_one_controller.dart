// ignore_for_file: unnecessary_overrides

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:maiden_employer/app/config/constants/preference_constant.dart';
import 'package:maiden_employer/app/data/repository/api_repositories.dart';
import 'package:maiden_employer/app/models/response_register.dart';
import 'package:maiden_employer/app/routes/app_pages.dart';
import 'package:maiden_employer/app/shared/common/common_function.dart';
import 'package:maiden_employer/app/shared/utils/my_helper.dart';
import 'package:maiden_employer/app/shared/utils/preference_helper.dart';

class RegisterStepOneController extends GetxController {
  RxBool isAgree = false.obs;
  RxBool isValidateFirst = false.obs;

  TextEditingController inputEmail = TextEditingController();
  RxBool validateEmail = true.obs;
  RxString msgEmail = "".obs;

  TextEditingController inputPassword = TextEditingController();
  RxBool validatePasswordLength = false.obs,
      validatePasswordCaseChar = false.obs,
      validatePasswordSpecialChar = false.obs,
      obscurePasswordText = true.obs;
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
    String valuePassword = inputPassword.text.toString().trim();
    validatePasswordLength.value = MyHelpers.validateInputPasswordLength(valuePassword);
    validatePasswordCaseChar.value = MyHelpers.validateInputPasswordCaseChar(valuePassword);
    validatePasswordSpecialChar.value = MyHelpers.validateInputPasswordSpecialChar(valuePassword);

    if (isValidateFirst.value) {
      String valueEmail = inputEmail.text.toString().trim();
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

    return validateEmail.value &&
        validatePasswordLength.value &&
        validatePasswordCaseChar.value &&
        validatePasswordSpecialChar.value &&
        validateConfPassword.value;
  }

  Future doContinue() async {
    isValidateFirst.value = true;
    bool validation = onValidationFormInput(null);
    if (validation) {
      CommonFunction.loadingShow();
      ApiRepositories.register(
        email: inputEmail.text.toString().trim(),
        password: inputPassword.text.toString().trim(),
      ).then((value) async {
        CommonFunction.loadingHide();
        if (value is ResponseRegister) {
          PreferenceHelper().set(
            key: PreferenceConstant.USER_EMAIL,
            value: value.data!.email.toString(),
          );
          Get.offNamed(Routes.VALIDATE_EMAIL_REGISTER);
        } else {
          CommonFunction.snackbarHelper(message: value?.message ?? 'Failed', isSuccess: false);
        }
      }, onError: (e) {
        CommonFunction.loadingHide();
        CommonFunction.snackbarHelper(message: e.toString(), isSuccess: false);
      });
    }
  }
}
