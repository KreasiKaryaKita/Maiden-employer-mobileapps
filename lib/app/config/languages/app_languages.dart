import 'package:get/get.dart';
import 'package:maiden_employer/app/modules/splash/splash_languages.dart';
import 'package:maiden_employer/app/shared/common/common_laguages.dart';

class AppLanguages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          ...CommonLanguages.EN,
          ...SplashLanguages.EN,
        },
        'id_ID': {
          ...CommonLanguages.ID,
          ...SplashLanguages.ID,
        },
      };
}
