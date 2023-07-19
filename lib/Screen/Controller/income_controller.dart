import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:income_expense/Screen/Model/income_model.dart';
import 'package:income_expense/utils/DB_helper.dart';
import 'package:intl/intl.dart';

class IncomeController extends GetxController {
  RxInt i = 0.obs;
  RxDouble progress = 0.0.obs;
  RxInt? selectcat = 0.obs;
  RxInt? selectcat1 = 0.obs;

  RxString? status = 'Income'.obs;
  RxString? name = 'Trip'.obs;
  RxString? category = 'Salary'.obs;
  RxString? amount = '20000'.obs;
  RxInt? tamount = 0.obs;
  RxInt? total_amount = 0.obs;

  RxString? d = '${DateTime.now()}'.obs;
  RxString? d1 = '${DateTime.now()}'.obs;
  RxString? d2= '${DateTime.now()}'.obs;

  RxList<IncomeModel> monthList = <IncomeModel>[
    IncomeModel(year: '2023', month: 'Jan'),
    IncomeModel(year: '2023', month: 'Feb'),
    IncomeModel(year: '2023', month: 'Mar'),
    IncomeModel(year: '2023', month: 'Apr'),
    IncomeModel(year: '2023', month: 'May'),
    IncomeModel(year: '2023', month: 'Jun'),
    IncomeModel(year: '2023', month: 'July'),
    IncomeModel(year: '2023', month: 'Aug'),
    IncomeModel(year: '2023', month: 'Sep'),
    IncomeModel(year: '2023', month: 'Oct'),
    IncomeModel(year: '2023', month: 'Nov'),
    IncomeModel(year: '2023', month: 'Dec'),
  ].obs;

  RxList<IncomeModel> expenseCategoryList = <IncomeModel>[
    IncomeModel(
      name: 'Car',
      icon: Icon(Icons.car_rental_outlined),
    ),
    IncomeModel(
      name: 'Education',
      icon: Icon(Icons.cast_for_education),
    ),
    IncomeModel(
      name: 'Phone',
      icon: Icon(Icons.phone_android_rounded),
    ),
    IncomeModel(
      name: 'Rent',
      icon: Icon(Icons.request_page_outlined),
    ),
    IncomeModel(
      name: 'Bill',
      icon: Icon(Icons.payment),
    ),
    IncomeModel(
      name: 'Fuel',
      icon: Icon(Icons.local_gas_station_outlined),
    ),
    IncomeModel(
      name: 'Travel',
      icon: Icon(Icons.airplanemode_on_outlined),
    ),
    IncomeModel(
      name: 'Grocery',
      icon: Icon(Icons.shopping_bag),
    ),
    IncomeModel(
      name: 'Tax',
      icon: Icon(Icons.percent),
    ),
    IncomeModel(
      name: 'Food',
      icon: Icon(Icons.food_bank_outlined),
    ),
    IncomeModel(
      name: 'Healthcare',
      icon: Icon(Icons.medication_liquid_sharp),
    ),
    IncomeModel(
      name: 'other',
      icon: Icon(
        Icons.add,
        color: Colors.black,
      ),
    ),
  ].obs;

  RxList<IncomeModel> incomeCategoryList = <IncomeModel>[
    IncomeModel(
      name: 'Salary',
      icon: Icon(Icons.shopping_bag_outlined),
      color: Colors.teal.shade50,
    ),
    IncomeModel(
        name: 'Freelance',
        icon: Icon(Icons.computer),
        color: Colors.teal.shade50),
    IncomeModel(
        name: 'investment',
        icon: Icon(Icons.candlestick_chart_outlined),
        color: Colors.teal.shade50),
    IncomeModel(
        name: 'Business',
        icon: Icon(Icons.business),
        color: Colors.teal.shade50),
    IncomeModel(
        name: 'Rental',
        icon: Icon(Icons.room_preferences),
        color: Colors.teal.shade50),
    IncomeModel(
        name: 'interest',
        icon: Icon(Icons.percent),
        color: Colors.teal.shade50),
    IncomeModel(
        name: 'Dividend',
        icon: Icon(Icons.call_split),
        color: Colors.teal.shade50),
    IncomeModel(
        name: 'other',
        icon: Icon(
          Icons.add,
          color: Colors.black,
        ),
        color: Colors.teal),
  ].obs;

  RxList readDataList = [].obs;
  RxList readnameDataList = [].obs;
  RxList budgetList = [].obs;

  Future<void> GetDbData() async {
    DBhelper dBhelper = DBhelper();
    readDataList.value = await dBhelper.readDB();
    readnameDataList.value = await dBhelper.readDB();
   totalincome();
    totleexpense();

  }

  Future<void> getfiltterData({cat, name, date1, date2})
  async {
    DBhelper dBhelper = DBhelper();
    readDataList.value=await dBhelper.filtterData(cat: cat, name: name, date1: date1, date2: date2);
  }

  String formateDate(DateTime dm) {
    // String datetime3 = DateFormat.MMMMEEEEd().format(datetime);
    var f = DateFormat('yyyy-MM-dd');
    return f.format(dm);
  }

  void totalincome() {
    int money = 0;

    for (int j = 0; j < readDataList.length; j++) {
      if (readDataList[j]['status'] == "Income") {
        money = money + int.parse(readDataList[j]['amount']);
      }
    }
    print('=================$money====================');
    tamount!.value = money;
    print('${tamount}');
  }

  void totleexpense() {
    int money = 0;

    for (int j = 0; j < readDataList.length; j++) {
      if (readDataList[j]['status'] == "Expense") {
        money = money + int.parse(readDataList[j]['amount']);
      }
    }
    print('=================$money====================');
    total_amount!.value = money;
    print('${tamount}');
  }
}
