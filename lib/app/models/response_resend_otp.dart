// ignore_for_file: annotate_overrides

import 'package:maiden_employer/app/models/response_standard.dart';

class ResponseResendOtp implements ResponseModel {
  ResponseResendOtp({
    this.error,
    this.data,
    this.message,
  });

  int? error;
  ValidateOtpData? data;
  List<String>? message;

  factory ResponseResendOtp.fromJson(Map<String, dynamic> json) => ResponseResendOtp(
        error: json["error"],
        data: ValidateOtpData.fromJson(json["data"]),
        message: List<String>.from(json["message"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "data": data!.toJson(),
        "message": List<dynamic>.from(message!.map((x) => x)),
      };
}

class ValidateOtpData {
  ValidateOtpData({
    this.email,
  });

  String? email;

  factory ValidateOtpData.fromJson(Map<String, dynamic> json) => ValidateOtpData(
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}
