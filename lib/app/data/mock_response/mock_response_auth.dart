// ignore_for_file: no_leading_underscores_for_local_identifiers

import '../../shared/common/common_function.dart';
import '../../shared/utils/preference_helper.dart';

class UserDataMock {
  String? nisn;
  String? name;
  String? password;
  String? token;
  UserDataMock({this.nisn, this.name, this.password, this.token});
}

class MockResponseAuth {
  static List<UserDataMock> nisnList = [
    UserDataMock(nisn: '1234567890', name: 'Banu Setiawan', password: 'Qwerty123', token: 'token_1234567890'),
    UserDataMock(nisn: '1122334455', name: 'Joni Hermawan', password: 'dental123', token: 'token_1122334455'),
    UserDataMock(nisn: '9911882233', name: 'Nela Kharisma', password: 'ARDental2022', token: 'token_9911882233'),
  ];

  static Map<String, dynamic> nisnRegistered = {"status": 401, "message": "Nisn registered", "data": "Nisn registered"};

  static Map<String, dynamic> nisnNotRegistered = {
    "status": 200,
    "message": "Nisn Not registered",
    "data": "Nisn Not registered"
  };

  static Map<String, dynamic> nisnRegisteredSignin = {
    "status": 200,
    "message": "Nisn registered",
    "data": "Nisn registered"
  };

  static Map<String, dynamic> phoneNotRegisteredSignin = {
    "status": 401,
    "message": "Phone Not registered",
    "data": "Phone Not registered"
  };

  static Map<String, dynamic> unauthenticated = {
    "status": 401,
    "message": "User not Authenticated, please re-login",
    "data": "User not Authenticated, please re-login"
  };

  static Map<String, dynamic> unauthenticatedPassword = {
    "status": 401,
    "message": "Login Failed, password not correct",
    "data": "Login Failed, password not correct"
  };

  static Map<String, dynamic> unauthenticatedOtp = {
    "status": 401,
    "message": "Otp not correct",
    "data": "Otp not correct"
  };

  static Map<String, dynamic> register(
      {required String nisn,
      required String name,
      required String gender,
      required String dateOfBirth,
      required String schoolName,
      required String gradeClass,
      required String email,
      required String password}) {
    if (nisnList.firstWhere((e) => e.nisn == nisn, orElse: () => UserDataMock()).nisn != null) {
      return nisnRegistered;
    }

    return {
      "status": 200,
      "message": "Register Success",
      "data": {
        "access_key": "token_$name",
        "user": {"id": 1, "name": name, "nisn": nisn, "password": password}
      }
    };
  }

  static Map<String, dynamic> login({String? nisn, String? password}) {
    UserDataMock? _findAvailable = nisnList.firstWhere((e) => e.nisn == nisn, orElse: () => UserDataMock());

    if (_findAvailable.nisn == null) return unauthenticated;

    UserDataMock? _find =
        nisnList.firstWhere((e) => e.nisn == nisn && e.password == password, orElse: () => UserDataMock());

    if (_find.nisn == null) return unauthenticatedPassword;

    return {
      "status": 200,
      "message": "Login Success",
      "data": {
        "token": _find.token,
        "user": {"id": 1, "name": _find.name, "nisn": _find.nisn, "password": _find.password}
      }
    };
  }

  static Map<String, dynamic> profile() {
    var _token = PreferenceHelper().getUserToken;

    if (!CommonFunction.isLoggedIn) return unauthenticated;
    var _find = nisnList.firstWhere((e) => e.token == _token, orElse: () => UserDataMock());
    if (_find.nisn == null) return unauthenticated;

    return {
      "status": 200,
      "message": "Register Success",
      "data": {"d": 1, "name": _find.name, "nisn": _find.nisn, "password": _find.password, "status": "active"}
    };
  }

  static Map<String, dynamic> logout() {
    return {"status": 200, "message": "Logout Success", "data": "Logout Success"};
  }
}
