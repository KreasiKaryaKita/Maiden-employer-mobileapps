import 'package:get/get.dart';

import '../controllers/validate_email_register_controller.dart';

class ValidateEmailRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ValidateEmailRegisterController>(
      () => ValidateEmailRegisterController(),
    );
  }
}
