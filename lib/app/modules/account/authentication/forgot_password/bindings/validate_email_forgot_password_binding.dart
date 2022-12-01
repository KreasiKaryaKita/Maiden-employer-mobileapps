import 'package:get/get.dart';

import '../controllers/validate_email_forgot_password_controller.dart';

class ValidateEmailForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ValidateEmailForgotPasswordController>(
      () => ValidateEmailForgotPasswordController(),
    );
  }
}
