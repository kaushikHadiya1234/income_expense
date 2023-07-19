import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'home_screen.dart';

class AddIncomeScreen1 extends StatefulWidget {
  const AddIncomeScreen1({Key? key}) : super(key: key);

  @override
  State<AddIncomeScreen1> createState() => _AddIncomeScreen1State();
}

class _AddIncomeScreen1State extends State<AddIncomeScreen1> {
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
                        'assets/images/income.png',
                        color: Colors.teal,
                        height: 5.h,
                      ),
                    ),
                    title: Text(
                      "Transaction type",
                      style: TextStyle(color: Colors.grey, fontSize: 10.sp),
                    ),
                    subtitle: Text(
                      "Income",
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 25.h,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.sp),
                    child: Text(
                      "Income name",
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      validator: (value) {
                        if(value!.isEmpty)
                          {
                            return "Enter the name";
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
                              borderRadius: BorderRadius.circular(10.sp),
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
                    height: 22.h,
                    child: GridView.builder(
                      physics: ScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4, mainAxisExtent: 10.h),
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Obx(
                              () =>  InkWell(
                                onTap: () {
                                  controller.name!.value = txtname.text;
                                  controller.category!.value = controller.incomeCategoryList[index].name!;
                                  controller.selectcat!.value=index;
                                },
                                child: Container(
                                  height: 7.h,
                                  width: 7.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: controller.selectcat!.value==index?Colors.teal.shade100:Colors.grey.shade100
                                  ),
                                  child: controller.incomeCategoryList[index].icon,
                                ),
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              '${controller.incomeCategoryList[index].name}',
                              style: TextStyle(color: Color(0xff1A3c40)),
                            ),
                            SizedBox(height: 3),
                          ],
                        );
                      },
                      itemCount: controller.incomeCategoryList.length,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {

                      if(txtkey.currentState!.validate())
                      {
                        controller.progress.value = 0.66;
                        controller.i.value = 5;
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
