import 'package:maiden_employer/app/config/constants/endpoint_constant.dart';
import 'package:maiden_employer/app/data/networking/api_client.dart';
import 'package:maiden_employer/app/models/response_account_info.dart';
import 'package:maiden_employer/app/models/response_forgot_password.dart';
import 'package:maiden_employer/app/models/response_login.dart';
import 'package:maiden_employer/app/models/response_register.dart';
import 'package:maiden_employer/app/models/response_reset_password.dart';
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
}
