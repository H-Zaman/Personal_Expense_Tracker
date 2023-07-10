import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expensetracker/app/view/home_expense_view.dart';
import 'package:expensetracker/app/view/home_history_view.dart';
import 'package:expensetracker/app/view/settings_view.dart';

class HomeController extends GetxController{
  PageController pageViewController = PageController();
  RxInt pageViewIndex = RxInt(0);

  final homeViews = [
    HomeExpenseView(),
    HomeHistoryView(),
    HomeSettingsView()
  ];

}