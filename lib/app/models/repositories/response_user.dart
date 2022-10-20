// ignore_for_file: prefer_if_null_operators, annotate_overrides

import 'dart:convert';

import 'response_standard.dart';

class ResponseUser implements ResponseModel {
  ResponseUser({
    this.status,
    this.message,
    this.data,
  });

  final int? status;
  final String? message;
  final User? data;

  factory ResponseUser.fromRawJson(String str) => ResponseUser.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResponseUser.fromJson(Map<String, dynamic> json) => ResponseUser(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : User.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
      };
}

class User {
  User({
    this.id,
    this.name,
    this.password,
    this.phone,
    this.imageProfile,
    this.imageHeader,
    this.status,
    this.address,
    this.isLeader,
    this.isUpdatedPassword,
    this.createdAt,
    this.updatedAt,
    this.accessKey,
  });

  final int? id;
  final String? name;
  final String? password;
  final String? phone;
  final String? imageProfile;
  final String? imageHeader;
  final String? status;
  final String? address;
  final bool? isLeader;
  final bool? isUpdatedPassword;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? accessKey;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        password: json["password"] == null ? null : json["password"],
        phone: json["phone"] == null ? null : json["phone"],
        imageProfile: json["image_profile"] == null ? null : json["image_profile"],
        imageHeader: json["image_header"] == null ? null : json["image_header"],
        status: json["status"] == null ? null : json["status"],
        address: json["address"] == null ? null : json["address"],
        isLeader: json["is_leader"] == null ? null : json["is_leader"],
        isUpdatedPassword: json["is_updated_password"] == null ? null : json["is_updated_password"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        accessKey: json["access_key"] == null ? null : json["access_key"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "password": password == null ? null : password,
        "phone": phone == null ? null : phone,
        "image_profile": imageProfile == null ? null : imageProfile,
        "image_header": imageHeader == null ? null : imageHeader,
        "status": status == null ? null : status,
        "address": address == null ? null : address,
        "is_leader": isLeader == null ? null : isLeader,
        "is_updated_password": isUpdatedPassword == null ? null : isUpdatedPassword,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "access_key": accessKey == null ? null : accessKey,
      };
}
