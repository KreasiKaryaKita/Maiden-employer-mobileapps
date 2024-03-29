// ignore_for_file: constant_identifier_names

class EndpointConstant {
  ///AUTH
  static const String LOGIN = 'auth/login';
  static const String REGISTER = 'auth/register';
  static const String ACCOUNT_INFO = 'auth/account-info';
  static const String FORGOT_PASSWORD = 'auth/forgot';
  static const String RESET_PASSWORD = 'auth/change-password';
  static const String VALIDATE_OTP = 'auth/validate-otp';
  static const String RESEND_OTP = 'auth/send-otp';

  ///FILTER DATA
  static const String COUNTRIES = 'country/list';
  static const String RELIGIONS = 'options/religion';
  static const String LANGUAGES = 'options/language';
  static const String MARITAL_STATUS = 'options/marital-status';
  static const String SKILLS = 'options/skills';
  static const String EDUCATION_LEVELS = 'options/education-level';
  static const String NATIONALITIES = 'options/nationality';
  static const String WORK_EXPERIENCES = 'options/work-experience';
  static const String SORTINGS = 'options/sorting';
  static const String AGE_RANGE = 'helper/filter-metadata';

  ///HELPER
  static const String HELPERS = 'helper/list';
  static const String HELPER_DETAIL = 'helper/detail';
  static const String HELPERS_COUNT = 'helper/count';
  static const String HELPERS_PDF = '/pdf';

  static const String INTERVIEW_TIME_SLOT = 'interview/time';
  static const String INTERVIEW_CREATE = 'interview/create';
}
