// ignore_for_file: overridden_fields, annotate_overrides
import 'dart:convert';

import 'package:maiden_employer/app/models/response_standard.dart';

class ResponseHelperDetail extends ResponseModel {
  ResponseHelperDetail({
    this.error,
    this.data,
    this.message,
  });

  final int? error;
  final HelperDetailModel? data;
  final List<String>? message;

  factory ResponseHelperDetail.fromRawJson(String str) => ResponseHelperDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResponseHelperDetail.fromJson(Map<String, dynamic> json) => ResponseHelperDetail(
        error: json["error"],
        data: json["data"] == null ? null : HelperDetailModel.fromJson(json["data"]),
        message: json["message"] == null ? null : List<String>.from(json["message"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "data": data == null ? null : data!.toJson(),
        "message": message == null ? null : List<dynamic>.from(message!.map((x) => x)),
      };
}

class HelperDetailModel {
  HelperDetailModel({
    this.id,
    this.helperId,
    this.firstname,
    this.lastname,
    this.photo,
    this.birthOfDate,
    this.age,
    this.country,
    this.countryName,
    this.countryImage,
    this.helperSkills,
    this.language,
    this.experience,
    this.vaccination,
    this.willingAbleTo,
  });

  final int? id;
  final String? helperId;
  final String? firstname;
  final String? lastname;
  final String? photo;
  final DateTime? birthOfDate;
  final int? age;
  final String? country;
  final String? countryName;
  final String? countryImage;
  final HelperSkills? helperSkills;
  final List<Language>? language;
  final List<Experience>? experience;
  final List<Vaccination>? vaccination;
  final List<WillingAbleTo>? willingAbleTo;

  factory HelperDetailModel.fromRawJson(String str) => HelperDetailModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HelperDetailModel.fromJson(Map<String, dynamic> json) => HelperDetailModel(
        id: json["id"] == null || (json["id"] is String && json["id"].isEmpty) ? null : json["id"],
        helperId: json["helper_id"] == null || (json["helper_id"] is String && json["helper_id"].isEmpty)
            ? null
            : json["helper_id"],
        firstname: json["firstname"] == null || (json["firstname"] is String && json["firstname"].isEmpty)
            ? null
            : json["firstname"],
        lastname: json["lastname"] == null || (json["lastname"] is String && json["lastname"].isEmpty)
            ? null
            : json["lastname"],
        photo: json["photo"] == null || (json["photo"] is String && json["photo"].isEmpty) ? null : json["photo"],
        birthOfDate: json["birth_of_date"] == null || (json["birth_of_date"] is String && json["birth_of_date"].isEmpty)
            ? null
            : DateTime.parse(json["birth_of_date"]),
        age: json["age"] == null || (json["age"] is String && json["age"].isEmpty) ? null : json["age"],
        country:
            json["country"] == null || (json["country"] is String && json["country"].isEmpty) ? null : json["country"],
        countryName: json["country_name"] == null || (json["country_name"] is String && json["country_name"].isEmpty)
            ? null
            : json["country_name"],
        countryImage:
            json["country_image"] == null || (json["country_image"] is String && json["country_image"].isEmpty)
                ? null
                : json["country_image"],
        helperSkills:
            json["helper_skills"] == null || (json["helper_skills"] is String && json["helper_skills"].isEmpty)
                ? null
                : HelperSkills.fromJson(json["helper_skills"]),
        language: json["language"] == null || (json["language"] is String && json["language"].isEmpty)
            ? null
            : List<Language>.from(json["language"].map((x) => Language.fromJson(x))),
        experience: json["experience"] == null
            ? null
            : List<Experience>.from(json["experience"].map((x) => Experience.fromJson(x))),
        vaccination: json["vaccination"] == null
            ? null
            : List<Vaccination>.from(json["vaccination"].map((x) => Vaccination.fromJson(x))),
        willingAbleTo: json["willing_able_to"] == null
            ? null
            : List<WillingAbleTo>.from(json["willing_able_to"].map((x) => WillingAbleTo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "helper_id": helperId,
        "firstname": firstname,
        "lastname": lastname,
        "photo": photo,
        "birth_of_date": birthOfDate == null ? null : birthOfDate!.toIso8601String(),
        "age": age,
        "country": country,
        "country_name": countryName,
        "country_image": countryImage,
        "helper_skills": helperSkills == null ? null : helperSkills!.toJson(),
        "language": language == null ? null : List<dynamic>.from(language!.map((x) => x.toJson())),
        "experience": experience == null ? null : List<dynamic>.from(experience!.map((x) => x.toJson())),
        "vaccination": vaccination == null ? null : List<dynamic>.from(vaccination!.map((x) => x.toJson())),
        "willing_able_to": willingAbleTo == null ? null : List<dynamic>.from(willingAbleTo!.map((x) => x.toJson())),
      };
}

class Experience {
  Experience({
    this.from,
    this.to,
    this.country,
    this.name,
    this.ethnicity,
    this.noOfPax,
    this.houseType,
    this.workDuties,
    this.reasonTermination,
  });

  final int? from;
  final int? to;
  final String? country;
  final String? name;
  final String? ethnicity;
  final String? noOfPax;
  final String? houseType;
  final List<WillingAbleTo>? workDuties;
  final String? reasonTermination;

  factory Experience.fromRawJson(String str) => Experience.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        from: json["from"],
        to: json["to"],
        country: json["country"],
        name: json["name"],
        ethnicity: json["ethnicity"],
        noOfPax: json["no_of_pax"],
        houseType: json["house_type"],
        workDuties: json["work_duties"] == null
            ? null
            : List<WillingAbleTo>.from(json["work_duties"].map((x) => WillingAbleTo.fromJson(x))),
        reasonTermination: json["reason_termination"],
      );

  Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "country": country,
        "name": name,
        "ethnicity": ethnicity,
        "no_of_pax": noOfPax,
        "house_type": houseType,
        "work_duties": workDuties == null ? null : List<dynamic>.from(workDuties!.map((x) => x.toJson())),
        "reason_termination": reasonTermination,
      };
}

class WillingAbleTo {
  WillingAbleTo({
    this.question,
    this.answer,
  });

  final String? question;
  final bool? answer;

  factory WillingAbleTo.fromRawJson(String str) => WillingAbleTo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WillingAbleTo.fromJson(Map<String, dynamic> json) => WillingAbleTo(
        question: json["question"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "answer": answer,
      };
}

class HelperSkills {
  HelperSkills({
    this.skillPriority1,
    this.skillPriority2,
    this.skillPriority3,
    this.skillPriority4,
    this.skillPriority5,
  });

  final String? skillPriority1;
  final String? skillPriority2;
  final String? skillPriority3;
  final String? skillPriority4;
  final String? skillPriority5;

  factory HelperSkills.fromRawJson(String str) => HelperSkills.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HelperSkills.fromJson(Map<String, dynamic> json) => HelperSkills(
        skillPriority1: json["skill_priority_1"],
        skillPriority2: json["skill_priority_2"],
        skillPriority3: json["skill_priority_3"],
        skillPriority4: json["skill_priority_4"],
        skillPriority5: json["skill_priority_5"],
      );

  Map<String, dynamic> toJson() => {
        "skill_priority_1": skillPriority1,
        "skill_priority_2": skillPriority2,
        "skill_priority_3": skillPriority3,
        "skill_priority_4": skillPriority4,
        "skill_priority_5": skillPriority5,
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

class Vaccination {
  Vaccination({
    this.status,
    this.vaccine,
  });

  final String? status;
  final List<Vaccine>? vaccine;

  factory Vaccination.fromRawJson(String str) => Vaccination.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Vaccination.fromJson(Map<String, dynamic> json) => Vaccination(
        status: json["status"],
        vaccine: json["vaccine"] == null ? null : List<Vaccine>.from(json["vaccine"].map((x) => Vaccine.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "vaccine": vaccine == null ? null : List<dynamic>.from(vaccine!.map((x) => x.toJson())),
      };
}

class Vaccine {
  Vaccine({
    this.date,
    this.type,
  });

  final DateTime? date;
  final String? type;

  factory Vaccine.fromRawJson(String str) => Vaccine.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Vaccine.fromJson(Map<String, dynamic> json) => Vaccine(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "date": date == null
            ? null
            : "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "type": type,
      };
}
