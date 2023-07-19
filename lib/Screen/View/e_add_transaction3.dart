import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:income_expense/Screen/Model/income_model.dart';
import 'package:income_expense/Screen/View/home_screen.dart';
import 'package:income_expense/utils/DB_helper.dart';
import 'package:sizer/sizer.dart';

class AddTransactionScreen3 extends StatefulWidget {
  const AddTransactionScreen3({Key? key}) : super(key: key);

  @override
  State<AddTransactionScreen3> createState() => _AddTransactionScreen3State();
}

class _AddTransactionScreen3State extends State<AddTransactionScreen3> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          Image.asset('assets/images/t.png'),
          Text("Congratulation",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold,color: Color(0xff1A3c40)),),
          SizedBox(height: 10),
          Text("Your transaction is added successfully",style: TextStyle(fontSize: 12.sp,color: Color(0xff1A3c40)),),
          Text("in expencs",style: TextStyle(fontSize: 12.sp,color: Color(0xff1A3c40)),),
          SizedBox(height: 10),
          Spacer(),
          Container(
            height: 32.h,
            width: 80.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Payee'),
                SizedBox(height: 3),
                Text("${controller.name}",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold,color: Color(0xff1A3c40)),),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Transaction type",
                          style: TextStyle(color: Colors.grey, fontSize: 10.sp),
                        ),
                        Text(
                          "${controller.status}",
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: Color(0xff1A3c40),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      height: 5.h,
                      width: 0.4.w,
                      color: Colors.grey,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Date",
                          style: TextStyle(color: Colors.grey, fontSize: 10.sp),
                        ),
                        Text(
                          "${controller.d}",
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: Color(0xff1A3c40),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text("------------------------------",style: TextStyle(color: Colors.grey,fontSize: 20.sp,letterSpacing: 3),),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Transaction Amount",
                          style: TextStyle(color: Colors.grey, fontSize: 10.sp),
                        ),
                        Text(
                          "${controller.amount}",
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: Color(0xff1A3c40),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    OutlinedButton(onPressed: (){
                      controller.progress.value=0;
                      controller.i.value=0;
                    }, child: Text("Edit",style: TextStyle(color: Color(0xff1A3c40)),))
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          InkWell(
            onTap: () {
              IncomeExpenseModel m = IncomeExpenseModel(
                name: controller.name!.value,
                category: controller.category!.value,
                status: controller.status!.value,
                amount: controller.amount!.value,
                date: controller.d!.value,);
              DBhelper d = DBhelper();
              d.insertDb(m);
              controller.GetDbData();
              Get.back();
            },
            child: Container(
              alignment: Alignment.center,
              child: Container(
                height: 7.h,
                width: 90.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xcd1a3c40),
                ),
                child: Text(
                  "Go to home",
                  style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,)
        ],
      ),
    ),);
  }
}
