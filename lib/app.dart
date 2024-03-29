import 'package:expensetracker/app/view/home_screen.dart';
import 'package:expensetracker/splash_screen.dart';
import 'package:expensetracker/utilites/localization/localization.dart';
import 'package:expensetracker/utilites/localization/translations.dart';
import 'package:expensetracker/utilites/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      routes: {
        SplashScreen.route : (_) => SplashScreen(),
        HomeScreen.route : (_) => HomeScreen(),
      },
      builder: (_, child) => ScrollConfiguration(behavior: _NoOverScrollGlowScrollBehavior(), child: child!),
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: AppTheme.currentTheme,
      initialRoute: SplashScreen.route,
      translations: AppLocalization(),
      fallbackLocale: Translated.defaultLocale,
      supportedLocales: Translated.availableLocales,
      localizationsDelegates: [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
        MaterialLocalizationBnDelegate(),
        CupertinoLocalizationBnDelegate(),
      ],
    );
  }
}

class _NoOverScrollGlowScrollBehavior extends ScrollBehavior{
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) => child;
}