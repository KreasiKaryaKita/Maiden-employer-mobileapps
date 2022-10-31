import 'package:get/get.dart';

import '../controllers/create_password_success_controller.dart';

class CreatePasswordSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreatePasswordSuccessController>(
      () => CreatePasswordSuccessController(),
    );
  }
}
