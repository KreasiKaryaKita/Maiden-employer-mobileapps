// To parse this JSON data, do
//
//     final responseHelperDetail = responseHelperDetailFromJson(jsonString);

import 'dart:convert';

import 'response_standard.dart';

class ResponseHelperDetail extends ResponseModel {
  ResponseHelperDetail({
    this.error,
    this.data,
    this.message,
  });

  final int? error;
  final Data? data;
  final List<String>? message;

  factory ResponseHelperDetail.fromRawJson(String str) => ResponseHelperDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResponseHelperDetail.fromJson(Map<String, dynamic> json) => ResponseHelperDetail(
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
  final Vaccination? vaccination;
  final List<Language>? willingAbleTo;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] == null ? null : json["id"],
        helperId: json["helper_id"] == null ? null : json["helper_id"],
        firstname: json["firstname"] == null ? null : json["firstname"],
        lastname: json["lastname"] == null ? null : json["lastname"],
        photo: json["photo"] == null ? null : json["photo"],
        birthOfDate: json["birth_of_date"] == null ? null : DateTime.parse(json["birth_of_date"]),
        age: json["age"] == null ? null : json["age"],
        country: json["country"] == null ? null : json["country"],
        countryName: json["country_name"] == null ? null : json["country_name"],
        countryImage: json["country_image"] == null ? null : json["country_image"],
        helperSkills: json["helper_skills"] == null ? null : HelperSkills.fromJson(json["helper_skills"]),
        language:
            json["language"] == null ? null : List<Language>.from(json["language"].map((x) => Language.fromJson(x))),
        experience: json["experience"] == null
            ? null
            : List<Experience>.from(json["experience"].map((x) => Experience.fromJson(x))),
        vaccination: json["vaccination"] == null ? null : Vaccination.fromJson(json["vaccination"]),
        willingAbleTo: json["willing_able_to"] == null
            ? null
            : List<Language>.from(json["willing_able_to"].map((x) => Language.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "helper_id": helperId == null ? null : helperId,
        "firstname": firstname == null ? null : firstname,
        "lastname": lastname == null ? null : lastname,
        "photo": photo == null ? null : photo,
        "birth_of_date": birthOfDate == null ? null : birthOfDate!.toIso8601String(),
        "age": age == null ? null : age,
        "country": country == null ? null : country,
        "country_name": countryName == null ? null : countryName,
        "country_image": countryImage == null ? null : countryImage,
        "helper_skills": helperSkills == null ? null : helperSkills!.toJson(),
        "language": language == null ? null : List<dynamic>.from(language!.map((x) => x.toJson())),
        "experience": experience == null ? null : List<dynamic>.from(experience!.map((x) => x.toJson())),
        "vaccination": vaccination == null ? null : vaccination!.toJson(),
        "willing_able_to": willingAbleTo == null ? null : List<dynamic>.from(willingAbleTo!.map((x) => x.toJson())),
      };
}

class Experience {
  Experience({
    this.fromYear,
    this.toYear,
    this.countryId,
    this.name,
    this.workDuties,
    this.reasonForTermination,
  });

  final int? fromYear;
  final int? toYear;
  final String? countryId;
  final String? name;
  final String? workDuties;
  final String? reasonForTermination;

  factory Experience.fromRawJson(String str) => Experience.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        fromYear: json["from_year"] == null ? null : json["from_year"],
        toYear: json["to_year"] == null ? null : json["to_year"],
        countryId: json["country_id"] == null ? null : json["country_id"],
        name: json["name"] == null ? null : json["name"],
        workDuties: json["work_duties"] == null ? null : json["work_duties"],
        reasonForTermination: json["reason_for_termination"] == null ? null : json["reason_for_termination"],
      );

  Map<String, dynamic> toJson() => {
        "from_year": fromYear == null ? null : fromYear,
        "to_year": toYear == null ? null : toYear,
        "country_id": countryId == null ? null : countryId,
        "name": name == null ? null : name,
        "work_duties": workDuties == null ? null : workDuties,
        "reason_for_termination": reasonForTermination == null ? null : reasonForTermination,
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
        skillPriority1: json["skill_priority_1"] == null ? null : json["skill_priority_1"],
        skillPriority2: json["skill_priority_2"] == null ? null : json["skill_priority_2"],
        skillPriority3: json["skill_priority_3"] == null ? null : json["skill_priority_3"],
        skillPriority4: json["skill_priority_4"] == null ? null : json["skill_priority_4"],
        skillPriority5: json["skill_priority_5"] == null ? null : json["skill_priority_5"],
      );

  Map<String, dynamic> toJson() => {
        "skill_priority_1": skillPriority1 == null ? null : skillPriority1,
        "skill_priority_2": skillPriority2 == null ? null : skillPriority2,
        "skill_priority_3": skillPriority3 == null ? null : skillPriority3,
        "skill_priority_4": skillPriority4 == null ? null : skillPriority4,
        "skill_priority_5": skillPriority5 == null ? null : skillPriority5,
      };
}

class Language {
  Language({
    this.question,
    this.answer,
  });

  final String? question;
  final String? answer;

  factory Language.fromRawJson(String str) => Language.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        question: json["question"] == null ? null : json["question"],
        answer: json["answer"] == null ? null : json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "question": question == null ? null : question,
        "answer": answer == null ? null : answer,
      };
}

class Vaccination {
  Vaccination();

  factory Vaccination.fromRawJson(String str) => Vaccination.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Vaccination.fromJson(Map<String, dynamic> json) => Vaccination();

  Map<String, dynamic> toJson() => {};
}
