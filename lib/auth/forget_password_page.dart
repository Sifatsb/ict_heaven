import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../configure/app_widgets.dart';
import '../../configure/app_colors.dart';
import '../../controller/api_controller.dart';
import 'otp_match_page.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

var _phoneController = TextEditingController();

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppWidgets().appBar(context),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Center(
          child: Column(
            children: [

              SizedBox(height: h*0.06,),
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

              Text("forget_pass".tr, style: AppStyle.title3,),
              SizedBox(height: h*0.04,),

              AppWidgets().inputField(context, controller: _phoneController, hintText: 'phone'.tr, keyboardType: TextInputType.phone, readOnly: loginController.press.isFalse ? false : true,
                  icon: const Icon(Icons.phone, color: AppColors.iconColor), autofillHints: AutofillHints.telephoneNumber),

              loginController.press.isFalse
                  ? Padding(
                padding: EdgeInsets.only(top: h * 0.04, bottom: h * 0.01),
                child: AppWidgets().button(context,
                    text: 'send_otp'.tr,
                    height: h * 0.07,
                    width: w * 0.65,
                    radius: 10.0,
                    color: AppColors.primaryColor,
                    style: GoogleFonts.acme(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: AppColors.textColor),
                    ), press: () {
                      if (_phoneController.text != '' &&
                          _phoneController.text.length == 11 &&
                          _phoneController.text.startsWith('01')) {

                        AppWidgets().successSnackBar(context, 'OTP Send SuccessFull');
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  OtpMatchScreen(phone: _phoneController.text,),),);

                        // loginController.press.value = true;
                        // loginController.phone.value = _phoneController.text.toString();
                        // sendOtpRequest(context, phone: _phoneController.text, user: 'social', type: 'forget');

                        // _phoneController.clear();
                      } else if (_phoneController.text.isEmpty ||
                          _phoneController.text.length != 11 ||
                          !_phoneController.text.startsWith('01')) {
                        AppWidgets().wrongSnackBar(context, 'error_phone'.tr);
                      }
                    }),
              )
                  : const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: CircularProgressIndicator(),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
