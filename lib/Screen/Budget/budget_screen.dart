import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../View/home_screen.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({Key? key}) : super(key: key);

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0,right: 15,top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Your Budget",style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.bold,color: Color(0xff1a3c40)),),
                  IconButton(onPressed: () {
                    Get.toNamed("addbudget");
                  }, icon: Icon(Icons.add))
                ],
              ),
            ),
            Expanded(
              child: Obx(
                () =>  ListView.builder(itemBuilder: (context, index) {
                  return ListTile(
                    leading: Container(
                      height: 7.h,
                      width: 7.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.sp),
                          color: Colors.teal.shade50
                      ),
                      child: controller.budgetList[index].icon,
                    ),
                    title: Text("${controller.budgetList[index].name}"),
                   subtitle: LinearProgressIndicator(
                     value: 0.25,
                     backgroundColor: Colors.grey.shade200,
                     color: Colors.teal,
                     minHeight: 1.h,
                   ),
                    trailing: IconButton(onPressed: () {
                      controller.budgetList.removeAt(index);
                    },icon: Icon(Icons.delete,color: Colors.red,)),
                  );
                },itemCount: controller.budgetList.length,
                  physics: ScrollPhysics(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
