import 'package:get/get.dart';

import '../modules/account/authentication/forgot_password/bindings/create_password_success_binding.dart';
import '../modules/account/authentication/forgot_password/views/create_password_success_view.dart';
import '../modules/account/authentication/forgot_password/bindings/create_password_binding.dart';
import '../modules/account/authentication/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/account/authentication/forgot_password/views/create_password_view.dart';
import '../modules/account/authentication/forgot_password/views/forgot_password_view.dart';
import '../modules/account/authentication/login/bindings/login_binding.dart';
import '../modules/account/authentication/login/views/login_view.dart';
import '../modules/account/authentication/register/bindings/register_step_one_binding.dart';
import '../modules/account/authentication/register/bindings/register_step_two_binding.dart';
import '../modules/account/authentication/register/views/register_step_one_view.dart';
import '../modules/account/authentication/register/views/register_step_two_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
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
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_PASSWORD,
      page: () => const CreatePasswordView(),
      binding: CreatePasswordBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_PASSWORD_SUCCESS,
      page: () => const CreatePasswordSuccessView(),
      binding: CreatePasswordSuccessBinding(),
    ),
  ];
}
