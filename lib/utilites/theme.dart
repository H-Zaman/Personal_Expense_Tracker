import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppTheme{

  static final _appThemeCache = _AppThemeCache();

  static Future<void> init() async{
    await _appThemeCache.init();
    await updateTheme(await _appThemeCache.getThemeMode());
  }

  static ThemeMode currentTheme = ThemeMode.light;

  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: Colors.white
  );
  static ThemeData dark = ThemeData(
    scaffoldBackgroundColor: Color(0xff000814)
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