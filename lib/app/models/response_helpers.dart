// To parse this JSON data, do
//
//     final responseHelpers = responseHelpersFromJson(jsonString);

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
        limit: json["limit"] == null ? null : json["limit"],
        page: json["page"] == null ? null : json["page"],
        totalData: json["total_data"] == null ? null : json["total_data"],
      );

  Map<String, dynamic> toJson() => {
        "list": list == null ? null : List<dynamic>.from(list!.map((x) => x.toJson())),
        "limit": limit == null ? null : limit,
        "page": page == null ? null : page,
        "total_data": totalData == null ? null : totalData,
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
  final String? skills;
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
        id: json["id"] == null ? null : json["id"],
        helperId: json["helper_id"] == null ? null : json["helper_id"],
        photo: json["photo"] == null ? null : json["photo"],
        fullName: json["full_name"] == null ? null : json["full_name"],
        birthDate: json["birth_date"] == null ? null : json["birth_date"],
        age: json["age"] == null ? null : json["age"],
        country: json["country"] == null ? null : json["country"],
        countryImage: json["country_image"] == null ? null : json["country_image"],
        skills: json["skills"] == null ? null : json["skills"],
        language:
            json["language"] == null ? null : List<Language>.from(json["language"].map((x) => Language.fromJson(x))),
        religion: json["religion"] == null ? null : json["religion"],
        educationLevel: json["education_level"] == null ? null : json["education_level"],
        maritalStatus: json["marital_status"] == null ? null : json["marital_status"],
        readyForHireDate: json["ready_for_hire_date"] == null ? null : json["ready_for_hire_date"],
        experienceYears: json["experience_years"] == null ? null : json["experience_years"],
        experienceMonths: json["experience_months"] == null ? null : json["experience_months"],
        sallary: json["sallary"] == null ? null : json["sallary"],
        location: json["location"] == null ? null : json["location"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "helper_id": helperId == null ? null : helperId,
        "photo": photo == null ? null : photo,
        "full_name": fullName == null ? null : fullName,
        "birth_date": birthDate == null ? null : birthDate,
        "age": age == null ? null : age,
        "country": country == null ? null : country,
        "country_image": countryImage == null ? null : countryImage,
        "skills": skills == null ? null : skills,
        "language": language == null ? null : List<dynamic>.from(language!.map((x) => x.toJson())),
        "religion": religion == null ? null : religion,
        "education_level": educationLevel == null ? null : educationLevel,
        "marital_status": maritalStatus == null ? null : maritalStatus,
        "ready_for_hire_date": readyForHireDate == null ? null : readyForHireDate,
        "experience_years": experienceYears == null ? null : experienceYears,
        "experience_months": experienceMonths == null ? null : experienceMonths,
        "sallary": sallary == null ? null : sallary,
        "location": location == null ? null : location,
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
        question: json["question"] == null ? null : json["question"],
        answer: json["answer"] == null ? null : json["answer"],
        level: json["level"] == null ? null : json["level"],
      );

  Map<String, dynamic> toJson() => {
        "question": question == null ? null : question,
        "answer": answer == null ? null : answer,
        "level": level == null ? null : level,
      };
}
