import 'package:get/get.dart';

import '../controllers/detail_helper_controller.dart';

class DetailHelperBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailHelperController>(
      () => DetailHelperController(),
    );
  }
}
