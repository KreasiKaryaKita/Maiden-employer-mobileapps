// ignore_for_file: annotate_overrides

import 'package:maiden_employer/app/models/response_standard.dart';

class ResponseRegister implements ResponseModel {
  ResponseRegister({
    this.error,
    this.data,
    this.message,
  });

  int? error;
  RegisterData? data;
  List<String>? message;

  factory ResponseRegister.fromJson(Map<String, dynamic> json) => ResponseRegister(
        error: json["error"],
        data: RegisterData.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "data": data!.toJson(),
        "message": message,
      };
}

class RegisterData {
  RegisterData({
    this.userId,
    this.token,
    this.email,
    this.name,
    this.userType,
    this.userTypeLabel,
  });

  int? userId;
  String? token;
  String? email;
  String? name;
  int? userType;
  String? userTypeLabel;

  factory RegisterData.fromJson(Map<String, dynamic> json) => RegisterData(
        userId: json["user_id"],
        token: json["token"],
        email: json["email"],
        name: json["name"],
        userType: json["user_type"],
        userTypeLabel: json["user_type_label"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "token": token,
        "email": email,
        "name": name,
        "user_type": userType,
        "user_type_label": userTypeLabel,
      };
}
