import 'package:maiden_employer/app/config/constants/endpoint_constant.dart';
import 'package:maiden_employer/app/data/networking/api_client.dart';
import 'package:maiden_employer/app/models/response_account_info.dart';
import 'package:maiden_employer/app/models/response_countries.dart';
import 'package:maiden_employer/app/models/response_education_levels.dart';
import 'package:maiden_employer/app/models/response_forgot_password.dart';
import 'package:maiden_employer/app/models/response_languages.dart';
import 'package:maiden_employer/app/models/response_login.dart';
import 'package:maiden_employer/app/models/response_marital_status.dart';
import 'package:maiden_employer/app/models/response_register.dart';
import 'package:maiden_employer/app/models/response_religions.dart';
import 'package:maiden_employer/app/models/response_reset_password.dart';
import 'package:maiden_employer/app/models/response_skills.dart';
import 'package:maiden_employer/app/models/response_standard.dart';

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
      "birth_of_date": birthOfDate,
      "phone": phone,
      "first_name": firstName,
      "last_name": lastName,
    };
    var response = await ApiClient().service(
      pathUrl: EndpointConstant.ACCOUNT_INFO,
      method: REQUEST_METHOD.POST,
      data: data,
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
      String? search,
      int? nationalityId,
      String? religion,
      List<String>? skills,
      String? language,
      String? education,
      String? maritalStatus,
      String? readyFromMin,
      String? readyFromMax,
      String? orderBy}) async {
    Map<String, dynamic> params = {"limit": 50};

    if (ageMin != null) params['age_min'] = ageMin;
    if (ageMax != null) params['age_max'] = ageMax;
    if (search != null) params['search'] = search;
    if (nationalityId != null) params['nationality'] = nationalityId;
    if (religion != null) params['religion'] = religion;
    if (skills != null) params['skill'] = skills.map((e) => e).toList();
    if (language != null) params['language'] = language;
    if (education != null) params['education'] = education;
    if (maritalStatus != null) params['marital_status'] = maritalStatus;
    if (readyFromMin != null) params['ready_from_min'] = readyFromMin;
    if (readyFromMax != null) params['ready_from_max'] = readyFromMax;
    if (orderBy != null) params['order_by'] = orderBy;

    var response =
        await ApiClient().service(pathUrl: EndpointConstant.HELPERS, method: REQUEST_METHOD.GET, params: params);

    if (response.statusCode == 200) {
      return ResponseEducationLevels.fromJson(response.data);
    } else {
      return ResponseStandard.fromJson(response.data);
    }
  }

  static Future<ResponseModel?> helperDetail({required id}) async {
    var params = {"id": id};

    var response =
        await ApiClient().service(pathUrl: EndpointConstant.HELPER_DETAIL, method: REQUEST_METHOD.GET, params: params);

    if (response.statusCode == 200) {
      return ResponseEducationLevels.fromJson(response.data);
    } else {
      return ResponseStandard.fromJson(response.data);
    }
  }
}
