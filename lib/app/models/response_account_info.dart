// ignore_for_file: annotate_overrides

import 'package:maiden_employer/app/models/response_standard.dart';

class ResponseAccountInfo implements ResponseModel {
  ResponseAccountInfo({
    this.error,
    this.data,
    this.message,
  });

  int? error;
  AccountInfoData? data;
  List<String>? message;

  factory ResponseAccountInfo.fromJson(Map<String, dynamic> json) => ResponseAccountInfo(
        error: json["error"],
        data: AccountInfoData.fromJson(json["data"]),
        message: List<String>.from(json["message"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "data": data!.toJson(),
        "message": List<dynamic>.from(message!.map((x) => x)),
      };
}

class AccountInfoData {
  AccountInfoData({
    this.userId,
    this.email,
    this.firstName,
    this.lastName,
    this.phone,
    this.birthDate,
    this.userType,
    this.userTypeLabel,
    this.token,
  });

  int? userId;
  String? email;
  String? firstName;
  String? lastName;
  String? phone;
  DateTime? birthDate;
  int? userType;
  String? userTypeLabel;
  String? token;

  factory AccountInfoData.fromJson(Map<String, dynamic> json) => AccountInfoData(
        userId: json["user_id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        birthDate: DateTime.parse(json["birth_date"]),
        userType: json["user_type"],
        userTypeLabel: json["user_type_label"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "birth_date":
            "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        "user_type": userType,
        "user_type_label": userTypeLabel,
        "token": token,
      };
}
