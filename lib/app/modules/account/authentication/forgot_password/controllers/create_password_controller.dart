// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maiden_employer/app/config/constants/preference_constant.dart';
import 'package:maiden_employer/app/data/repository/api_repositories.dart';
import 'package:maiden_employer/app/models/response_reset_password.dart';
import 'package:maiden_employer/app/routes/app_pages.dart';
import 'package:maiden_employer/app/shared/common/common_function.dart';
import 'package:maiden_employer/app/shared/utils/my_helper.dart';
import 'package:maiden_employer/app/shared/utils/preference_helper.dart';

class CreatePasswordController extends GetxController {
  RxBool isValidateFirst = false.obs;

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
  void onClose() {
    super.onClose();
  }

  onPassSecureChanged() {
    obscurePasswordText.value = !obscurePasswordText.value;
  }

  onConfirmPassSecureChanged() {
    obscureConfPasswordText.value = !obscureConfPasswordText.value;
  }

  onValidationFormInput(String? val) {
    if (isValidateFirst.value) {
      String valuePassword = inputPassword.text.toString().trim();
      String valueConfPassword = inputConfPassword.text.toString().trim();

      if (valuePassword.isEmpty) {
        validatePassword.value = false;
        msgPassword.value = "new_password_validation_2".tr;
      } else {
        if (!MyHelpers.validateInputPassword(valuePassword)) {
          validatePassword.value = false;
          msgPassword.value = "new_password_validation".tr;
        } else {
          validatePassword.value = true;
          msgPassword.value = "";
        }
      }

      if (valueConfPassword.isEmpty) {
        validateConfPassword.value = false;
        msgConfPassword.value = "conf_new_password_validation_2".tr;
      } else {
        if (valueConfPassword != valuePassword) {
          validateConfPassword.value = false;
          msgConfPassword.value = "conf_new_password_validation".tr;
        } else {
          validateConfPassword.value = true;
          msgConfPassword.value = "";
        }
      }
    }

    return validateConfPassword.value && validatePassword.value;
  }

  Future doCreatePassword() async {
    isValidateFirst.value = true;
    bool validation = onValidationFormInput(null);
    if (validation) {
      CommonFunction.loadingShow();
      ApiRepositories.resetPassword(
        email: await PreferenceHelper().get(key: PreferenceConstant.USER_EMAIL),
        password: inputPassword.text.toString().trim(),
        passwordConf: inputConfPassword.text.toString().trim(),
      ).then((value) {
        CommonFunction.loadingHide();
        if (value is ResponseResetPassword) {
          Get.offNamed(Routes.CREATE_PASSWORD_SUCCESS);
          CommonFunction.snackbarHelper(message: value.message!, isSuccess: true);
        } else {
          CommonFunction.snackbarHelper(message: value!.message!, isSuccess: false);
        }
      }, onError: (e) {
        CommonFunction.loadingHide();
        CommonFunction.snackbarHelper(message: e.toString(), isSuccess: false);
      });
    }
  }
}
