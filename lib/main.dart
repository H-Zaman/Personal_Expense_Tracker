import 'package:expensetracker/app.dart';
import 'package:expensetracker/utilites/localization/localization.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await AppLocalization.init();

  runApp(const App());
}