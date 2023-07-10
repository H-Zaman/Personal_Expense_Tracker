import 'package:expensetracker/app/view/home_screen.dart';
import 'package:expensetracker/splash_screen.dart';
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
      initialRoute: SplashScreen.route,
    );
  }
}