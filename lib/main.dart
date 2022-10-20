import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:get/get.dart';

import 'app/config/languages/app_languages.dart';
import 'app/config/themes/app_themes.dart';
import 'app/routes/app_pages.dart';
import 'app/shared/common/common_controller.dart';
import 'app/shared/utils/preference_helper.dart';

final CommonController commonController = Get.put(CommonController(), permanent: true);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceHelper.initializePref();
  commonController.onInit();
  await dotenv.load(fileName: ".env");

  runApp(
    GetMaterialApp(
      title: "Maiden Employer",
      theme: AppThemes.lightTheme(),
      darkTheme: AppThemes.darkTheme(),
      themeMode: AppThemes().init(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      locale: const Locale('id', 'ID'),
      fallbackLocale: const Locale('en', 'US'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('id', 'ID'),
      ],
      translations: AppLanguages(),
    ),
  );
}
