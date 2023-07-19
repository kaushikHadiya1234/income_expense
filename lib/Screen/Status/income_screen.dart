import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:income_expense/Screen/Model/income_model.dart';
import 'package:income_expense/Screen/View/home_screen.dart';
import 'package:income_expense/utils/DB_helper.dart';
import 'package:sizer/sizer.dart';

class IncomeScreen extends StatefulWidget {
  const IncomeScreen({Key? key}) : super(key: key);

  @override
  State<IncomeScreen> createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {
  int value = 0;
  String? status = "Income";
  TextEditingController txtamount = TextEditingController();
  TextEditingController txtname = TextEditingController();
  var txtkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    controller.d!.value = controller.formateDate(DateTime.now());
    controller.d1!.value = controller.formateDate(DateTime.now());
    controller.d2!.value = controller.formateDate(DateTime.now());
    value = Get.arguments;
    if (value == 0) {
      status = "Income";
    } else {
      status = "Expense";
    }
    print('===========================$value');
    controller.GetDbData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 1.8.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                  Text(
                    "Income",
                    style: TextStyle(
                        color: Color(0xff1a3c40),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(15.sp),
                            ),
                          ),
                          builder: (context) {
                            return SingleChildScrollView(
                              child: Container(
                                // height:value==0? 60.h:80.h,
                                child: IntrinsicHeight(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 10),
                                      Text(
                                        "Category",
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            color: Color(0xff1a3c40),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                        height: value==0?15.h:25.h,
                                        margin: EdgeInsets.all(10),
                                        child: GridView.builder(
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 3,
                                                  mainAxisExtent: 4.h,
                                                  crossAxisSpacing: 10,
                                                  mainAxisSpacing: 10),
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                controller.selectcat!.value =
                                                    index;
                                                controller.category!.value = value==0? controller.incomeCategoryList[index].name!:controller.expenseCategoryList[index].name!;
                                              },
                                              child: Obx(
                                                () => Container(
                                                  height: 4.h,
                                                  width: 15.w,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      color: controller.selectcat!
                                                                  .value ==
                                                              index
                                                          ? Colors.teal.shade100
                                                          : Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.sp),
                                                      border: Border.all(
                                                          color: Colors.grey)),
                                                  child: Text(
                                                    value==0?"${controller.incomeCategoryList[index].name}":"${controller.expenseCategoryList[index].name}",
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          itemCount: value==0?controller.incomeCategoryList.length:controller.expenseCategoryList.length,
                                          physics: ScrollPhysics(),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "Income name",
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            color: Color(0xff1a3c40),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                        height: 5.h,
                                        child: ListView.builder(
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                controller.selectcat1!.value =
                                                    index;
                                                controller.name!.value = controller.readnameDataList[index]['name'];
                                              },
                                              child: Obx(
                                                () => Container(
                                                  height: 4.h,
                                                  width: 15.w,
                                                  margin: EdgeInsets.only(
                                                      left: 5, right: 5),
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      color: controller
                                                                  .selectcat1!
                                                                  .value ==
                                                              index
                                                          ? Colors.teal.shade100
                                                          : Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.sp),
                                                      border: Border.all(
                                                          color: Colors.grey)),
                                                  child: Text(
                                                    "${controller.readnameDataList[index]['name']}",
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          itemCount:
                                              controller.readnameDataList.length,
                                          scrollDirection: Axis.horizontal,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        " Range of Date",
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            color: Color(0xff1a3c40),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              DateTime? pickdate =
                                                  await showDatePicker(
                                                      context: context,
                                                      initialDate: DateTime.now(),
                                                      firstDate: DateTime(2000),
                                                      lastDate: DateTime(2050));
                                              controller.d1!.value = controller
                                                  .formateDate(pickdate!);
                                            },
                                            child: Container(
                                              height: 6.5.h,
                                              width: 45.w,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(10.sp),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0),
                                                child: Row(
                                                  children: [
                                                    Icon(Icons
                                                        .calendar_month_rounded),
                                                    SizedBox(width: 5),
                                                    Obx(() => Text(
                                                        "${controller.d1!.value}"))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "TO",
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                color: Color(0xff1a3c40),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              DateTime? pickdate =
                                                  await showDatePicker(
                                                      context: context,
                                                      initialDate: DateTime.now(),
                                                      firstDate: DateTime(2000),
                                                      lastDate: DateTime(2050));
                                              controller.d2!.value = controller
                                                  .formateDate(pickdate!);
                                            },
                                            child: Container(
                                              height: 6.5.h,
                                              width: 45.w,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(10.sp),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0),
                                                child: Row(
                                                  children: [
                                                    Icon(Icons
                                                        .calendar_month_rounded),
                                                    SizedBox(width: 5),
                                                    Obx(() => Text(
                                                        "${controller.d2!.value}"))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      InkWell(
                                        onTap: () {
                                          controller.getfiltterData(
                                            cat: controller.category!.value,
                                            name: controller.name!.value,
                                            date1: controller.d1!.value,
                                            date2: controller.d2!.value,
                                          );
                                          Get.back();
                                        },
                                        child: Container(
                                          height: 5.h,
                                          width: 20.w,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7.sp),
                                            color: Color(0xff1a3c40),
                                          ),
                                          child: Text(
                                            "Filtter",
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      icon: Icon(Icons.filter_list))
                ],
              ),
            ),
            SizedBox(height: 3.h),
            Container(
              alignment: Alignment.center,
              child: Container(
                height: 15.h,
                width: 90.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.sp),
                    color: Color(0xff1a3c40)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        value == 0 ? "Total Income" : "Total Expense",
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 1.5.h),
                      Obx(
                        () => Text(
                          value == 0
                              ? "${controller.tamount!.value}"
                              : "${controller.total_amount!.value}",
                          style: TextStyle(
                              fontSize: 25.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 3.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.sp),
              child: Text(
                "Transaction",
                style: TextStyle(
                    fontSize: 12.sp,
                    color: Color(0xff1a3c40),
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 2.h),
            Expanded(
              child: Obx(() => ListView.builder(
                    itemBuilder: (context, index) {
                      // print("===1==========${controller.readDataList[3]['status']}");
                      print('===2===========$status');
                      if (controller.readDataList[index]['status'] ==
                          "$status") {
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
                            value == 0
                                ? "+₹${controller.readDataList[index]['amount']}"
                                : "-₹${controller.readDataList[index]['amount']}",
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: value == 0 ? Colors.green : Colors.red,
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
                      }
                      return Container();
                    },
                    itemCount: controller.readDataList.length,
                    physics: ScrollPhysics(),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
