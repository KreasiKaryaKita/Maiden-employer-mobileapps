import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyHelpers {
  static Future<bool> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }

  static bool validateIsEmpty(String value) {
    if (value.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  static bool validateEmail(String str) {
    final validCharacters = RegExp(
      "^([0-9a-zA-Z]([-.+\\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\\w]*[0-9a-zA-Z]\\.)+[a-zA-Z]{2,9})\$",
    );
    if (str == "") {
      return false;
    }
    return validCharacters.hasMatch(str);
  }

  static bool validateInputPassword(String value) {
    String pattern = r'^([a-zA-Z0-9]{8,})';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return false;
    } else {
      return regExp.hasMatch(value);
    }
  }

  static bool validateInputPhoneNumber(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,20}$)';
    RegExp regExp = RegExp(patttern);
    if (value.isEmpty) {
      return false;
    } else {
      return regExp.hasMatch(value);
    }
  }

  static bool validateInputNIK(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{16,16}$)';
    RegExp regExp = RegExp(patttern);
    if (value.isEmpty) {
      return false;
    } else {
      return regExp.hasMatch(value);
    }
  }

  static bool validateInputPostalCode(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{5,5}$)';
    RegExp regExp = RegExp(patttern);
    if (value.isEmpty) {
      return false;
    } else {
      return regExp.hasMatch(value);
    }
  }

  static renderDivider({
    Color color = const Color(0xFFDEDEDE),
    double height = 1,
  }) {
    return Container(
      height: height,
      color: color,
    );
  }

  static String nameInitialBuilder(String text) {
    var listText = text.split(' ');
    String initial = '';

    for (var item in listText) {
      initial = initial + item[0];
      if (initial.isNotEmpty) {
        break;
      }
    }

    return initial;
  }

  static convertFormatNumber(int value) {
    final formatCurrency = NumberFormat("#,##0", "ID");
    if (value == 0) {
      return "0";
    }
    return formatCurrency.format(value).toString();
  }

  static getSizeFile(String path) {
    final fileUri = File(path);
    final fileBytes = fileUri.lengthSync();
    double sizeInMb = fileBytes / 1000000;
    double sizeInKb = fileBytes / 1000;
    var result = {
      "size_in_MB": sizeInMb,
      "size_in_KB": sizeInKb,
    };
    return result;
  }
}
