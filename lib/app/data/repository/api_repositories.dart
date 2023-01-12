import 'package:maiden_employer/app/config/constants/endpoint_constant.dart';
import 'package:maiden_employer/app/config/constants/preference_constant.dart';
import 'package:maiden_employer/app/data/networking/api_client.dart';
import 'package:maiden_employer/app/models/response_account_info.dart';
import 'package:maiden_employer/app/models/response_countries.dart';
import 'package:maiden_employer/app/models/response_education_levels.dart';
import 'package:maiden_employer/app/models/response_forgot_password.dart';
import 'package:maiden_employer/app/models/response_helper_detail.dart';
import 'package:maiden_employer/app/models/response_helpers.dart';
import 'package:maiden_employer/app/models/response_helpers_count.dart';
import 'package:maiden_employer/app/models/response_languages.dart';
import 'package:maiden_employer/app/models/response_login.dart';
import 'package:maiden_employer/app/models/response_marital_status.dart';
import 'package:maiden_employer/app/models/response_nationalities.dart';
import 'package:maiden_employer/app/models/response_register.dart';
import 'package:maiden_employer/app/models/response_religions.dart';
import 'package:maiden_employer/app/models/response_resend_otp.dart';
import 'package:maiden_employer/app/models/response_reset_password.dart';
import 'package:maiden_employer/app/models/response_skills.dart';
import 'package:maiden_employer/app/models/response_sortings.dart';
import 'package:maiden_employer/app/models/response_standard.dart';
import 'package:maiden_employer/app/models/response_validate_otp.dart';
import 'package:maiden_employer/app/models/response_work_experiences.dart';
import 'package:maiden_employer/app/shared/utils/preference_helper.dart';

class ApiRepositories {
  static Future<ResponseModel?> login({required String username, required String password}) async {
    var data = {
      'username': username,
      'password': password,
    };
    var response = await ApiClient().service(
      pathUrl: EndpointConstant.LOGIN,
      method: REQUEST_METHOD.POST,
      data: data,
      isAuth: false,
    );

    if (response.statusCode == 200) {
      return ResponseLogin.fromJson(response.data);
    } else {
      return ResponseStandard.fromJson(response.data);
    }
  }

  static Future<ResponseModel?> register({required String email, required String password}) async {
    var data = {
      'email': email,
      'password': password,
    };
    var response = await ApiClient().service(
      pathUrl: EndpointConstant.REGISTER,
      method: REQUEST_METHOD.POST,
      data: data,
      isAuth: false,
    );

    if (response.statusCode == 200) {
      return ResponseRegister.fromJson(response.data);
    } else {
      return ResponseStandard.fromJson(response.data);
    }
  }

  static Future<ResponseModel?> accountInfo({
    required String birthOfDate,
    required String phone,
    required String firstName,
    required String lastName,
  }) async {
    var data = {
      "email": await PreferenceHelper().get(key: PreferenceConstant.USER_EMAIL),
      "birth_of_date": birthOfDate,
      "phone": phone,
      "first_name": firstName,
      "last_name": lastName,
    };
    var response = await ApiClient().service(
      pathUrl: EndpointConstant.ACCOUNT_INFO,
      method: REQUEST_METHOD.POST,
      data: data,
      isAuth: false,
    );

    if (response.statusCode == 200) {
      return ResponseAccountInfo.fromJson(response.data);
    } else {
      return ResponseStandard.fromJson(response.data);
    }
  }

  static Future<ResponseModel?> forgotPassword({required String email}) async {
    var data = {
      'email': email,
    };
    var response = await ApiClient().service(
      pathUrl: EndpointConstant.FORGOT_PASSWORD,
      method: REQUEST_METHOD.POST,
      data: data,
      isAuth: false,
    );

    if (response.statusCode == 200) {
      return ResponseForgotPassword.fromJson(response.data);
    } else {
      return ResponseStandard.fromJson(response.data);
    }
  }

