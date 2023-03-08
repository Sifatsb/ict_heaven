// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../auth/login.dart';
import '../auth/registration.dart';
import '../configure/app_colors.dart';
import '../configure/app_widgets.dart';
import '../controller/api_controller.dart';


class StarterScreen extends StatefulWidget {
  const StarterScreen({Key? key}) : super(key: key);

  @override
  State<StarterScreen> createState() => _StarterScreenState();
}

class _StarterScreenState extends State<StarterScreen> {
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  bool hidePassword = true;

  @override
  void initState() {
    super.initState();
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      internetController.internetConnection();
    });
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Obx(
      () => internetController.internet.isTrue
          ? Scaffold(
        backgroundColor: AppColors.secondaryColor,
              body: SingleChildScrollView(
                child: SizedBox(
                  height: h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [


                          ///Login Tittle text
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: h * 0.02),
                            child: const Text(
                              'Welcome to Ict Heaven',
                              style: AppStyle.titleText,
                              textAlign: TextAlign.center,
                            ),
                          ),

                          ///Sized Box
                          SizedBox(
                            height: h * 0.12,
                          ),

                          ///Login
                          Padding(
                            padding: EdgeInsets.only(bottom: h * 0.05),
                            child: AppWidgets().button(
                              context,
                              text: 'Login',
                              height: h * 0.07,
                              width: w * 0.65,
                              radius: 10.0,
                              color: AppColors.primaryColor,
                              style: GoogleFonts.acme(
                                textStyle: const TextStyle(
                                  fontSize: 22,
                                  color: AppColors.primaryTextColor,
                                ),
                              ),
                              press: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                );
                              },
                            ),
                          ),

                          ///Register
                          Padding(
                            padding: EdgeInsets.only(bottom: h * 0.05),
                            child: AppWidgets().button(
                              context,
                              text: 'Register',
                              height: h * 0.07,
                              width: w * 0.65,
                              radius: 10.0,
                              color: AppColors.primaryColor,
                              style: GoogleFonts.acme(
                                textStyle: const TextStyle(
                                  fontSize: 22,
                                  color: AppColors.primaryTextColor,
                                ),
                              ),
                              press: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const RegistrationScreen(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          : AppWidgets().noInternet(),
    );
  }
}
