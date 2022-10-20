// ignore_for_file: annotate_overrides, prefer_if_null_operators, unnecessary_question_mark

import 'dart:convert';

abstract class ResponseModel {
  ResponseModel({
    this.status,
    this.data,
    this.message,
  });

  final int? status;
  final dynamic? data;
  final String? message;
}

class ResponseStandard implements ResponseModel {
  ResponseStandard({
    this.status,
    this.data,
    this.message,
  });

  int? status;
  dynamic? data;
  String? message;

  factory ResponseStandard.fromRawJson(String str) => ResponseStandard.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResponseStandard.fromJson(Map<String, dynamic> json) => ResponseStandard(
        status: json["status"] == null ? false : json["status"],
        data: json["data"] == null ? null : json["data"],
        message: json["message"] == null ? 'Tidak bisa terhubung ke Internet' : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "data": data == null ? null : data,
        "message": message == null ? null : message,
      };
}
