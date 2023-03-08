/*import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanglap/configure/app_colors.dart';
import 'package:sanglap/configure/app_widgets.dart';
import 'package:sanglap/controller/api_controller.dart';

class OtpMatchScreen extends StatefulWidget {
  const OtpMatchScreen({Key? key}) : super(key: key);

  @override
  State<OtpMatchScreen> createState() => _OtpMatchScreenState();
}

class _OtpMatchScreenState extends State<OtpMatchScreen> {
  final _number1 = TextEditingController();
  final _number2 = TextEditingController();
  final _number3 = TextEditingController();
  final _number4 = TextEditingController();
  final _number5 = TextEditingController();
  final _number6 = TextEditingController();

  Timer? countdownTimer;
  Duration myDuration = const Duration(minutes: 3);

  late String otpCode;

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  void initState() {
    startTimer();
    // loginController.press.value = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));

    return Obx(() => Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppWidgets().appBar(context),
      body: SizedBox(
        height: h,
        width: w,
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            keyboardDismissBehavior:
            ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                /// Logo
                Padding(
                  padding: EdgeInsets.symmetric(vertical: h * 0.03),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppWidgets().circularLogo(context, outerRadius: h*0.08, innerRadius: h*0.077),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: h * 0.02,),

                /// Verification Text
                Text(
                  'verification'.tr,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: h * 0.02,
                ),

                /// Enter OTP Text
                Text(
                  "enter_otp".tr,
                  style: AppStyle.checkOutTextStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: h * 0.02,
                ),

                /// Timing Text
                Text(
                  '$minutes:$seconds',
                  style: AppStyle.timingText,
                ),
                SizedBox(
                  height: h * 0.03,
                ),

                /// OTP Field
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AppWidgets().otpField(context, _number1),
                        AppWidgets().otpField(context, _number2),
                        AppWidgets().otpField(context, _number3),
                        AppWidgets().otpField(context, _number4),
                        AppWidgets().otpField(context, _number5),
                        AppWidgets().otpField(context, _number6),
                      ],
                    ),
                    SizedBox(
                      height: h * 0.025,
                    ),

                    /// Verify Button
                    SizedBox(
                      width: w * 0.7,
                      child: loginController.press.isFalse
                          ? AppWidgets().button(
                        context,
                        text: 'verify'.tr,
                        height: h * 0.07,
                        width: w * 0.65,
                        radius: 10.0,
                        color: AppColors.primaryColor,
                        style: GoogleFonts.acme(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: AppColors.textColor,
                          ),
                        ),
                        press: () {

                          countdownTimer!.cancel();
                          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DashboardScreen()));

                          loginController.press.value = true;
                          otpCode = _number1.text +
                              _number2.text +
                              _number3.text +
                              _number4.text +
                              _number5.text +
                              _number6.text;
                          matchOtp(
                              context,
                              registrationInfoController.phone.toString(),
                              otpCode,
                              registrationInfoController.type.toString(),
                              registrationInfoController.from.toString());
                          countdownTimer!.cancel();


                        },
                      )
                          : const Center(
                        child: Padding(
                          padding:
                          EdgeInsets.symmetric(vertical: 20),
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.05,
                ),

                /// Not Receive Text
                Text(
                  "not_receive_code".tr,
                  style: AppStyle.title3Override,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: h * 0.02,
                ),

                ///Resend Button
                SizedBox(
                  width: w * 0.7,
                  child: loginController.press.isFalse
                      ? GestureDetector(
                    onTap: () {

                      loginController.press.value = true;
                      sendOtpRequest(context,
                          phone: registrationInfoController.phone.toString(),
                          type: registrationInfoController.type.toString(),
                          from: registrationInfoController.from.toString());
                    },
                    child: Text(
                      "resend_code".tr,
                      style: AppStyle.title3black,
                      textAlign: TextAlign.center,
                    ),
                  )
                      : const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}*/

// ignore_for_file: must_be_immutable

import 'dart:async';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ict_heaven/dashboard/dashboard.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../configure/app_colors.dart';
import '../configure/app_widgets.dart';
import '../controller/api_controller.dart';

