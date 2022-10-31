// ignore_for_file: annotate_overrides

import 'package:maiden_employer/app/models/response_standard.dart';

class ResponseLogin implements ResponseModel {
  ResponseLogin({
    this.error,
    this.data,
    this.message,
  });

  Error? error;
  LoginData? data;
  String? message;

  factory ResponseLogin.fromJson(Map<String, dynamic> json) => ResponseLogin(
        error: Error.fromJson(json["error"]),
        data: LoginData.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "error": error!.toJson(),
        "data": data!.toJson(),
        "message": message,
      };
}

class LoginData {
  LoginData({
    this.token,
    this.userId,
    this.email,
    this.firstName,
    this.lastName,
    this.birthDate,
    this.userType,
    this.userTypeLabel,
  });

  String? token;
  int? userId;
  String? email;
  String? firstName;
  String? lastName;
  DateTime? birthDate;
  int? userType;
  String? userTypeLabel;

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        token: json["token"],
        userId: json["user_id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        birthDate: (json["birth_date"] == null) ? null : DateTime.parse(json["birth_date"]),
        userType: json["user_type"],
        userTypeLabel: json["user_type_label"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user_id": userId,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "birth_date":
            "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        "user_type": userType,
        "user_type_label": userTypeLabel,
      };
}
