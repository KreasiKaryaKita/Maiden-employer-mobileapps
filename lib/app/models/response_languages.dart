// ignore_for_file: overridden_fields, annotate_overrides
import 'dart:convert';

import 'package:maiden_employer/app/models/response_standard.dart';

class ResponseLanguages extends ResponseModel {
  ResponseLanguages({
    this.error,
    this.data,
    this.message,
  });

  final int? error;
  final Data? data;
  final List<String>? message;

  factory ResponseLanguages.fromRawJson(String str) => ResponseLanguages.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResponseLanguages.fromJson(Map<String, dynamic> json) => ResponseLanguages(
        error: json["error"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"] == null ? null : List<String>.from(json["message"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "data": data == null ? null : data!.toJson(),
        "message": message == null ? null : List<dynamic>.from(message!.map((x) => x)),
      };
}

class Data {
  Data({
    this.list,
  });

  final List<LanguageModel>? list;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        list:
            json["list"] == null ? null : List<LanguageModel>.from(json["list"].map((x) => LanguageModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": list == null ? null : List<dynamic>.from(list!.map((x) => x.toJson())),
      };
}

class LanguageModel {
  LanguageModel({
    this.label,
    this.value,
  });

  final String? label;
  final String? value;

  factory LanguageModel.fromRawJson(String str) => LanguageModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LanguageModel.fromJson(Map<String, dynamic> json) => LanguageModel(
        label: json["label"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
      };
}
