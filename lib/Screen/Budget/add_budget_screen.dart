import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../View/home_screen.dart';

class AddBudgetScreen extends StatefulWidget {
  const AddBudgetScreen({Key? key}) : super(key: key);

  @override
  State<AddBudgetScreen> createState() => _AddBudgetScreenState();
}

class _AddBudgetScreenState extends State<AddBudgetScreen> {

  TextEditingController txtamount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Select Category",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13.sp,color: Color(0xff1a3c40)),),
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return ListTile(
                leading: Container(
                  height: 7.h,
                  width: 7.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.sp),
                      color: Colors.teal.shade50
                  ),
                  child: controller.expenseCategoryList[index].icon,
                ),
                title: Text("${controller.expenseCategoryList[index].name}"),
                trailing: InkWell(
                  onTap: () {

                    showDialog(context: context, builder: (context) {
                      return AlertDialog(
                        title: Text("Enter Amount",style: TextStyle(fontSize: 12.sp,color: Color(0xff1a3c40),fontWeight: FontWeight.bold),),
                        content:Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.sp),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.sp),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(onPressed: (){}, child: Text("Cancel"),style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),),
                                  ElevatedButton(onPressed: (){
                                    controller.budgetList.add(controller.expenseCategoryList[index]);
                                    print('=======================lenth=========${controller.budgetList.length}');
                                  }, child: Text(" Done "),style: ElevatedButton.styleFrom(backgroundColor: Colors.teal)),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },);
                  },
                  child: Container(
                    height: 4.h,
                    width: 20.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.sp),
                        border: Border.all(color: Colors.teal.shade100),
                      color: Colors.grey.shade100
                    ),
                    child: Text("Set Budget"),
                  ),
                ),
              );
            },itemCount: controller.expenseCategoryList.length,
              physics: ScrollPhysics(),
            ),
          ),
        ],
      ),
    ),);
  }
}
