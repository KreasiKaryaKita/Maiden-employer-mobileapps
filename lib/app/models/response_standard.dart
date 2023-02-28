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
        error: json["error"] is int ? json["error"] : 500,
        data: json["data"],
        message: json["message"] == null
            ? null
            : json["message"] is String
                ? [json["message"]]
                : List<String>.from(json["message"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "error": error is int ? error : 500,
        "data": data,
        "message": message == null
            ? null
            : message is String
                ? [message]
                : List<dynamic>.from(message!.map((x) => x)),
      };
}
