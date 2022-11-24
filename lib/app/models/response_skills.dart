// ignore_for_file: overridden_fields, annotate_overrides

import 'dart:convert';

import 'package:maiden_employer/app/models/response_standard.dart';

class ResponseSkills extends ResponseModel {
  ResponseSkills({
    this.error,
    this.data,
    this.message,
  });

  final int? error;
  final Data? data;
  final List<String>? message;

  factory ResponseSkills.fromRawJson(String str) => ResponseSkills.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResponseSkills.fromJson(Map<String, dynamic> json) => ResponseSkills(
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

  final List<ListElement>? list;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        list: json["list"] == null ? null : List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": list == null ? null : List<dynamic>.from(list!.map((x) => x.toJson())),
      };
}

class ListElement {
  ListElement({
    this.label,
    this.value,
    this.options,
    this.image,
  });

  final String? label;
  final String? value;
  final List<String>? options;
  final String? image;

  factory ListElement.fromRawJson(String str) => ListElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        label: json["label"],
        value: json["value"],
        options: json["options"] == null ? null : List<String>.from(json["options"].map((x) => x)),
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
        "options": options == null ? null : List<dynamic>.from(options!.map((x) => x)),
        "image": image,
      };
}
