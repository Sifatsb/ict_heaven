import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../configure/app_colors.dart';
import '../../controller/api_controller.dart';
import '../configure/app_widgets.dart';
import 'login.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

var _passwordController = TextEditingController();
var _confirmPasswordController = TextEditingController();
bool _hidePassword = true;

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  @override
  void initState() {
    // loginController.press.value = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Obx(
      () => internetController.internet.isTrue
          ? Scaffold(
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: h * 0.04,
                        ),

                        /// Logo
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: h * 0.02),
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

                        /// New Password Text
                        const Text('Enter New Password', style: AppStyle.title3,),
                        SizedBox(
                          height: h * 0.02,
                        ),

                        /// New Password Field
                        AppWidgets().inputField(context,
                            controller: _passwordController,
                            hintText: 'new_pass'.tr,
                            keyboardType: TextInputType.visiblePassword,
                            readOnly:
                                loginController.press.isFalse ? false : true,
                            icon: const Icon(
                              Icons.lock_outline,
                              color: AppColors.iconColor,
                            ),
                            autofillHints: AutofillHints.password,
                            obscureText: _hidePassword,
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  _hidePassword = !_hidePassword;
                                });
                              },
                              child: _hidePassword
                                  ?  Icon(
                                      Icons.visibility_off_outlined,
                                      color: AppColors.blackColor,
                                    )
                                  : const Icon(
                                      Icons.visibility_outlined,
                                      color: AppColors.iconColor,
                                    ),
                            )),

                        /// Confirm Password Field
                        AppWidgets().inputField(
                          context,
                          controller: _confirmPasswordController,
                          hintText: 'confirm_pass'.tr,
                          keyboardType: TextInputType.visiblePassword,
                          readOnly:
                              loginController.press.isFalse ? false : true,
                          icon: const Icon(
                            Icons.lock_outline,
                            color: AppColors.iconColor,
                          ),
                          autofillHints: AutofillHints.password,
                          obscureText: _hidePassword,
                        ),

                        /// Submit Button
                        loginController.press.isFalse
                            ? Padding(
                                padding: EdgeInsets.only(
                                    top: h * 0.04, bottom: h * 0.01),
                                child: AppWidgets().button(
                                  context,
                                  text: 'submit'.tr,
                                  height: h * 0.07,
                                  width: w * 0.65,
                                  radius: 10.0,
                                  color: AppColors.primaryColor,
                                  style: GoogleFonts.acme(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                        color: AppColors.textColor),
                                  ),
                                  press: () {
                                    if (_passwordController.text.toString() ==
                                            _confirmPasswordController.text.toString() &&
                                        _passwordController.text.length >= 5) {
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                                      // loginController.press.value = true;
                                      // submitForgetPassword(context, phone: loginController.phone.toString(), password: _passwordController.text.toString());

                                    } else {
                                      AppWidgets().wrongSnackBar(
                                          context, "Password Didn't Match");
                                    }
                                  },
                                ),
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
              ),
            )
          : AppWidgets().noInternet(),
    );
  }
}
