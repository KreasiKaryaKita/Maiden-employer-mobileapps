// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

class SavedDataModel {
  SavedDataModel({
    this.email,
    this.name,
    this.fcmToken,
    this.deviceId,
  });

  final String? email;
  final String? name;
  final String? fcmToken;
  final String? deviceId;

  SavedDataModel copyWith({
    String? email,
    String? name,
    String? fcmToken,
    String? deviceId,
  }) =>
      SavedDataModel(
        email: email ?? this.email,
        name: name ?? this.name,
        fcmToken: fcmToken ?? this.fcmToken,
        deviceId: deviceId ?? this.deviceId,
      );

  factory SavedDataModel.fromRawJson(String str) => SavedDataModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SavedDataModel.fromJson(Map<String, dynamic> json) => SavedDataModel(
        email: json["email"] == null ? null : json["email"],
        name: json["name"] == null ? null : json["name"],
        fcmToken: json["fcm_token"] == null ? null : json["fcm_token"],
        deviceId: json["device_id"] == null ? null : json["device_id"],
      );

  Map<String, dynamic> toJson() => {
        "email": email == null ? null : email,
        "name": name == null ? null : name,
        "fcm_token": fcmToken == null ? null : fcmToken,
        "device_id": deviceId == null ? null : deviceId,
      };
}
