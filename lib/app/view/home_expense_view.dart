import 'package:expensetracker/app/controller/expense_controller.dart';
import 'package:expensetracker/app/view/widget/expense_list_tile.dart';
import 'package:expensetracker/utilites/localization/translations.dart';
import 'package:expensetracker/utilites/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class HomeExpenseView extends StatefulWidget {
  const HomeExpenseView({Key? key}) : super(key: key);

  @override
  State<HomeExpenseView> createState() => _HomeExpenseViewState();
}

class _HomeExpenseViewState extends State<HomeExpenseView> {

  ExpenseController controller = Get.put(ExpenseController());

  ScrollController _scrollController = ScrollController();

  RxBool expenseShowFull = RxBool(true);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if(_scrollController.position.userScrollDirection == ScrollDirection.reverse){
        expenseShowFull(false);
      }else{
        expenseShowFull(true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Obx((){

        if(controller.loading) return CircularProgressIndicator();

        return Column(
          children: [
            AnimatedCrossFade(
              firstCurve: Curves.bounceInOut,
              secondCurve: Curves.bounceInOut,
              sizeCurve: Curves.bounceInOut,
              firstChild: RichText(
                text: TextSpan(
                  text: Translated.spentThisObj.trParams({
                      'obj' : controller.homeExpenseType
                    }),
                  style: AppTextStyle.headline2(context),
                  children: [
                    WidgetSpan(child: SizedBox(width: 12)),
                    WidgetSpan(
                      child: Transform.translate(
                        offset: const Offset(0.0, -18.0),
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
                                height: .7,
                                fontWeight: FontWeight.bold
                              )
                            ),
                          ],
                        ),
                      ),
                    ),
                    TextSpan(
                      text: controller.homeExpense.toString().split('.').first,
                      style: AppTextStyle.headline(context),
                    ),
                    WidgetSpan(
                      child: Transform.translate(
                        offset: const Offset(0.0, -20.0),
                        child: Text(
                          '●',
                          style: AppTextStyle.small(context),
                        ),
                      ),
                    ),
                    WidgetSpan(
                      child: Transform.translate(
                        offset: const Offset(0.0, -28.0),
                        child: Text(
                          controller.homeExpense.toString().split('.').last,
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
              secondChild: Column(
                children: [
                  Text(
                    Translated.spentThisObj.trParams({
                      'obj' : controller.homeExpenseType
                    }),
                    style: AppTextStyle.small(context),
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(height: 14),
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
                              height: .7,
                              fontWeight: FontWeight.bold
                            )
                          ),
                        ],
                      ),
                      Text(
                        controller.homeExpense.toString().split('.').first,
                        style: AppTextStyle.headline(context).copyWith(
                          height: .9
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          '●',
                          style: AppTextStyle.small(context),
                        ),
                      ),
                      Text(
                        controller.homeExpense.toString().split('.').last,
                        style: AppTextStyle.title(context).copyWith(
                          fontWeight: FontWeight.bold
                        )
                      )
                    ],
                  ),
                ],
              ),
              crossFadeState: expenseShowFull.value ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: Duration(milliseconds: 400),
              reverseDuration: Duration(milliseconds: 400),
            ),

            SizedBox(height: 12),

            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: 20,
                shrinkWrap: true,
                itemBuilder: (_, index) => ExpenseListTile(),
              ),
            )
          ],
        );
      }),
    );
  }
}