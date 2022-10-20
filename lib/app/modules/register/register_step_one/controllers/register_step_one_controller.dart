// ignore_for_file: unnecessary_overrides

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:maiden_employer/app/routes/app_pages.dart';

class RegisterStepOneController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var isAutoValidate = false.obs;
  var emailCt = TextEditingController();
  var passCt = TextEditingController();
  var confirmPassCt = TextEditingController();
  var isPassSecure = true.obs;
  var isPassConfirmSecure = true.obs;
  var isAgree = false.obs;

  TextEditingController inputEmail = TextEditingController();
  RxBool validateEmail = true.obs;
  RxString msgEmail = "".obs;

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
    isPassSecure.value = !isPassSecure.value;
  }

  onConfirmPassSecureChanged() {
    isPassConfirmSecure.value = !isPassConfirmSecure.value;
  }

  onAgreeChanged(bool value) {
    isAgree.value = !isAgree.value;
  }

  onFacebookPressed() {}

  onGooglePressed() {}

  bool isRegisterEnabled() {
    return isAgree.value;
  }

  onRegisterStepOne() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Get.toNamed(Routes.REGISTER_STEP_TWO);
    } else {
      isAutoValidate.value = true;
    }
  }
}
