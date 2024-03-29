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
  static const String spentThisObj = 'spent_this_obj';
  static const String today = 'today';
  static const String day = 'day';
  static const String days = 'days';
  static const String week = 'week';
  static const String weeks = 'weeks';
  static const String month = 'month';
  static const String months = 'months';
  static const String year = 'year';
  static const String years = 'years';
  static const String bdt = 'BDT';
  static const String language = 'language';
  static const String switchObj = 'switch_obj';
  static const String switchToObj = 'switch_to_obj';
  static const String theme = 'theme';
  static const String light = 'light';
  static const String dark = 'dark';
  static const String selectObj = 'select_obj';
  static const String active = 'active';

}