class OtpMatchScreen extends StatefulWidget {
  var phone;
  OtpMatchScreen({Key? key, required this.phone}) : super(key: key);

  @override
  State<OtpMatchScreen> createState() => _OtpMatchScreenState();
}

class _OtpMatchScreenState extends State<OtpMatchScreen> {
  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  String currentText = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Obx(() => Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: h*0.08,),
            const Text('\nVerify your phone number',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(text: '\nWe Send OTP: '),
                  TextSpan(
                    text: '${widget.phone}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor),
                  ),
                ],
              ),
            ),

            const Text('\nEnter your otp code here.\n\n',
              style: TextStyle(
                  fontWeight: FontWeight.w500
              ),
            ),

            PinCodeTextField(
              length: 6,
              obscureText: false,
              animationType: AnimationType.fade,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              cursorColor: Colors.black,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.circle,
                fieldHeight: 50,
                fieldWidth: 50,
                activeFillColor: Colors.white,
                inactiveFillColor: Colors.white,
                selectedFillColor: Colors.white,
                selectedColor: AppColors.primaryColor,
                inactiveColor: AppColors.primaryColor,
                activeColor: Colors.grey,
              ),
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              errorAnimationController: errorController,
              controller: textEditingController,
              onCompleted: (v) {
                if(currentText != ''){
                  loginController.press.value = true;
                  matchOtp(
                      context,
                      registrationInfoController.phone.toString(),
                      currentText,
                      registrationInfoController.type.toString(),
                      registrationInfoController.from.toString());
                } else {
                  AppWidgets().wrongSnackBar(context, 'Please Enter an OTP');
                }
              },
              onChanged: (value) {
                setState(() {
                  currentText = value;
                });
              },
              beforeTextPaste: (text) {
                return true;
              }, appContext: context,
            ),

            const Text("\nDidn't you receive any code? Wait!\n",
              style: TextStyle(fontSize: 15,
                  letterSpacing: 1),),

            CircularCountDownTimer(
              duration: 180,
              initialDuration: 0,
              controller: CountDownController(),
              width: 80,
              height: 80,
              ringColor: Colors.grey[300]!,
              ringGradient: null,
              fillColor: AppColors.primaryColor.withOpacity(0.4),
              fillGradient: null,
              backgroundColor: AppColors.primaryColor,
              backgroundGradient: null,
              strokeWidth: 20.0,
              strokeCap: StrokeCap.round,
              textStyle: const TextStyle(
                  fontSize: 33.0, color: Colors.white, fontWeight: FontWeight.bold),
              textFormat: CountdownTextFormat.S,
              isReverse: true,
              isReverseAnimation: true,
              isTimerTextShown: true,
              autoStart: true,
              onStart: () {
                debugPrint('Countdown Started');
              },
              onComplete: () {
                debugPrint('Countdown Ended');
              },
            ),

            /// Resend OTP Button
            SizedBox(height: h*0.15,),
            GestureDetector(
              onTap: (){
                loginController.press.value = true;
                sendOtpRequest(context,
                    phone: registrationInfoController.phone.toString(),
                    type: registrationInfoController.type.toString(),
                    from: registrationInfoController.from.toString());
              },
              child: const Text("\nResend OTP\n",
                style: TextStyle(fontSize: 15,
                    letterSpacing: 1),),
            ),
          ],
        ),
      ),
      bottomNavigationBar: loginController.press.isFalse ? AppWidgets().submitButton(context, text: 'Verify', press: (){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>  const DashboardScreen()), (route) => false);
        // if(currentText != ''){
        //   loginController.press.value = true;
        //   matchOtp(
        //       context,
        //       registrationInfoController.phone.toString(),
        //       currentText,
        //       registrationInfoController.type.toString(),
        //       registrationInfoController.from.toString());
        // } else {
        //   AppWidgets().wrongSnackBar(context, 'Please Enter an OTP');
        // }
      }) : Padding(
        padding: EdgeInsets.symmetric(vertical: h*0.03, horizontal: w*0.45),
        child: const CircularProgressIndicator(),
      ),
    ));
  }
}