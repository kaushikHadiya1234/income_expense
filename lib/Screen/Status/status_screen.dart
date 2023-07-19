import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:income_expense/Screen/View/home_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:pie_chart/pie_chart.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(),
                  Text(
                    'Status',
                    style:
                    TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
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
                        Icon(Icons.calendar_month_rounded,color: Colors.teal.shade200,),
                        SizedBox(width: 5),
                        Text("Monthly",style: TextStyle(fontSize: 12.sp,color: Colors.teal.shade200),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
                height: 10.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
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
            Container(
              height: 35.h,
              width: 90.w,
              alignment: Alignment.center,
              child:Obx(
                () =>  PieChart(
                  dataMap: { "Income": double.parse("${controller.tamount!.value}"),
                    "Expense": double.parse("${controller.total_amount!.value}"),
                   },
                  colorList: [
                    Colors.green,
                    Colors.red,
                  ],

                  chartType: ChartType.disc,
                ),
              )
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {

                      Get.toNamed('income',arguments: 0);
                    },
                    child: Container(
                      height: 25.h,
                      width: 50.w,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/income.png',height: 13.h,color: Colors.teal.shade300,),
                            SizedBox(height: 15),
                            Text('Income',style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500),),
                            SizedBox(height: 5),
                            Obx( () =>  Text('₹${controller.tamount!.value}',style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {

                      Get.toNamed('income',arguments: 1);
                    },
                    child: Container(
                      height: 25.h,
                      width: 50.w,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/expense.png',height: 13.h,color: Colors.amber.shade200,),
                            SizedBox(height: 15),
                            Text('Expense',style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500),),
                            SizedBox(height: 5),
                            Obx(() =>  Text('${controller.total_amount!.value}',style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),)),
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
