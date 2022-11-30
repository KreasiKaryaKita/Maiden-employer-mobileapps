// ignore_for_file: overridden_fields, annotate_overrides

import 'dart:convert';

import 'package:maiden_employer/app/models/response_standard.dart';

class ResponseHelpers extends ResponseModel {
  ResponseHelpers({
    this.error,
    this.data,
    this.message,
  });

  final int? error;
  final Data? data;
  final List<String>? message;

  factory ResponseHelpers.fromRawJson(String str) => ResponseHelpers.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResponseHelpers.fromJson(Map<String, dynamic> json) => ResponseHelpers(
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
    this.totalData,
  });

  final List<ListElement>? list;
  final int? limit;
  final int? page;
  final int? totalData;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        list: json["list"] == null ? null : List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
        limit: json["limit"],
        page: json["page"],
        totalData: json["total_data"],
      );

  Map<String, dynamic> toJson() => {
        "list": list == null ? null : List<dynamic>.from(list!.map((x) => x.toJson())),
        "limit": limit,
        "page": page,
        "total_data": totalData,
      };
}

class ListElement {
  ListElement({
    this.id,
    this.helperId,
    this.photo,
    this.fullName,
    this.birthDate,
    this.age,
    this.country,
    this.countryImage,
    this.skills,
    this.language,
    this.religion,
    this.educationLevel,
    this.maritalStatus,
    this.readyForHireDate,
    this.experienceYears,
    this.experienceMonths,
    this.sallary,
    this.location,
  });

  final int? id;
  final String? helperId;
  final String? photo;
  final String? fullName;
  final String? birthDate;
  final String? age;
  final String? country;
  final String? countryImage;
  final dynamic skills;
  final List<Language>? language;
  final String? religion;
  final String? educationLevel;
  final String? maritalStatus;
  final String? readyForHireDate;
  final String? experienceYears;
  final String? experienceMonths;
  final String? sallary;
  final String? location;

  factory ListElement.fromRawJson(String str) => ListElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        helperId: json["helper_id"],
        photo: json["photo"],
        fullName: json["full_name"],
        birthDate: json["birth_date"],
        age: json["age"],
        country: json["country"],
        countryImage: json["country_image"],
        skills: json["skills"],
        language:
            json["language"] == null ? null : List<Language>.from(json["language"].map((x) => Language.fromJson(x))),
        religion: json["religion"],
        educationLevel: json["education_level"],
        maritalStatus: json["marital_status"],
        readyForHireDate: json["ready_for_hire_date"],
        experienceYears: json["experience_years"],
        experienceMonths: json["experience_months"],
        sallary: json["sallary"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "helper_id": helperId,
        "photo": photo,
        "full_name": fullName,
        "birth_date": birthDate,
        "age": age,
        "country": country,
        "country_image": countryImage,
        "skills": skills,
        "language": language == null ? null : List<dynamic>.from(language!.map((x) => x.toJson())),
        "religion": religion,
        "education_level": educationLevel,
        "marital_status": maritalStatus,
        "ready_for_hire_date": readyForHireDate,
        "experience_years": experienceYears,
        "experience_months": experienceMonths,
        "sallary": sallary,
        "location": location,
      };
}

class Language {
  Language({
    this.question,
    this.answer,
    this.level,
  });

  final String? question;
  final bool? answer;
  final String? level;

  factory Language.fromRawJson(String str) => Language.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        question: json["question"],
        answer: json["answer"],
        level: json["level"],
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "answer": answer,
        "level": level,
      };
}
