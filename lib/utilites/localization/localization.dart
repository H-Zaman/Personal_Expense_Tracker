import 'dart:convert';
import 'package:expensetracker/utilites/localization/translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get_storage/get_storage.dart';

class AppLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {};

  static final _cache = _AppLocaleCache();

  static Future<void> init() async{
    await _cache.init();
    final translationStrings = await Future.wait([
      rootBundle.loadString('assets/translations/en_US.json'),
      rootBundle.loadString('assets/translations/bn_BD.json'),
    ]);

    final enMap = jsonDecode(translationStrings.first) as Map<String, dynamic>;
    final bnMap = jsonDecode(translationStrings.last) as Map<String, dynamic>;

    Map<String, String> enMapFinal = {};
    Map<String, String> bnMapFinal = {};

    enMap.forEach((key, value) {
      enMapFinal.addIf(true, key, value);
    });
    bnMap.forEach((key, value) {
      bnMapFinal.addIf(true, key, value);
    });

    Get.clearTranslations();
    Get.addTranslations({
      'en' : enMapFinal,
      'bn' : bnMapFinal
    });

    await Get.updateLocale(await _cache.getLocale());
  }

  static Future<void> saveLocale(Locale locale) async{
    await Get.updateLocale(locale);
    await _cache.saveLocale(locale);
  }
}

class _AppLocaleCache{
  final GetStorage _storage = GetStorage('_AppLocaleCache');

  Future<void> init () async=> await _storage.initStorage;

  Future<void> saveLocale(Locale locale) async => await _storage.write('_AppLocaleCache', locale.toString());

  Future<Locale> getLocale() async {
    if(_storage.hasData('_AppLocaleCache')){
      return Locale.fromSubtags(
        languageCode: _storage.read('_AppLocaleCache')
      );
    }else{
      return Translated.defaultLocale;
    }
  }
}