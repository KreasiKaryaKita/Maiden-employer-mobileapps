import 'package:get/get.dart';
import 'package:maiden_employer/app/config/languages/forgot_password_languages.dart';
import 'package:maiden_employer/app/config/languages/helper_listing_languages.dart';
import 'package:maiden_employer/app/config/languages/login_languages.dart';
import 'package:maiden_employer/app/config/languages/main_languages.dart';
import 'package:maiden_employer/app/config/languages/register_languages.dart';
import 'package:maiden_employer/app/config/languages/splash_languages.dart';

class AppLanguages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          ...SplashLanguages.EN,
          ...RegisterLanguages.EN,
          ...LoginLanguages.EN,
          ...ForgotPasswordLanguages.EN,
          ...MainLanguages.EN,
          ...HelperListingLanguages.EN,
        },
        'id_ID': {
          ...SplashLanguages.ID,
          ...RegisterLanguages.ID,
          ...LoginLanguages.ID,
          ...ForgotPasswordLanguages.ID,
          ...MainLanguages.ID,
          ...HelperListingLanguages.ID,
        },
      };
}
