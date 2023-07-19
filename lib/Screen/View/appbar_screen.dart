import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:income_expense/Screen/Controller/income_controller.dart';
import 'package:income_expense/Screen/View/e_add_transaction1.dart';
import 'package:income_expense/Screen/View/e_add_transaction2.dart';
import 'package:income_expense/Screen/View/e_add_transaction3.dart';
import 'package:income_expense/Screen/View/i_add_transacation1.dart';
import 'package:income_expense/Screen/View/i_add_transacation2.dart';
import 'package:income_expense/Screen/View/i_add_transacation3.dart';
import 'package:sizer/sizer.dart';

import 'e_add_transaction.dart';

class AppbarScreen extends StatelessWidget {
  const AppbarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    IncomeController controller= Get.put(IncomeController());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          flexibleSpace:  Container(height:7.5.h,
              child: Column(
                children: [
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back_ios,color: Color(0xff1A3c40),),
                        Spacer(),
                        Text("Add transaction",style: TextStyle(color: Color(0xff1A3c40),fontWeight: FontWeight.bold,fontSize: 13.sp),),
                        Spacer(),
                      ],
                    ),
                  ),
                  Spacer(),
                  Obx(() =>  LinearProgressIndicator(backgroundColor:Colors.grey.shade200,color: Color(0xff1A3c40),value: controller.progress.value,)),
                ],
              )),
        ),
        body: Obx(
          () => IndexedStack(
            index: controller.i.value,
            children: [
              AddTransactionScreen(),
              AddTransactionScreen1(),
              AddTransactionScreen2(),
              AddTransactionScreen3(),
              AddIncomeScreen1(),
              AddIncomeScreen2(),
              AddIncomeScreen3(),
            ],
          ),
        ),
      ),
    );
  }
}
