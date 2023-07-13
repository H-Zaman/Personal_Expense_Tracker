import 'package:expensetracker/utilites/localization/translations.dart';
import 'package:get/get.dart';

class ExpenseController extends GetxController{

  RxBool _loading = RxBool(true);
  bool get loading => _loading.value;

  num get homeExpense {
    return 123.34;
  }

  String get homeExpenseType{
    return Translated.month.tr;
  }

  @override
  void onInit() {
    super.onInit();
    getExpense().then((value) => _loading(false));
  }

  Future<void> getExpense() async{

  }
}