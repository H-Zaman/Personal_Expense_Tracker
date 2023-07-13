import 'package:expensetracker/app/view/widget/bottom_sheet.dart';
import 'package:expensetracker/app/view/widget/menu_button.dart';
import 'package:expensetracker/utilites/localization/localization.dart';
import 'package:expensetracker/utilites/localization/translations.dart';
import 'package:expensetracker/utilites/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeSettingsView extends StatelessWidget {
  const HomeSettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MenuButton(
          title: Translated.switchObj.trParams({
            'obj' : Translated.theme.tr
          }),
          onTap: (){
            if(AppTheme.currentTheme == ThemeMode.light){
              AppTheme.updateTheme(ThemeMode.dark);
            }else{
              AppTheme.updateTheme(ThemeMode.light);
            }
          },
        ),
        MenuButton(
          title: Translated.switchObj.trParams({
            'obj' : Translated.language.tr
          }),
          onTap: (){
            AppBottomSheet.open(
              title: Translated.selectObj.trParams({
                'obj' : Translated.language.tr
              }),
              body: Translated.availableLocales.map((e) => MenuButton(
                title: Translated.switchToObj.trParams({
                  'obj' : e.languageCode.tr
                }),
                onTap: (){
                  Get.back();
                  AppLocalization.saveLocale(e);
                },
                label: Translated.active.tr,
              )).toList()
            );
          },
        ),
      ],
    );
  }
}