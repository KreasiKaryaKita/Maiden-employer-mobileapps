import 'dart:convert';

import 'package:maiden_employer/app/models/response_standard.dart';

class ResponseAgeRange extends ResponseModel {
  ResponseAgeRange({
    this.error,
    this.data,
    this.message,
  });

  final int? error;
  final Data? data;
  final List<String>? message;

  factory ResponseAgeRange.fromRawJson(String str) => ResponseAgeRange.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResponseAgeRange.fromJson(Map<String, dynamic> json) => ResponseAgeRange(
        error: json["error"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"] == null ? [] : List<String>.from(json["message"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "data": data?.toJson(),
        "message": message == null ? [] : List<dynamic>.from(message!.map((x) => x)),
      };
}

class Data {
  Data({
    this.age,
  });

  final Age? age;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        age: json["age"] == null ? null : Age.fromJson(json["age"]),
      );

  Map<String, dynamic> toJson() => {
        "age": age?.toJson(),
      };
}

class Age {
  Age({
    this.min,
    this.max,
  });

  final int? min;
  final int? max;

  factory Age.fromRawJson(String str) => Age.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Age.fromJson(Map<String, dynamic> json) => Age(
        min: json["min"],
        max: json["max"],
      );

  Map<String, dynamic> toJson() => {
        "min": min,
        "max": max,
      };
}
