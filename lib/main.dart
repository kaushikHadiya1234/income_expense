import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:income_expense/Screen/Budget/add_budget_screen.dart';
import 'package:income_expense/Screen/Status/income_screen.dart';
import 'package:income_expense/Screen/View/appbar_screen.dart';
import 'package:income_expense/Screen/View/dash_screen.dart';
import 'package:income_expense/Screen/View/e_add_transaction.dart';
import 'package:income_expense/Screen/View/home_screen.dart';
import 'package:sizer/sizer.dart';

import 'Screen/View/i_add_transacation1.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) =>
          GetMaterialApp(debugShowCheckedModeBanner: false, routes: {
        '/': (p0) => DashScreen(),
        'home': (p0) => HomeScreen(),
        'add': (p0) => AddTransactionScreen(),
        'appbar': (p0) => AppbarScreen(),
        'income': (p0) => IncomeScreen(),
        'income1': (p0) => AddIncomeScreen1(),
        'addbudget': (p0) => AddBudgetScreen(),
      }),
    ),
  );
}
