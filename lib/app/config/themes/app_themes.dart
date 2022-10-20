// ignore_for_file: unused_field

import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  static final String _fontFamily = "SF-Pro";

  static final TextTheme _lightTextTheme = TextTheme(
    overline: TextStyle(fontFamily: _fontFamily),
    headline1: TextStyle(fontSize: 20.0, fontFamily: _fontFamily),
    bodyText1: TextStyle(fontSize: 16.0, fontFamily: _fontFamily),
    bodyText2: TextStyle(fontSize: 14.0, fontFamily: _fontFamily),
    button: TextStyle(fontSize: 15.0, fontFamily: _fontFamily),
    headline6: TextStyle(fontSize: 16.0, fontFamily: _fontFamily),
    subtitle1: TextStyle(fontSize: 16.0, fontFamily: _fontFamily),
    caption: TextStyle(fontSize: 12.0, fontFamily: _fontFamily),
  );

  static final TextTheme _darkTextTheme = TextTheme(
    overline: TextStyle(fontFamily: _fontFamily),
    headline1: TextStyle(fontSize: 20.0, fontFamily: _fontFamily),
    bodyText1: TextStyle(fontSize: 16.0, fontFamily: _fontFamily),
    bodyText2: TextStyle(fontSize: 14.0, fontFamily: _fontFamily),
    button: TextStyle(fontSize: 15.0, fontFamily: _fontFamily),
    headline6: TextStyle(fontSize: 16.0, fontFamily: _fontFamily),
    subtitle1: TextStyle(fontSize: 16.0, fontFamily: _fontFamily),
    caption: TextStyle(fontSize: 12.0, fontFamily: _fontFamily),
  );

  static final ThemeData _lightTheme = ThemeData(
      fontFamily: _fontFamily,
      errorColor: Colors.red[500],
      scaffoldBackgroundColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary_60,
        selectedLabelStyle: TextStyle(fontSize: 12, color: AppColors.primary_60, fontWeight: FontWeight.w400),
        unselectedLabelStyle: TextStyle(fontSize: 12, color: AppColors.neutral_80, fontWeight: FontWeight.w400),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Color.fromRGBO(225, 70, 74, 1)),
      appBarTheme: AppBarTheme(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 1,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700, wordSpacing: 1.2),
      ),
      tabBarTheme: TabBarTheme(
          indicator: BoxDecoration(
        color: AppColors.primary_20,
        border: Border(bottom: BorderSide(color: Colors.white, width: 2)),
      )),
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.neutral_40),
          errorStyle: TextStyle(fontSize: 10),
          errorMaxLines: 2),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: AppColors.primary_20),
      chipTheme: ChipThemeData(
          backgroundColor: Colors.white,
          disabledColor: Colors.grey.withOpacity(0.2),
          selectedColor: AppColors.primary_20,
          secondarySelectedColor: AppColors.primary_20,
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          labelStyle: TextStyle(),
          side: BorderSide(color: AppColors.primary_20, width: 1.5),
          secondaryLabelStyle: TextStyle(),
          checkmarkColor: Colors.white,
          brightness: Brightness.light),
      colorScheme: const ColorScheme.light(primary: AppColors.primary_60, secondary: AppColors.primary_20),
      iconTheme: const IconThemeData(color: Colors.black),
      popupMenuTheme: const PopupMenuThemeData(color: Colors.grey),
      textTheme: _lightTextTheme,
      radioTheme: RadioThemeData(fillColor: MaterialStateProperty.resolveWith((states) {
        if (!states.contains(MaterialState.selected)) {
          return AppColors.neutral_50;
        }
        return AppColors.primary_60;
      })));

  static final ThemeData _darkTheme = ThemeData();

  static ThemeData lightTheme() {
    return _lightTheme;
  }

  static ThemeData darkTheme() {
    return _darkTheme;
  }

  ThemeMode init() {
    return ThemeMode.light;
  }
}
