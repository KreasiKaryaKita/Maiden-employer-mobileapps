// ignore_for_file: overridden_fields, annotate_overrides

import 'dart:convert';

import 'package:maiden_employer/app/models/response_standard.dart';

class ResponseCountries extends ResponseModel {
  ResponseCountries({
    this.error,
    this.data,
    this.message,
  });

  final int? error;
  final Data? data;
  final List<String>? message;

  factory ResponseCountries.fromRawJson(String str) => ResponseCountries.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResponseCountries.fromJson(Map<String, dynamic> json) => ResponseCountries(
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
    this.limit,
    this.page,
  });

  final List<CountryModel>? list;
  final int? limit;
  final int? page;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        list: json["list"] == null ? null : List<CountryModel>.from(json["list"].map((x) => CountryModel.fromJson(x))),
        limit: json["limit"],
        page: json["page"],
      );

  Map<String, dynamic> toJson() => {
        "list": list == null ? null : List<dynamic>.from(list!.map((x) => x.toJson())),
        "limit": limit,
        "page": page,
      };
}

class CountryModel {
  CountryModel({
    this.id,
    this.name,
    this.code,
    this.phoneCode,
    this.image,
  });

  final int? id;
  final String? name;
  final String? code;
  final String? phoneCode;
  final String? image;

  factory CountryModel.fromRawJson(String str) => CountryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        phoneCode: json["phone_code"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "phone_code": phoneCode,
        "image": image,
      };
}
