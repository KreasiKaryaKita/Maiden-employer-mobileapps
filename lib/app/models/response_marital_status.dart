// ignore_for_file: overridden_fields, annotate_overrides
import 'dart:convert';

import 'package:maiden_employer/app/models/response_standard.dart';

class ResponseMaritalStatus extends ResponseModel {
  ResponseMaritalStatus({
    this.error,
    this.data,
    this.message,
  });

  final int? error;
  final Data? data;
  final List<String>? message;

  factory ResponseMaritalStatus.fromRawJson(String str) => ResponseMaritalStatus.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResponseMaritalStatus.fromJson(Map<String, dynamic> json) => ResponseMaritalStatus(
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

  final List<MaritalStatusModel>? list;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        list: json["list"] == null
            ? null
            : List<MaritalStatusModel>.from(json["list"].map((x) => MaritalStatusModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": list == null ? null : List<dynamic>.from(list!.map((x) => x.toJson())),
      };
}

class MaritalStatusModel {
  MaritalStatusModel({
    this.label,
    this.value,
  });

  final String? label;
  final String? value;

  factory MaritalStatusModel.fromRawJson(String str) => MaritalStatusModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MaritalStatusModel.fromJson(Map<String, dynamic> json) => MaritalStatusModel(
        label: json["label"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
      };
}
