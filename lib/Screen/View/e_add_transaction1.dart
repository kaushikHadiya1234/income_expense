import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:income_expense/Screen/Model/income_model.dart';
import 'package:income_expense/Screen/View/home_screen.dart';
import 'package:sizer/sizer.dart';

class AddTransactionScreen1 extends StatefulWidget {
  const AddTransactionScreen1({Key? key}) : super(key: key);

  @override
  State<AddTransactionScreen1> createState() => _AddTransactionScreen1State();
}

class _AddTransactionScreen1State extends State<AddTransactionScreen1> {
  TextEditingController txtname = TextEditingController();
  var txtkey = GlobalKey<FormState>();

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
              SizedBox(height: 20.h,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Payee name",
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  validator: (value) {
                    if(value!.isEmpty)
                      {
                        return "Enter the Payee name";
                      }
                  },
                  controller: txtname,
                  maxLines: 1,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.sp),
                      borderSide: BorderSide(color: Colors.grey)
                    ),
                      border:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.sp),
                          borderSide: BorderSide(color: Colors.grey)
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                      hintText: "Enter payee Name",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1A3c40),
                      )),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "choose category",
                  style: TextStyle(
                      fontSize: 13.sp,
                      color: Color(0xff1A3c40),
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 32.h,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, mainAxisExtent: 10.h),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // IncomeExpenseModel m=IncomeExpenseModel(category: controller.expenseCategoryList[index].name,name: txtname.text);
                        controller.name!.value = txtname.text;
                        controller.category!.value = controller.expenseCategoryList[index].name!;
                        controller.selectcat!.value=index;
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Obx(
                            () =>  Container(
                              height: 7.h,
                              width: 7.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color:controller.selectcat!.value==index?Colors.teal.shade100:Colors.grey.shade100
                              ),
                              child: controller.expenseCategoryList[index].icon,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            '${controller.expenseCategoryList[index].name}',
                            style: TextStyle(color: Color(0xff1A3c40)),
                          ),
                          SizedBox(height: 3),
                        ],
                      ),
                    );
                  },
                  itemCount: controller.expenseCategoryList.length,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                 if(txtkey.currentState!.validate())
                   {
                     controller.progress.value=0.66;
                     controller.i.value=2;
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
                      "Continue",
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
            )),
      ),
    );
  }
}
