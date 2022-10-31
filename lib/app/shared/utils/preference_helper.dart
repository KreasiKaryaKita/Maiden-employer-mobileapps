// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PreferenceHelper {
  var _storage = const FlutterSecureStorage();

  Future<FlutterSecureStorage> initializePref() async {
    _storage = const FlutterSecureStorage();
    return _storage;
  }

  Future<void> set({
    required String key,
    required String value,
  }) async {
    await _storage.write(
      key: key,
      value: value,
    );
  }

  Future<String> get({required String key}) async {
    String value = "";
    try {
      value = (await _storage.read(key: key)) ?? "";
    } catch (err) {
      if (kDebugMode) {
        print('[err] get secure storage => $err');
      }
    }
    return value;
  }

  Future<void> delete(String key) async {
    try {
      await _storage.delete(key: key);
    } catch (err) {
      if (kDebugMode) {
        print('[err] delete => $err');
      }
    }
  }

  Future<Map<String, String>> getAll() async {
    var map = <String, String>{};
    try {
      map = await _storage.readAll();
    } catch (err) {
      if (kDebugMode) {
        print('[err] get all secure storage => $err');
      }
    }
    return map;
  }

  Future<void> deleteAll() async {
    try {
      await _storage.deleteAll();
    } catch (err) {
      if (kDebugMode) {
        print('[err]  => $err');
      }
    }
  }
}