  static Future<ResponseModel?> resetPassword({
    required String email,
    required String password,
    required String passwordConf,
  }) async {
    var data = {
      "email": email,
      "password": password,
      "repassword": passwordConf,
    };
    var response = await ApiClient().service(
      pathUrl: EndpointConstant.RESET_PASSWORD,
      method: REQUEST_METHOD.POST,
      data: data,
      isAuth: false,
    );

    if (response.statusCode == 200) {
      return ResponseResetPassword.fromJson(response.data);
    } else {
      return ResponseStandard.fromJson(response.data);
    }
  }

  static Future<ResponseModel?> resenOtp({required String email}) async {
    var data = {
      'email': email,
    };
    var response = await ApiClient().service(
      pathUrl: EndpointConstant.RESEND_OTP,
      method: REQUEST_METHOD.POST,
      data: data,
      isAuth: false,
    );

    if (response.statusCode == 200) {
      return ResponseResendOtp.fromJson(response.data);
    } else {
      return ResponseStandard.fromJson(response.data);
    }
  }

  static Future<ResponseModel?> validateOtp({required String email, required String otp}) async {
    var data = {
      'email': email,
      'otp': otp,
    };
    var response = await ApiClient().service(
      pathUrl: EndpointConstant.VALIDATE_OTP,
      method: REQUEST_METHOD.POST,
      data: data,
      isAuth: false,
    );

    if (response.statusCode == 200) {
      return ResponseValidateOtp.fromJson(response.data);
    } else {
      return ResponseStandard.fromJson(response.data);
    }
  }

  static Future<ResponseModel?> countries() async {
    var param = {'limit': 1000};

    var response = await ApiClient().service(
      pathUrl: EndpointConstant.COUNTRIES,
      method: REQUEST_METHOD.GET,
      params: param,
      isAuth: false,
    );

    if (response.statusCode == 200) {
      return ResponseCountries.fromJson(response.data);
    } else {
      return ResponseStandard.fromJson(response.data);
    }
  }

  static Future<ResponseModel?> nationalities() async {
    var response = await ApiClient().service(pathUrl: EndpointConstant.NATIONALITIES, method: REQUEST_METHOD.GET);

    if (response.statusCode == 200) {
      return ResponseNationalities.fromJson(response.data);
    } else {
      return ResponseStandard.fromJson(response.data);
    }
  }

  static Future<ResponseModel?> workExperiences() async {
    var response = await ApiClient().service(pathUrl: EndpointConstant.WORK_EXPERIENCES, method: REQUEST_METHOD.GET);

    if (response.statusCode == 200) {
      return ResponseWorkExperiences.fromJson(response.data);
    } else {
      return ResponseStandard.fromJson(response.data);
    }
  }

  static Future<ResponseModel?> religions() async {
    var response = await ApiClient().service(pathUrl: EndpointConstant.RELIGIONS, method: REQUEST_METHOD.GET);

    if (response.statusCode == 200) {
      return ResponseReligions.fromJson(response.data);
    } else {
      return ResponseStandard.fromJson(response.data);
    }
  }

  static Future<ResponseModel?> languages() async {
    var response = await ApiClient().service(pathUrl: EndpointConstant.LANGUAGES, method: REQUEST_METHOD.GET);

    if (response.statusCode == 200) {
      return ResponseLanguages.fromJson(response.data);
    } else {
      return ResponseStandard.fromJson(response.data);
    }
  }

  static Future<ResponseModel?> sortings() async {
    var response = await ApiClient().service(pathUrl: EndpointConstant.SORTINGS, method: REQUEST_METHOD.GET);

    if (response.statusCode == 200) {
      return ResponseSortings.fromJson(response.data);
    } else {
      return ResponseStandard.fromJson(response.data);
    }
  }

  static Future<ResponseModel?> maritalStatus() async {
    var response = await ApiClient().service(pathUrl: EndpointConstant.MARITAL_STATUS, method: REQUEST_METHOD.GET);

    if (response.statusCode == 200) {
      return ResponseMaritalStatus.fromJson(response.data);
    } else {
      return ResponseStandard.fromJson(response.data);
    }
  }

