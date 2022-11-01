// ignore_for_file: annotate_overrides

import 'package:maiden_employer/app/models/response_standard.dart';

class ResponseForgotPassword implements ResponseModel {
  ResponseForgotPassword({
    this.error,
    this.data,
    this.message,
  });

  Error? error;
  ForgotPasswordData? data;
  String? message;

  factory ResponseForgotPassword.fromJson(Map<String, dynamic> json) => ResponseForgotPassword(
        error: Error.fromJson(json["error"]),
        data: ForgotPasswordData.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "error": error!.toJson(),
        "data": data!.toJson(),
        "message": message,
      };
}

class ForgotPasswordData {
  ForgotPasswordData({
    this.email,
  });

  String? email;

  factory ForgotPasswordData.fromJson(Map<String, dynamic> json) => ForgotPasswordData(
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}
