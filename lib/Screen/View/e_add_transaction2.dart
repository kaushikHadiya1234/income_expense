import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:income_expense/Screen/Model/income_model.dart';
import 'package:income_expense/Screen/View/home_screen.dart';
import 'package:income_expense/utils/DB_helper.dart';
import 'package:sizer/sizer.dart';

class AddTransactionScreen2 extends StatefulWidget {
  const AddTransactionScreen2({Key? key}) : super(key: key);

  @override
  State<AddTransactionScreen2> createState() => _AddTransactionScreen2State();
}

class _AddTransactionScreen2State extends State<AddTransactionScreen2> {
  TextEditingController txtamount = TextEditingController();
  var txtkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controller.d!.value=controller.formateDate(DateTime.now());
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: txtkey,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Container(
                    height: 7.h,
                    width: 7.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      'assets/images/expense.png',
                      color: Colors.amber.shade200,
                      height: 5.h,
                    ),
                  ),
                  title: Text(
                    "Transaction type",
                    style: TextStyle(color: Colors.grey, fontSize: 10.sp),
                  ),
                  subtitle: Text(
                    "Expense",
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  leading: Container(
                    height: 7.h,
                    width: 7.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.teal.shade50),
                    child: Icon(Icons.airplanemode_on_outlined),
                  ),
                  title: Text(
                    "Payee",
                    style: TextStyle(color: Colors.grey, fontSize: 10.sp),
                  ),
                  subtitle: Text(
                    "${controller.category!.value}",
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Amount",
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    validator: (value) {
                      if(value!.isEmpty)
                      {
                        return "Enter the amount";
                      }

                    },
                    controller: txtamount,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.sp),
                            borderSide: BorderSide(color: Colors.grey)
                        ),
                        focusedBorder:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.sp),
                            borderSide: BorderSide(color: Colors.grey)
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 3,horizontal: 15),
                        hintText: "Enter Amount",
                        hintStyle: TextStyle(

                          fontWeight: FontWeight.bold,
                          color: Color(0xff1A3c40),
                        )),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Date",
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: InkWell(
                    onTap: () async {
                      DateTime? pickdate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2050));
                      controller.d!.value=controller.formateDate(pickdate!);
                    },
                    child: Container(
                      height: 6.5.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Row(
                          children: [
                            Icon(Icons.calendar_month_rounded),
                            SizedBox(width: 5),
                            Obx(() => Text("${controller.d!.value}"))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                InkWell(
                  onTap: () {
                   if(txtkey.currentState!.validate())
                     {
                       controller.progress.value = 1;
                       controller.amount!.value = txtamount.text;
                       controller.i.value = 3;
                     }
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
                        "Finish",
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
