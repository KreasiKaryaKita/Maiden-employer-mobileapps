// ignore_for_file: annotate_overrides, prefer_if_null_operators, unnecessary_question_mark

abstract class ResponseModel {
  ResponseModel({
    this.error,
    this.data,
    this.message,
  });

  final int? error;
  final dynamic data;
  final List<String>? message;
}

class ResponseStandard implements ResponseModel {
  ResponseStandard({
    this.error,
    this.data,
    this.message,
  });

  int? error;
  dynamic data;
  List<String>? message;

  factory ResponseStandard.fromJson(Map<String, dynamic> json) => ResponseStandard(
        error: json["error"],
        data: json["data"],
        message: List<String>.from(json["message"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "data": data.toJson(),
        "message": List<dynamic>.from(message!.map((x) => x)),
      };
}
