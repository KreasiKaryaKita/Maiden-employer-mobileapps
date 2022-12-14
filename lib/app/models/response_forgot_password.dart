// ignore_for_file: annotate_overrides

import 'package:maiden_employer/app/models/response_standard.dart';

class ResponseForgotPassword implements ResponseModel {
  ResponseForgotPassword({
    this.error,
    this.data,
    this.message,
  });

  int? error;
  ForgotPasswordData? data;
  List<String>? message;

  factory ResponseForgotPassword.fromJson(Map<String, dynamic> json) => ResponseForgotPassword(
        error: json["error"],
        data: ForgotPasswordData.fromJson(json["data"]),
        message: List<String>.from(json["message"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "data": data!.toJson(),
        "message": List<dynamic>.from(message!.map((x) => x)),
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
