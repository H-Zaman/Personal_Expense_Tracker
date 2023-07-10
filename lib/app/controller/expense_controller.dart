import 'package:get/get.dart';

class ExpenseController extends GetxController{

  RxBool _loading = RxBool(true);
  bool get loading => _loading.value;

  num get weekExpense {

    return 123.34;
  }

  @override
  void onInit() {
    super.onInit();
    getExpense().then((value) => _loading(false));
  }

  Future<void> getExpense() async{

  }
}