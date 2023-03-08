import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../configure/app_colors.dart';
import '../configure/app_widgets.dart';
import '../controller/api_controller.dart';
import '../drawer/drawer_page.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen>
    with TickerProviderStateMixin {
  DateTime timeBackPressed = DateTime.now();

  ///for pagination
  final scrollController = ScrollController();
  List items = [];
  int page = 1;
  bool hasMore = true;

  @override
  void initState() {
    super.initState();
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      internetController.internetConnection();
    });
  }


  var inputCommentController = TextEditingController();
  var inputCommentBottomSheetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        final differ = DateTime.now().difference(timeBackPressed);
        final exitWarning = differ >= const Duration(seconds: 2);
        timeBackPressed = DateTime.now();
        if (exitWarning) {
          AppWidgets().exitAlertDialog(context, from: 'exit');
          return false;
        } else {
          return true;
        }
      },

      child: SafeArea(
        child: Obx(
              () => internetController.internet.isTrue
              ? Scaffold(
                appBar: AppBar(),
                drawer: const DrawerPage(),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [

                    Center(child: Text('DashBoard', style: AppStyle.title1,))

                  ],
                ),
              )
              : AppWidgets().noInternet(),
        ),
      ),

    );
  }


}
