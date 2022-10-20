import 'package:get/get.dart';

import 'package:maiden_employer/app/modules/home/bindings/home_binding.dart';
import 'package:maiden_employer/app/modules/home/views/home_view.dart';
import 'package:maiden_employer/app/modules/register_step_one/bindings/register_step_one_binding.dart';
import 'package:maiden_employer/app/modules/register_step_one/views/register_step_one_view.dart';
import 'package:maiden_employer/app/modules/register_step_two/bindings/register_step_two_binding.dart';
import 'package:maiden_employer/app/modules/register_step_two/views/register_step_two_view.dart';
import 'package:maiden_employer/app/modules/splash/bindings/splash_binding.dart';
import 'package:maiden_employer/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_STEP_ONE,
      page: () => RegisterStepOneView(),
      binding: RegisterStepOneBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_STEP_TWO,
      page: () => RegisterStepTwoView(),
      binding: RegisterStepTwoBinding(),
    ),
  ];
}
