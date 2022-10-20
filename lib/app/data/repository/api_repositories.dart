// ignore_for_file: no_leading_underscores_for_local_identifiers

import '../../config/constants/endpoint_constant.dart';
import '../../models/repositories/response_standard.dart';
import '../../models/repositories/response_user.dart';
import '../mock_response/mock_response_auth.dart';
import '../networking/api_client.dart';

class ApiRepositories {
  static Future<ResponseModel?> login({required String nisn, required String password}) async {
    if (ApiClient.isUseMockData) {
      await Future.delayed(Duration(seconds: 3));
      var _return = MockResponseAuth.login(nisn: nisn, password: password);

      if (_return['status'] == 200) {
        return ResponseUser.fromJson(_return);
      } else {
        return ResponseStandard.fromJson(_return);
      }
    } else {
      var _return = await ApiClient().post(EndpointConstant.LOGIN, data: {
        'nisn': nisn,
        'password': password,
        // 'token': commonController.savedDataModel.value.fcmToken,
        // 'device_id': commonController.savedDataModel.value.deviceId
      });

      if (_return.statusCode == 200) {
        return ResponseUser.fromJson(_return.data);
      } else {
        return ResponseStandard.fromJson(_return.data);
      }
    }
  }

  // ignore: body_might_complete_normally_nullable
  static Future<ResponseModel?> refreshToken() async {}

  static Future<ResponseModel?> register(
      {required String nisn,
      required String name,
      required String gender,
      required String dateOfBirth,
      required String schoolName,
      required String gradeClass,
      required String email,
      required String password}) async {
    if (ApiClient.isUseMockData) {
      await Future.delayed(Duration(seconds: 3));
      var _return = MockResponseAuth.register(
          nisn: nisn,
          name: name,
          gender: gender,
          dateOfBirth: dateOfBirth,
          schoolName: schoolName,
          gradeClass: gradeClass,
          email: email,
          password: password);

      if (_return['status'] == 200) {
        return ResponseUser.fromJson(_return);
      } else {
        return ResponseStandard.fromJson(_return);
      }
    } else {
      var _return = await ApiClient().post(EndpointConstant.REGISTER, data: {'nisn': nisn});

      if (_return.statusCode == 200) {
        return ResponseUser.fromJson(_return.data);
      } else {
        return ResponseStandard.fromJson(_return.data);
      }
    }
  }

  static Future<ResponseModel?> profile() async {
    if (!ApiClient.isUseMockData) {
      await Future.delayed(Duration(seconds: 3));
      var _return = MockResponseAuth.profile();

      if (_return['status'] == 200) {
        return ResponseUser.fromJson(_return);
      } else {
        return ResponseStandard.fromJson(_return);
      }
    } else {
      var _return = await ApiClient().get(EndpointConstant.PROFILE, isAuth: true);

      if (_return.statusCode == 200) {
        return ResponseUser.fromJson(_return.data);
      } else {
        return ResponseStandard.fromJson(_return.data);
      }
    }
  }

  static Future<ResponseModel?> forgotPass({required String phone}) async {
    var _return = await ApiClient().post(EndpointConstant.FORGOT_PASS, data: {'phone': phone});

    if (_return.statusCode == 200) {
      return ResponseUser.fromJson(_return.data);
    } else {
      return ResponseStandard.fromJson(_return.data);
    }
  }

  static Future<ResponseModel?> logout() async {
    if (ApiClient.isUseMockData) {
      await Future.delayed(Duration(seconds: 3));
      var _return = MockResponseAuth.logout();
      print('--MOCK LOGOUT--> $_return');

      return ResponseStandard.fromJson(_return);
    } else {
      var _return = await ApiClient().post(EndpointConstant.LOGOUT, isAuth: true);

      return ResponseStandard.fromJson(_return.data);
    }
  }
}
