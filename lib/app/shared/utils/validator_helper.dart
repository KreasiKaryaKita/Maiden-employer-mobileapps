// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:get/get_utils/src/extensions/internacionalization.dart';

class ValidatorHelper {
  static const bool isHappyFlow = false;

  static String? isEmpty(String value) {
    if (isHappyFlow) return null;

    if (value.isEmpty) {
      return 'Tolong isi bagian ini';
    } else {
      return null;
    }
  }

  static String? email(String value) {
    if (isHappyFlow) return null;

    String _pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(_pattern);
    if (value.isEmpty || !regex.hasMatch(value)) {
      return 'email_validation'.tr;
    } else {
      return null;
    }
  }

  static String? name(String value) {
    if (isHappyFlow) return null;

    if (value.isEmpty || value.trim().isEmpty) {
      return 'name_validation'.tr;
    } else {
      String _pattern = r'\d|[^\s\w]';
      RegExp regex = RegExp(_pattern);
      if (regex.hasMatch(value)) {
        return 'name_validation'.tr;
      } else {
        return null;
      }
    }
  }

  static String? phoneNumber(String value) {
    if (isHappyFlow) return null;

    String _pattern = r'^(?:0|\+?62)?([2-9]\d{8,12})$';
    RegExp regex = RegExp(_pattern);
    if (value.isEmpty || !regex.hasMatch(value)) {
      return 'Masukkan no. hp yang benar';
    } else {
      return null;
    }
  }

  static String? password(String value) {
    if (isHappyFlow) return null;

    String _pattern = r'^([a-zA-Z0-9]{8,})';
    RegExp _regex = RegExp(_pattern);
    if (value.isEmpty || !_regex.hasMatch(value)) {
      return 'password_validation'.tr;
    } else {
      return null;
    }
  }

  static String? passwordRepeat(String value, String firstPass) {
    if (isHappyFlow) return null;

    if (value == firstPass) {
      return null;
    } else {
      return 'confirm_password_validation'.tr;
    }
  }

  static String? numeric(String value) {
    if (isHappyFlow) return null;

    String _patternIsDigit = r'^([1-9]\d*(\,)\d*|0?(\,|)\d*[1-9]\d*|[1-9]\d*)$';
    RegExp _regexDigit = RegExp(_patternIsDigit);

    if (_regexDigit.hasMatch(value)) {
      return null;
    } else {
      return 'numeric_validation'.tr;
    }
  }
}
