import 'package:get/get.dart';
import 'package:maiden_employer/app/modules/helper_listing/controllers/helper_listing_controller.dart';

import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
    );
    Get.lazyPut<HelperListingController>(
      () => HelperListingController(),
    );
  }
}
