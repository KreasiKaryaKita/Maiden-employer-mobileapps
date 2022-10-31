// ignore_for_file: annotate_overrides, prefer_if_null_operators, unnecessary_question_mark

abstract class ResponseModel {
  ResponseModel({
    this.error,
    this.data,
    this.message,
  });

  final Error? error;
  final dynamic? data;
  final String? message;
}

class ResponseStandard implements ResponseModel {
  ResponseStandard({
    this.error,
    this.data,
    this.message,
  });

  Error? error;
  dynamic data;
  String? message;

  factory ResponseStandard.fromJson(Map<String, dynamic> json) => ResponseStandard(
        error: Error.fromJson(json["error"]),
        data: json["message"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "error": error!.toJson(),
        "data": data.toJson(),
        "message": message,
      };
}

class Error {
  Error({
    this.code,
    this.message,
  });

  int? code;
  dynamic message;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": List<dynamic>.from(message.map((x) => x)),
      };
}
