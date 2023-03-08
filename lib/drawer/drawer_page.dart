// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../configure/app_colors.dart';
import '../../configure/app_widgets.dart';
import '../dashboard/dashboard.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SizedBox(
      width: w * 0.78,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppWidgets().circularLogo(context,
                      outerRadius: h * 0.065, innerRadius: h * 0.06),
                  const Text(
                    'Welcome to Ict Heaven',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),

            ///Profile
            AppWidgets().drawerItems(
              icon: Icons.person_outline,
              title: 'Profile',
              onTap: () {
                Navigator.pop(context);
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
              },
            ),

            ///Course
            AppWidgets().drawerItems(
              icon: Icons.next_plan_outlined,
              title: 'Course',
              onTap: () {
                Navigator.pop(context);
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardScreen()));
              },
            ),

            ///My Course
            AppWidgets().drawerItems(
              icon: Icons.next_plan_outlined,
              title: 'My Course',
              onTap: () {
                Navigator.pop(context);
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardScreen()));
              },
            ),

            ///Result
            AppWidgets().drawerItems(
              icon: Icons.next_plan_outlined,
              title: 'Resut',
              onTap: () {
                Navigator.pop(context);
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardScreen()));
              },
            ),


            ///Logout
            AppWidgets().drawerItems(
              icon: Icons.logout_outlined,
              title: 'logout'.tr,
              onTap: () async {AppWidgets().exitAlertDialog(context, from: 'logout');},
            ),

            ///Exit
            AppWidgets().drawerItems(
              icon: Icons.close_outlined,
              title: 'Exit',
              onTap: () async {
                AppWidgets().exitAlertDialog(context, from: 'exit');
              },
            ),

          ],
        ),
      ),
    );
  }
}
