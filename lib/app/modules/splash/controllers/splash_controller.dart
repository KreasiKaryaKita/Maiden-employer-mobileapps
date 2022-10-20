import 'package:get/get.dart';
import 'package:maiden_employer/app/routes/app_pages.dart';

class SplashController extends GetxController {
  var isShownOnboarding = false.obs;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  init() {
    Future.delayed(Duration(seconds: 3), () {
      isShownOnboarding.value = true;
    });
  }

  onGetStartedPressed() {
    Get.toNamed(Routes.REGISTER_STEP_ONE);
  }

  onLoginPressed() {}
}
