import 'package:flutter/cupertino.dart';

class Translated{
  Translated._();
  static Locale get defaultLocale => localeEn;
  static List<Locale> get availableLocales => [
    localeEn,
    localeBn
  ];
  static const localeEn = Locale('en', 'US');
  static const localeBn = Locale('bn', 'BD');

  static const String expenseTracker = 'expense_tracker';

}