import 'package:get/get.dart';
import 'package:maiden_employer/app/modules/register_step_one/register_step_one_languages.dart';
import 'package:maiden_employer/app/modules/register_step_two/register_step_two_languages.dart';
import 'package:maiden_employer/app/modules/splash/splash_languages.dart';
import 'package:maiden_employer/app/shared/common/common_laguages.dart';

class AppLanguages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          ...CommonLanguages.EN,
          ...SplashLanguages.EN,
          ...RegisterStepOneLanguages.EN,
          ...RegisterStepTwoLanguages.EN
        },
        'id_ID': {
          ...CommonLanguages.ID,
          ...SplashLanguages.ID,
          ...RegisterStepOneLanguages.ID,
          ...RegisterStepTwoLanguages.ID
        },
      };
}
