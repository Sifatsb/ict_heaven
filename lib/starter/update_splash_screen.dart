import 'dart:async';
import 'package:flutter/material.dart';
import 'package:in_app_update/in_app_update.dart';
import '../../configure/app_colors.dart';
import '../controller/api_controller.dart';
import 'entry_screen.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  UpdateScreenState createState() => UpdateScreenState();
}

class UpdateScreenState extends State<UpdateScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  var token, phone, password;

  startTime() async {
    var duration = const Duration(milliseconds: 3000);
    return Timer(duration, _loadUserInfo);
  }

  _loadUserInfo() async {
    if (token != '') {
      login(context, phone: phone, from: 'splash');
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const StarterScreen()),
          (route) => false);
    }
  }

  _showDialog() async {
    await Future.delayed(const Duration(milliseconds: 50));
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update Available'),
          content: const Text('You can now update Shanglap'),
          actions: [
            TextButton(
                onPressed: () {
                  InAppUpdate.performImmediateUpdate();
                },
                child: const Text('Update')),
            // TextButton(
            //     onPressed: () => _loadUserInfo(), child: const Text('Maybe Later')),
          ],
        );
      },
    );
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
    _showDialog();
  }

  @override
  dispose() {
    animationController.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.center,
            colors: AppColors.gradientColor,
          ),
        ),
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
                    "PTechnology Partner M360 ICT",
                    style: TextStyle(color: AppColors.textColor),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo1.png",
                  height: animation.value * 250,
                  width: animation.value * 250,
                ),
                const Text(
                  "Welcome to Shanglap",
                  style: TextStyle(color: AppColors.textColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
