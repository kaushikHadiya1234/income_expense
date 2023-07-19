import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.arrow_back,color: Color(0xff1A3c40),),
                Spacer(),
                Text("Profile",style: TextStyle(fontSize: 15.sp,color: Color(0xff1A3c40),fontWeight: FontWeight.bold),),
                Spacer(),
              ],
            ),
          ),
          SizedBox(height: 20),
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/lp.jpg",),backgroundColor: Colors.grey.shade200,radius: 60,
          ),
          SizedBox(height: 10),
          Text("Kaushik Ahir",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff1a3c40),fontSize: 16.sp),),
          SizedBox(height: 20),
          Container(
            child: Column(
              children: [
                ListTile(
                  leading: Container(
                    height: 7.h,
                    width: 7.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.sp),
                      color: Colors.teal.shade50
                    ),
                    child: Icon(Icons.person_2_outlined,color: Color(0xff1a3c40),size: 4.h,),
                  ),
                  title: Text("My Profile"),
                ),
                SizedBox(height: 10),
                ListTile(
                  leading: Container(
                    height: 7.h,
                    width: 7.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.sp),
                      color: Colors.teal.shade50
                    ),
                    child: Icon(Icons.lock_outline,color: Color(0xff1a3c40),size: 4.h,),
                  ),
                  title: Text("Change Password"),
                ),
                SizedBox(height: 10),
                ListTile(
                  leading: Container(
                    height: 7.h,
                    width: 7.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.sp),
                      color: Colors.teal.shade50
                    ),
                    child: Icon(Icons.logout_outlined,color: Color(0xff1a3c40),size: 4.h,),
                  ),
                  title: Text("Logout"),
                ),
              ],
            ),
          ),
        ],
      ),
    ),);
  }
}
