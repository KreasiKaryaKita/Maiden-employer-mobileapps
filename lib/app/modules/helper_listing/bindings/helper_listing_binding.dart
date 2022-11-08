import 'package:get/get.dart';

import '../controllers/helper_listing_controller.dart';

class HelperListingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HelperListingController>(
      () => HelperListingController(),
    );
  }
}
