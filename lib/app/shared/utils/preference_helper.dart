// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:get_storage/get_storage.dart';

import '../../../main.dart';
import '../../config/constants/preference_constant.dart';
import '../../models/entities/saved_data_model.dart';
import '../../models/repositories/response_user.dart';

class PreferenceHelper {
  final box = GetStorage();

  /// INITIALIZE PREFERENCE HELPER
  static initializePref() async {
    await GetStorage.init();
  }

  /// Language Preference Section
  void setLanguage(String langCode) async => await box.write(PreferenceConstant.LANGUAGE, langCode);

  String get getLanguage => box.read(PreferenceConstant.LANGUAGE) ?? '';

  /// OnBoarding Preference Section
  void setOnBoarding(bool isDone) async => await box.write(PreferenceConstant.ONBOARING, isDone);

  /// return true if user ever done on boarding
  bool get getOnBoarding => box.read(PreferenceConstant.ONBOARING) ?? false;

  /// User Preference Section

  void setUserEmpty() async => await box.remove(PreferenceConstant.USER);

  void setUser(User user) => box.write(PreferenceConstant.USER, user.toRawJson());

  User? get getUser {
    String? _temp = box.read(PreferenceConstant.USER);
    return _temp != null && _temp.isNotEmpty ? User.fromRawJson(_temp) : null;
  }

  /// User Token Preference Section

  void setUserTokenEmpty() => box.remove(PreferenceConstant.USER_TOKEN);

  void setUserToken(String token) => box.write(PreferenceConstant.USER_TOKEN, token);

  String get getUserToken => box.read(PreferenceConstant.USER_TOKEN) ?? '';

  /// User Token Refresh Preference Section

  void setUserTokenRefreshEmpty() => box.remove(PreferenceConstant.USER_REFRESH_TOKEN);

  void setUserRefreshToken(String refreshToken) async =>
      await box.write(PreferenceConstant.USER_REFRESH_TOKEN, refreshToken);

  String get getUserRefreshToken => box.read(PreferenceConstant.USER_REFRESH_TOKEN) ?? '';

  /// Saved Data Preference Section

  void setSavedDataEmpty() async {
    await box.remove(PreferenceConstant.SAVED_DATAS);
    commonController.getSavedData();
  }

  void setSavedData(SavedDataModel data) {
    box.write(PreferenceConstant.SAVED_DATAS, data.toRawJson());
    commonController.getSavedData();
  }

  SavedDataModel? get getSavedData {
    String? _temp = box.read(PreferenceConstant.SAVED_DATAS);
    return _temp != null && _temp.isNotEmpty ? SavedDataModel.fromRawJson(_temp) : SavedDataModel();
  }
}
