// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ict_heaven/auth/otp_match_page.dart';
import 'package:ict_heaven/auth/registration.dart';
import 'package:ict_heaven/dashboard/dashboard.dart';

import '../configure/app_colors.dart';
import '../configure/app_widgets.dart';
import '../controller/api_controller.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool language   = false;
  bool isFinished = false;

  var phoneController     = TextEditingController();
  var passwordController  = TextEditingController();
  bool hidePassword = true;

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // loginController.press.value = false;
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
              body: SizedBox(
                height: h,
                width: w,
                // decoration: AppStyle.backgroundStyle,
                child: SafeArea(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        SizedBox(height: h*0.04),

                        ///Logo
                        Image.asset('assets/images/logo1.png'),

                        /// Title Text
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: h * 0.03),
                          child: const Text(
                            'Welcome To Ict Heaven',
                            style: AppStyle.titleText,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: h*0.015,),

                        /// Number Text Field
                        AppWidgets().inputField(
                          context,
                          controller: phoneController,
                          hintText: 'phone',
                          keyboardType: TextInputType.phone,
                          readOnly:
                          loginController.press.isFalse ? false : true,
                          icon: const Icon(
                            Icons.phone,
                            color: AppColors.iconColor,
                          ),
                          autofillHints: AutofillHints.telephoneNumber,
                        ),

                        /// Password Text Field
                        AppWidgets().inputField(context, controller: passwordController, hintText: 'password'.tr, keyboardType: TextInputType.visiblePassword, readOnly: loginController.press.isFalse ? false : true,
                            icon: const Icon(Icons.lock_outline, color: AppColors.iconColor,), autofillHints: AutofillHints.password, obscureText: hidePassword,
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              child: hidePassword
                                  ? const Icon(
                                Icons.visibility_off_outlined,
                                color: AppColors.iconColor,
                              )
                                  : const Icon(
                                Icons.visibility_outlined,
                                color: AppColors.primaryColor,
                              ),
                            )
                        ),

                        SizedBox(height: h*0.015,),

                        /// Login Button
                        loginController.press.isFalse
                            ? Padding(
                                padding: EdgeInsets.only(bottom: h * 0.04),
                                child: AppWidgets().button(
                                  context,
                                  text: 'Login',
                                  height: h * 0.07,
                                  width: w * 0.65,
                                  radius: 10.0,
                                  color: AppColors.primaryColor,
                                  style: GoogleFonts.acme(
                                    textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                      color: AppColors.primaryTextColor,
                                    ),
                                  ),
                                  press: () {
                                    // if (phoneController.text != '') {
                                    //   registrationInfoController.phone.value = phoneController.text;
                                    //   registrationInfoController.from.value = 'login';
                                    //   registrationInfoController.type.value = 'login';
                                    //   loginController.press.value = true;
                                    //   sendOtpRequest(context, phone: phoneController.text, type: registrationInfoController.type.toString(), from: registrationInfoController.from.toString());
                                    //
                                    // } else if (phoneController.text == '') {
                                    //   AppWidgets().wrongSnackBar(context, 'Enter valid Phone');
                                    // }

                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OtpMatchScreen(phone: '01537263616')));

                                  },
                                ),
                              )
                            : const Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: CupertinoActivityIndicator(radius: 20,),
                                ),
                              ),
                        Padding(
                          padding: EdgeInsets.only(bottom: h * 0.03),
                          child: GestureDetector(
                            onTap: () {
                              // loginController.press.value = false;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const RegistrationScreen(),
                                ),
                              );
                            },
                            child: RichText(
                              text: const TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'Don\'t have an account?',
                                      style: AppStyle.title1),
                                  TextSpan(
                                    text: '  Register Now.',
                                    style: AppStyle.title1,
                                  ),
                                ],
                              ),
                              textScaleFactor: 0.5,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : AppWidgets().noInternet(),
    );
  }
}
