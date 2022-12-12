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
        message: List<String>.from(json["message"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "data": data!.toJson(),
        "message": List<dynamic>.from(message!.map((x) => x)),
      };
}

class RegisterData {
  RegisterData({
    this.email,
  });

  String? email;

  factory RegisterData.fromJson(Map<String, dynamic> json) => RegisterData(
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}
