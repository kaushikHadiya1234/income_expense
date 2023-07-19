import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:income_expense/Screen/Budget/budget_screen.dart';
import 'package:income_expense/Screen/Status/status_screen.dart';
import 'package:income_expense/Screen/View/home_screen.dart';
import 'package:income_expense/Screen/View/profile.dart';
import 'package:pandabar/pandabar.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({Key? key}) : super(key: key);

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  String page='Grey';

  @override
  void initState() {
    super.initState();
    controller.GetDbData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Builder(
          builder: (context) {
            switch (page) {
              case 'Grey':
                return HomeScreen();
              case 'Blue':
                return StatusScreen();
              case 'Red':
                return BudgetScreen();
              case 'Yellow':
                return ProfileScreen();
              default:
                return HomeScreen();
            }
          },
        ),
        bottomNavigationBar: PandaBar(
          backgroundColor: Colors.transparent,
          buttonData: [
            PandaBarButtonData(
                id: 'Grey', icon: Icons.home_outlined, title: 'Home'),
            PandaBarButtonData(id: 'Blue', icon: Icons.auto_graph, title: 'Status'),
            PandaBarButtonData(
                id: 'Red', icon: Icons.wallet, title: 'Budget'),
            PandaBarButtonData(
                id: 'Yellow', icon: Icons.person_2_outlined, title: 'Profile'),
          ],
          onChange: (id) {
            setState(() {
              page = id;
            });
          },
          onFabButtonPressed: () {
            controller.i.value=0;
            controller.progress.value=0;
            Get.toNamed('appbar');
          },fabColors: [Colors.teal,Colors.teal],
          buttonSelectedColor: Colors.teal,
        ),
      ),
    );
  }
}
