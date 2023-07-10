import 'package:auto_size_text/auto_size_text.dart';
import 'package:expensetracker/app/controller/expense_controller.dart';
import 'package:expensetracker/utilites/localization/translations.dart';
import 'package:expensetracker/utilites/text_style.dart';
import 'package:expensetracker/utilites/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeExpenseView extends StatelessWidget {
  const HomeExpenseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ExpenseController controller = Get.put(ExpenseController());
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Obx((){

        if(controller.loading) return CircularProgressIndicator();

        return Column(
          children: [
            Row(
              children: [
                Spacer(),
                IconButton(
                  onPressed: (){
                    if(AppTheme.currentTheme == ThemeMode.light){
                      AppTheme.updateTheme(ThemeMode.dark);
                    }else{
                      AppTheme.updateTheme(ThemeMode.light);
                    }
                  },
                  icon: Icon(
                    Icons.add_box
                  ),
                  iconSize: 32,
                )
              ],
            ),

            SizedBox(
              height: Get.height * .3,
              child: RichText(
                text: TextSpan(
                  text: Translated.spentThisObj.trParams({
                    'obj' : Translated.week.tr
                  }),
                  style: AppTextStyle.headline2(context),
                  children: [
                    WidgetSpan(child: SizedBox(width: 12)),
                    WidgetSpan(
                      child: Transform.translate(
                        offset: const Offset(0.0, -24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '৳',
                              style: AppTextStyle.title(context).copyWith(
                                fontWeight: FontWeight.bold,
                                height: .7
                              ),
                            ),
                            Text(
                              Translated.bdt.tr,
                              style: AppTextStyle.extraSmall(context).copyWith(
                                height: .7
                              )
                            ),
                          ],
                        ),
                      ),
                    ),
                    TextSpan(
                      text: controller.weekExpense.toString().split('.').first,
                      style: AppTextStyle.headline(context),
                    ),
                    WidgetSpan(
                      child: Transform.translate(
                        offset: const Offset(0.0, -34.0),
                        child: Text(
                          '●',
                          style: AppTextStyle.small(context),
                        ),
                      ),
                    ),
                    WidgetSpan(
                      child: Transform.translate(
                        offset: const Offset(0.0, -32.0),
                        child: Text(
                          controller.weekExpense.toString().split('.').last,
                          style: AppTextStyle.title(context).copyWith(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ]
                ),
                maxLines: 2,
              ),
            ),

          ],
        );
      }),
    );
  }
}