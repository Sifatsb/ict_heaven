import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../configure/app_colors.dart';
import '../controller/api_controller.dart';
import 'entry_screen.dart';

class AnimatedSplashScreen extends StatefulWidget {
  const AnimatedSplashScreen({Key? key}) : super(key: key);

  @override
  AnimatedSplashScreenState createState() => AnimatedSplashScreenState();
}

class AnimatedSplashScreenState extends State<AnimatedSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  SharedPreferences? prefs;
  var token, phone;

  startTime() async {
    var duration = const Duration(milliseconds: 1800);
    return Timer(duration, _loadUserInfo);
  }

  _loadUserInfo() async {
    loginController.token.value = '$token';
    if (token != "" && token != 'null' && token != null) {
      login(context, phone: phone, from: 'splash');
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const StarterScreen()),
          (route) => false);
    }
  }

  sharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    token = (prefs!.getString('token') ?? "");
    phone = (prefs!.getString('phone') ?? "");
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    animation.addListener(() => setState(() {}));
    animationController.forward();
    startTime();
    sharedPreferences();
  }

  @override
  dispose() {
    animationController.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: AppColors.secondaryColor,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: Text(
                      "Powered By GrowTech",
                      style: TextStyle(color: AppColors.textColor),
                    )),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/splash_logo.png",
                  height: animation.value * 200,
                  width: animation.value * 200,
                ),
                const Text(
                  "Welcome to Ict Heaven",
                  style: AppStyle.title1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
