// To parse this JSON data, do
//
//     final responseSortings = responseSortingsFromJson(jsonString);

import 'dart:convert';

import 'response_standard.dart';

class ResponseSortings extends ResponseModel {
  ResponseSortings({
    this.error,
    this.data,
    this.message,
  });

  final int? error;
  final Data? data;
  final List<String>? message;

  factory ResponseSortings.fromRawJson(String str) => ResponseSortings.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResponseSortings.fromJson(Map<String, dynamic> json) => ResponseSortings(
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
  });

  final String? label;
  final String? value;

  factory ListElement.fromRawJson(String str) => ListElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        label: json["label"] == null ? null : json["label"],
        value: json["value"] == null ? null : json["value"],
      );

  Map<String, dynamic> toJson() => {
        "label": label == null ? null : label,
        "value": value == null ? null : value,
      };
}
