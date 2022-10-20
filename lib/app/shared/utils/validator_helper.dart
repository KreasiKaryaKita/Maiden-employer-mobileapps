// ignore_for_file: no_leading_underscores_for_local_identifiers

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
      return 'Masukkan email yang benar cth. john@mail.com';
    } else {
      return null;
    }
  }

  static String? nisn(String value) {
    if (isHappyFlow) return null;

    if (value.isEmpty || value.trim().isEmpty) {
      return 'Masukkan nisn';
    } else {
      if (value.length == 10) {
        return numeric(value);
      } else {
        return 'Masukkan panjang nisn yang benar';
      }
    }
  }

  static String? name(String value) {
    if (isHappyFlow) return null;

    if (value.isEmpty || value.trim().isEmpty) {
      return 'Masukkan nama yang benar';
    } else {
      String _pattern = r'\d|[^\s\w]';
      RegExp regex = RegExp(_pattern);
      if (regex.hasMatch(value)) {
        return 'Masukkan nama yang benar';
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

    String _pattern = r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$';
    // String _pattern = r'^([a-zA-Z0-9]{4,})';
    RegExp _regex = RegExp(_pattern);
    if (value.isEmpty || !_regex.hasMatch(value)) {
      return 'Masukkan min 8 karakter dengan huruf besar dan angka';
    } else {
      return null;
    }
  }

  static String? passwordRepeat(String value, String firstPass) {
    if (isHappyFlow) return null;

    String? _temp = password(value);
    if (_temp == null) {
      if (value == firstPass) {
        return null;
      } else {
        return 'Kata sandi tidak sama';
      }
    } else {
      return _temp;
    }
  }

  static String? numeric(String value) {
    if (isHappyFlow) return null;

    String _patternIsDigit = r'^([1-9]\d*(\,)\d*|0?(\,|)\d*[1-9]\d*|[1-9]\d*)$';
    RegExp _regexDigit = RegExp(_patternIsDigit);

    if (value.isEmpty || _regexDigit.hasMatch(value)) {
      return null;
    } else {
      return 'Masukkan nomor yang benar';
    }
  }
}
