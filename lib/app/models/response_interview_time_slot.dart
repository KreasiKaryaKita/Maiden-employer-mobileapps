// To parse this JSON data, do
//
//     final responseInterviewTimeSlot = responseInterviewTimeSlotFromJson(jsonString);

import 'dart:convert';

import 'package:maiden_employer/app/models/response_standard.dart';

class ResponseInterviewTimeSlot extends ResponseModel {
  ResponseInterviewTimeSlot({
    this.error,
    this.data,
    this.message,
  });

  final int? error;
  final Data? data;
  final List<String>? message;

  factory ResponseInterviewTimeSlot.fromRawJson(String str) => ResponseInterviewTimeSlot.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResponseInterviewTimeSlot.fromJson(Map<String, dynamic> json) => ResponseInterviewTimeSlot(
        error: json["error"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"] == null ? [] : List<String>.from(json["message"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "data": data?.toJson(),
        "message": message == null ? [] : List<dynamic>.from(message!.map((x) => x)),
      };
}

class Data {
  Data({
    this.list,
  });

  final List<InterviewTimeSlotModel>? list;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        list: json["list"] == null
            ? []
            : List<InterviewTimeSlotModel>.from(json["list"]!.map((x) => InterviewTimeSlotModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
      };
}

class InterviewTimeSlotModel {
  InterviewTimeSlotModel({
    this.time,
    this.timeLabel,
    this.timeStart,
    this.timeFinish,
    this.isAvailable,
  });

  final String? time;
  final String? timeLabel;
  final String? timeStart;
  final String? timeFinish;
  final bool? isAvailable;

  factory InterviewTimeSlotModel.fromRawJson(String str) => InterviewTimeSlotModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory InterviewTimeSlotModel.fromJson(Map<String, dynamic> json) => InterviewTimeSlotModel(
        time: json["time"],
        timeLabel: json["time_label"],
        timeStart: json["time_start"],
        timeFinish: json["time_finish"],
        isAvailable: json["is_available"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "time_label": timeLabel,
        "time_start": timeStart,
        "time_finish": timeFinish,
        "is_available": isAvailable,
      };
}
