// To parse this JSON data, do
//
//     final responseReligions = responseReligionsFromJson(jsonString);

import 'dart:convert';

import 'response_standard.dart';

class ResponseReligions extends ResponseModel {
  ResponseReligions({
    this.error,
    this.data,
    this.message,
  });

  final int? error;
  final Data? data;
  final List<String>? message;

  factory ResponseReligions.fromRawJson(String str) => ResponseReligions.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResponseReligions.fromJson(Map<String, dynamic> json) => ResponseReligions(
        error: json["error"] == null ? null : json["error"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"] == null ? null : List<String>.from(json["message"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "error": error == null ? null : error,
        "data": data == null ? null : data!.toJson(),
        "message": message == null ? null : List<dynamic>.from(message!.map((x) => x)),
      };
}

class Data {
  Data({
    this.list,
  });

  final List<ReligionModel>? list;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        list:
            json["list"] == null ? null : List<ReligionModel>.from(json["list"].map((x) => ReligionModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": list == null ? null : List<dynamic>.from(list!.map((x) => x.toJson())),
      };
}

class ReligionModel {
  ReligionModel({
    this.label,
    this.value,
  });

  final String? label;
  final String? value;

  factory ReligionModel.fromRawJson(String str) => ReligionModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReligionModel.fromJson(Map<String, dynamic> json) => ReligionModel(
        label: json["label"] == null ? null : json["label"],
        value: json["value"] == null ? null : json["value"],
      );

  Map<String, dynamic> toJson() => {
        "label": label == null ? null : label,
        "value": value == null ? null : value,
      };
}
