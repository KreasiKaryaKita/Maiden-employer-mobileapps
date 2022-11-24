// To parse this JSON data, do
//
//     final responseHelpersCount = responseHelpersCountFromJson(jsonString);

import 'dart:convert';

import 'response_standard.dart';

class ResponseHelpersCount extends ResponseModel {
  ResponseHelpersCount({
    this.error,
    this.data,
    this.message,
  });

  final int? error;
  final Data? data;
  final List<String>? message;

  factory ResponseHelpersCount.fromRawJson(String str) => ResponseHelpersCount.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResponseHelpersCount.fromJson(Map<String, dynamic> json) => ResponseHelpersCount(
        error: json["error"] == null ? null : json["error"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"] == null
            ? null
            : json["message"] is String
                ? [json["message"]]
                : List<String>.from(json["message"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "error": error == null ? null : error,
        "data": data == null ? null : data!.toJson(),
        "message": message == null
            ? null
            : message is String
                ? [message]
                : List<dynamic>.from(message!.map((x) => x)),
      };
}

class Data {
  Data({
    this.totalData,
  });

  final int? totalData;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        totalData: json["total_data"] == null ? null : json["total_data"],
      );

  Map<String, dynamic> toJson() => {
        "total_data": totalData == null ? null : totalData,
      };
}
