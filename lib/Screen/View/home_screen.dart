import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:income_expense/Screen/Controller/income_controller.dart';
import 'package:income_expense/Screen/Model/income_model.dart';
import 'package:sizer/sizer.dart';

import '../../utils/DB_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

IncomeController controller = Get.put(IncomeController());

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController txtamount = TextEditingController();
  TextEditingController txtname = TextEditingController();
  var txtkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Container(
                height: 5.h,
                width: 5.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/lp.jpg"),
                      fit: BoxFit.fill,
                    ),
                    border: Border.all(color: Colors.grey)),
              ),
              title: Text(
                "Hi! Kaushik",
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Active'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Income and Expense',
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 5.h,
                    width: 25.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.teal.shade50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_month_rounded,
                          color: Colors.teal.shade200,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Monthly",
                          style: TextStyle(
                              fontSize: 12.sp, color: Colors.teal.shade200),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
                height: 10.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('${controller.monthList[index].year}'),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 3.5.h,
                            width: 12.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Colors.teal.shade50),
                            child: Text("${controller.monthList[index].month}"),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: controller.monthList.length,
                )),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed('income', arguments: 0);
                    },
                    child: Container(
                      height: 25.h,
                      width: 50.w,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/income.png',
                              height: 13.h,
                              color: Colors.teal.shade300,
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Income',
                              style: TextStyle(
                                  fontSize: 12.sp, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 5),
                            Obx(() => Text(
                                  '₹${controller.tamount!.value}',
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed('income', arguments: 1);
                    },
                    child: Container(
                      height: 25.h,
                      width: 50.w,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/expense.png',
                              height: 13.h,
                              color: Colors.amber.shade200,
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Expense',
                              style: TextStyle(
                                  fontSize: 12.sp, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 5),
                            Obx(() => Text(
                                  '${controller.total_amount!.value}',
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Your Transaction',
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return ExpansionTile(
                  leading: Container(
                    height: 7.h,
                    width: 7.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xa0aee8cf)),
                    child: Icon(
                      Icons.wallet_travel,
                      size: 3.5.h,
                      color: Colors.teal.shade200,
                    ),
                  ),
                  title: Text(
                    "${controller.readDataList[index]['category']}",
                    style: TextStyle(
                        fontSize: 12.sp, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Row(
                    children: [
                      Text(
                        "${controller.readDataList[index]['name']}",
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Color(0xff1a3c40)),
                      ),
                      SizedBox(width: 5.w),
                      Container(
                        height: 3.h,
                        width: 20.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(10.sp),
                            color: Colors.teal.shade50),
                        child: Text(
                          "${controller.readDataList[index]['date']}",
                        ),
                      ),
                    ],
                  ),
                  trailing: Text(
                    controller.readDataList[index]['category']=='Income'
                        ? "+₹${controller.readDataList[index]['amount']}"
                        : "-₹${controller.readDataList[index]['amount']}",
                    style: TextStyle(
                        fontSize: 12.sp,
                        color:  controller.readDataList[index]['category']=='Income' ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                  children: [
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Obx(
                                        () => AlertDialog(
                                      title: Text("Update"),
                                      content: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Text("Select status"),
                                            Obx(
                                                  () => RadioListTile(
                                                  value: "Income",
                                                  groupValue:
                                                  controller
                                                      .status!
                                                      .value,
                                                  onChanged: (value) {
                                                    controller.status!
                                                        .value =
                                                    value!;
                                                  },
                                                  title:
                                                  Text('Income')),
                                            ),
                                            Obx(
                                                  () => RadioListTile(
                                                value: "Expense",
                                                groupValue: controller
                                                    .status!.value,
                                                onChanged: (value) {
                                                  controller.status!
                                                      .value = value!;
                                                },
                                                title:
                                                Text("Expense"),
                                              ),
                                            ),
                                            Text("Select Category"),
                                            SizedBox(height: 10),
                                            controller.status!
                                                .value ==
                                                'Expense'
                                                ? Container(
                                              height: 42.h,
                                              width: 50.w,
                                              child: GridView
                                                  .builder(
                                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount:
                                                    3,
                                                    mainAxisExtent:
                                                    10.5.h),
                                                itemBuilder:
                                                    (context,
                                                    index) {
                                                  return InkWell(
                                                    onTap: () {
                                                      // IncomeExpenseModel m=IncomeExpenseModel(category: controller.expenseCategoryList[index].name,name: txtname.text);
                                                      // controller.name!.value = txtname.text;
                                                      controller
                                                          .category!
                                                          .value =
                                                      controller
                                                          .expenseCategoryList[index]
                                                          .name!;
                                                    },
                                                    child:
                                                    Column(
                                                      mainAxisSize:
                                                      MainAxisSize
                                                          .min,
                                                      children: [
                                                        Container(
                                                          height:
                                                          7.h,
                                                          width:
                                                          7.h,
                                                          decoration:
                                                          BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(15),
                                                            color:
                                                            controller.expenseCategoryList[index].color,
                                                          ),
                                                          child: controller
                                                              .expenseCategoryList[index]
                                                              .icon,
                                                        ),
                                                        SizedBox(
                                                            height:
                                                            3),
                                                        Text(
                                                          '${controller.expenseCategoryList[index].name}',
                                                          style: TextStyle(
                                                              color: Color(0xff1A3c40),
                                                              fontSize: 10.sp),
                                                        ),
                                                        SizedBox(
                                                            height:
                                                            3),
                                                      ],
                                                    ),
                                                  );
                                                },
                                                itemCount:
                                                controller
                                                    .expenseCategoryList
                                                    .length,
                                                physics:
                                                ScrollPhysics(),
                                              ),
                                            )
                                                : Container(
                                              height: 32.h,
                                              width: 50.w,
                                              child: GridView
                                                  .builder(
                                                physics:
                                                ScrollPhysics(),
                                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount:
                                                    3,
                                                    mainAxisExtent:
                                                    10.h),
                                                itemBuilder:
                                                    (context,
                                                    index) {
                                                  return InkWell(
                                                    onTap: () {
                                                      controller.selectcat!.value = index;
                                                      controller
                                                          .category!
                                                          .value =
                                                      controller
                                                          .incomeCategoryList[index]
                                                          .name!;
                                                    },
                                                    child:
                                                    Column(
                                                      mainAxisSize:
                                                      MainAxisSize
                                                          .min,
                                                      children: [
                                                        Obx(
                                                              () => Container(
                                                            height:
                                                            7.h,
                                                            width:
                                                            7.h,
                                                            decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius.circular(15),
                                                                color:controller.selectcat!.value == index?Colors.teal.shade100:Colors.grey.shade100
                                                            ),
                                                            child: controller
                                                                .incomeCategoryList[index]
                                                                .icon,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                            height:
                                                            3),
                                                        Text(
                                                          '${controller.incomeCategoryList[index].name}',
                                                          style: TextStyle(
                                                              color: Color(0xff1A3c40),
                                                              fontSize: 10.sp),
                                                        ),
                                                        SizedBox(
                                                            height:
                                                            3),
                                                      ],
                                                    ),
                                                  );
                                                },
                                                itemCount:
                                                controller
                                                    .incomeCategoryList
                                                    .length,
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text('Amount'),
                                            SizedBox(height: 10),
                                            Form(
                                              key: txtkey,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  TextFormField(
                                                    controller: txtamount,
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return "Enter the amount";
                                                      }
                                                    },
                                                    decoration: InputDecoration(
                                                        focusedBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(10.sp),
                                                            borderSide: BorderSide(color: Colors.grey)
                                                        ),
                                                        border:  OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(10.sp),
                                                            borderSide: BorderSide(color: Colors.grey)
                                                        ),
                                                        hintText:
                                                        "Enter amount"),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text('Name'),
                                                  SizedBox(height: 10),
                                                  TextFormField(
                                                    controller: txtname,
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return "Enter the name";
                                                      }
                                                    },
                                                    decoration: InputDecoration(
                                                        focusedBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(10.sp),
                                                            borderSide: BorderSide(color: Colors.grey)
                                                        ),
                                                        border:  OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(10.sp),
                                                            borderSide: BorderSide(color: Colors.grey)
                                                        ),
                                                        hintText:
                                                        "Enter name"),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            SizedBox(height: 10),
                                            Text('Select Date'),
                                            SizedBox(height: 10),
                                            Container(
                                              height: 6.h,
                                              width: 65.w,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10.sp),
                                                  border: Border.all(
                                                      color: Colors
                                                          .grey)),
                                              child: Row(
                                                children: [
                                                  IconButton(
                                                      onPressed:
                                                          () async {
                                                        DateTime? pickdate = await showDatePicker(
                                                            context:
                                                            context,
                                                            initialDate:
                                                            DateTime
                                                                .now(),
                                                            firstDate:
                                                            DateTime(
                                                                2000),
                                                            lastDate:
                                                            DateTime(
                                                                2050));
                                                        // controller.d!.value = "$pickdate";
                                                        controller.d!.value=controller.formateDate(pickdate!);
                                                      },
                                                      icon: Icon(Icons
                                                          .calendar_month_rounded)),
                                                  Obx(() => Text(
                                                      "${controller.d}"))
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceEvenly,
                                              children: [
                                                OutlinedButton(
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                    child: Text(
                                                      "Cancel",
                                                      style: TextStyle(
                                                          color: Colors
                                                              .white),
                                                    ),
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                        MaterialStateProperty.resolveWith(
                                                                (states) =>
                                                            Colors.red))),
                                                OutlinedButton(
                                                    onPressed: () {
                                                      if (txtkey.currentState!.validate()) {
                                                        IncomeExpenseModel m = IncomeExpenseModel(
                                                          status: controller.status!.value,
                                                          category: controller.category!.value,
                                                          amount: txtamount.text,
                                                          name: txtname.text,
                                                          date: controller.d!.value,
                                                        );

                                                        DBhelper dbhelper = DBhelper();
                                                        dbhelper.updateDb(m, controller.readDataList[index]['id']);
                                                        controller
                                                            .GetDbData();
                                                        Get.back();
                                                      }
                                                    },
                                                    child: Text(
                                                      "Update",
                                                      style: TextStyle(
                                                          color: Colors
                                                              .white),
                                                    ),
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                        MaterialStateProperty.resolveWith(
                                                                (states) =>
                                                                Color(0xff1a3c40))))
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                              controller.GetDbData();
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.grey,
                            )),
                        IconButton(
                          onPressed: () {
                            DBhelper d = DBhelper();
                            d.deleteDb(int.parse(
                                "${controller.readDataList[index]['id']}"));
                            controller.GetDbData();
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },itemCount: controller.readDataList.length,
              physics: BouncingScrollPhysics(),),
            ),
          ],
        ),
      ),
    );
  }
}
