import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppTheme{

  static final _appThemeCache = _AppThemeCache();

  static Future<void> init() async{
    await _appThemeCache.init();
    await updateTheme(await _appThemeCache.getThemeMode());
  }

  static ThemeMode currentTheme = ThemeMode.light;

  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: AppColors.dark,
    textTheme: GoogleFonts.ralewayTextTheme(TextTheme(
      /// headline
      labelLarge: TextStyle(
        color: AppColors.dark,
        fontSize: 62,
        fontWeight: FontWeight.bold
      ),
      /// headline2
      labelMedium: TextStyle(
        color: AppColors.dark,
        fontSize: 52,
        fontWeight: FontWeight.bold
      ),
      /// title
      titleMedium: TextStyle(
        color: AppColors.dark,
        fontSize: 24,
      ),
      /// regular
      bodyLarge: TextStyle(
        color: AppColors.dark,
        fontSize: 18
      ),
      /// medium
      bodyMedium: TextStyle(
        color: AppColors.dark,
        fontSize: 16
      ),
      /// small
      bodySmall: TextStyle(
        color: AppColors.dark,
        fontSize: 14
      ),
      /// extra-small
      labelSmall: TextStyle(
        color: AppColors.dark,
        fontSize: 10
      ),
      /// extra-small-inverted
      displaySmall: TextStyle(
        color: Colors.white,
        fontSize: 10
      ),
    )),
    iconTheme: IconThemeData(
      color: AppColors.dark
    ),
    listTileTheme: ListTileThemeData(
      iconColor: AppColors.dark
    )
  );

  static ThemeData dark = ThemeData(
    scaffoldBackgroundColor: AppColors.dark,
    primaryColor: Colors.white,
    textTheme: GoogleFonts.ralewayTextTheme(TextTheme(
      /// headline
      labelLarge: TextStyle(
        color: Colors.white,
        fontSize: 62,
        fontWeight: FontWeight.bold
      ),
      /// headline2
      labelMedium: TextStyle(
        color: Colors.white,
        fontSize: 52,
        fontWeight: FontWeight.bold
      ),
      /// title
      titleMedium: TextStyle(
        color: Colors.white,
        fontSize: 24,
      ),
      /// regular
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 18
      ),
      /// medium
      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 16
      ),
      /// small
      bodySmall: TextStyle(
        color: Colors.white,
        fontSize: 14
      ),
      /// extra-small
      labelSmall: TextStyle(
        color: Colors.white,
        fontSize: 10
      ),
      /// extra-small-inverted
      displaySmall: TextStyle(
        color: AppColors.dark,
        fontSize: 10
      ),
    )),
    iconTheme: IconThemeData(
      color: Colors.white
    ),
    listTileTheme: ListTileThemeData(
      iconColor: Colors.white
    )
  );

  static Future<void> updateTheme(ThemeMode theme) async{
    currentTheme = theme;
    Get.changeThemeMode(theme);
    await _appThemeCache.saveThemeMode(theme);
  }
}

class _AppThemeCache{
  final GetStorage _storage = GetStorage('_AppThemeCache');

  Future<void> init () async=> await _storage.initStorage;

  Future<void> saveThemeMode(ThemeMode mode) async => await _storage.write('_AppThemeCache', mode.name);

  Future<ThemeMode> getThemeMode() async {
    if(_storage.hasData('_AppThemeCache')){
      return ThemeMode.values.firstWhere((element) => element.name == _storage.read('_AppThemeCache'));
    }else{
      return ThemeMode.light;
    }
  }
}