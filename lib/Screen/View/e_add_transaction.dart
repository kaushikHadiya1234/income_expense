import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:income_expense/Screen/Model/income_model.dart';
import 'package:income_expense/Screen/View/home_screen.dart';
import 'package:sizer/sizer.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({Key? key}) : super(key: key);

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}



class _AddTransactionScreenState extends State<AddTransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Image.asset('assets/images/d.jpg'),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text('What Kind of\ntransaction it is?',style: TextStyle(fontSize: 15.sp,color:  Color(0xff1A3c40),fontWeight: FontWeight.bold,letterSpacing: 1.8),),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                        controller.progress.value=0.33;
                        // IncomeExpenseModel m=IncomeExpenseModel(
                            controller.status!.value= 'Income';
                        // );
                        controller.i.value=4;
                    },
                    child: Container(
                      height: 25.h,
                      width: 50.w,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/income.png',height: 13.h,color: Colors.teal.shade300,),
                            SizedBox(height: 15),
                            Text('Income',style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      controller.progress.value=0.33;
                      controller.status!.value= 'Expense';
                      controller.i.value=1;
                    },
                    child: Container(
                      height: 25.h,
                      width: 50.w,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/expense.png',height: 13.h,color: Colors.amber.shade200,),
                            SizedBox(height: 15),
                            Text('Expense',style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
