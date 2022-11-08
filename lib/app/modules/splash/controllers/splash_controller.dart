// ignore_for_file: unnecessary_overrides
import 'package:get/get.dart';
import 'package:maiden_employer/app/config/constants/preference_constant.dart';
import 'package:maiden_employer/app/routes/app_pages.dart';
import 'package:maiden_employer/app/shared/utils/preference_helper.dart';

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
    Future.delayed(Duration(seconds: 3), () async {
      String token = await PreferenceHelper().get(key: PreferenceConstant.USER_TOKEN);
      if (token.isEmpty) {
        isShownOnboarding.value = true;
      } else {
        Get.offAllNamed(Routes.MAIN);
      }
    });
  }

  onGetStartedPressed() {
    Get.toNamed(Routes.REGISTER_STEP_ONE);
  }

  onLoginPressed() {
    Get.toNamed(Routes.LOGIN);
  }
}