  static Future<ResponseModel?> skills() async {
    var response = await ApiClient().service(pathUrl: EndpointConstant.SKILLS, method: REQUEST_METHOD.GET);

    if (response.statusCode == 200) {
      return ResponseSkills.fromJson(response.data);
    } else {
      return ResponseStandard.fromJson(response.data);
    }
  }

  static Future<ResponseModel?> educationLevels() async {
    var response = await ApiClient().service(pathUrl: EndpointConstant.EDUCATION_LEVELS, method: REQUEST_METHOD.GET);

    if (response.statusCode == 200) {
      return ResponseEducationLevels.fromJson(response.data);
    } else {
      return ResponseStandard.fromJson(response.data);
    }
  }

  static Future<ResponseModel?> helperList(
      {int page = 1,
      int? ageMin,
      int? ageMax,
      String? status,
      String? search,
      String? nationality,
      String? religion,
      String? skills,
      String? language,
      String? education,
      String? maritalStatus,
      String? readyFromMin,
      String? readyFromMax,
      String? orderBy,
      String? workExperience}) async {
    Map<String, dynamic> params = {"limit": 20, "page": page};

    if (ageMin != null) params['age_min'] = ageMin;
    if (ageMax != null) params['age_max'] = ageMax;
    if (status != null) params['status'] = status;
    if (search != null) params['search'] = search;
    if (nationality != null) params['nationality'] = nationality;
    if (religion != null) params['religion'] = religion;
    if (skills != null) params['skill'] = skills;
    if (language != null) params['language'] = language;
    if (education != null) params['education'] = education;
    if (maritalStatus != null) params['marital_status'] = maritalStatus;
    if (readyFromMin != null) params['ready_from_min'] = readyFromMin;
    if (readyFromMax != null) params['ready_from_max'] = readyFromMax;
    if (orderBy != null) params['order_by'] = orderBy;
    if (workExperience != null) params['work_experience'] = workExperience;

    var response =
        await ApiClient().service(pathUrl: EndpointConstant.HELPERS, method: REQUEST_METHOD.GET, params: params);

    if (response.statusCode == 200) {
      return ResponseHelpers.fromJson(response.data);
    } else {
      return ResponseStandard.fromJson(response.data);
    }
  }

  static Future<ResponseModel?> helperCount(
      {int? ageMin,
      int? ageMax,
      String? status,
      String? search,
      String? nationality,
      String? religion,
      String? skills,
      String? language,
      String? education,
      String? maritalStatus,
      String? readyFromMin,
      String? readyFromMax,
      String? orderBy,
      String? workExperience}) async {
    Map<String, dynamic> params = {};

    if (ageMin != null) params['age_min'] = ageMin;
    if (ageMax != null) params['age_max'] = ageMax;
    if (status != null) params['status'] = status;
    if (search != null) params['search'] = search;
    if (nationality != null) params['nationality'] = nationality;
    if (religion != null) params['religion'] = religion;
    if (skills != null) params['skill'] = skills;
    if (language != null) params['language'] = language;
    if (education != null) params['education'] = education;
    if (maritalStatus != null) params['marital_status'] = maritalStatus;
    if (readyFromMin != null) params['ready_from_min'] = readyFromMin;
    if (readyFromMax != null) params['ready_from_max'] = readyFromMax;
    if (orderBy != null) params['order_by'] = orderBy;
    if (workExperience != null) params['work_experience'] = workExperience;

    var response =
        await ApiClient().service(pathUrl: EndpointConstant.HELPERS_COUNT, method: REQUEST_METHOD.GET, params: params);

    if (response.statusCode == 200) {
      return ResponseHelpersCount.fromJson(response.data);
    } else {
      return ResponseStandard.fromJson(response.data);
    }
  }

  static Future<ResponseModel?> helperDetail({required id}) async {
    var params = {"id": id};

    var response =
        await ApiClient().service(pathUrl: EndpointConstant.HELPER_DETAIL, method: REQUEST_METHOD.GET, params: params);

    if (response.statusCode == 200) {
      return ResponseHelperDetail.fromJson(response.data);
    } else {
      return ResponseStandard.fromJson(response.data);
    }
  }
}
