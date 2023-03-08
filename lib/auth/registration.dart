import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/image_controller/image_get.dart';
import '../configure/app_colors.dart';
import '../configure/app_widgets.dart';
import '../controller/api_controller.dart';
import 'login.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  var nameController      = TextEditingController();
  var phoneController     = TextEditingController();
  var passwordController  = TextEditingController();

  bool mIsLoading = false;
  bool isChecked = false;
  bool hidePassword = true;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final imageGet = Provider.of<ImageGet>(context, listen: true);
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Obx(
      () => internetController.internet.isTrue
          ? Scaffold(
              body: Container(
                height: h,
                width: w,
                decoration: const BoxDecoration(color: AppColors.secondaryColor),
                child: SafeArea(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: h * 0.02,),


                        SizedBox(height: h * 0.02,),

                        ///Profile Photo
                        AppWidgets().profileImageStack(context),

                        ///Name
                        AppWidgets().inputField(
                          context,
                          controller: nameController,
                          hintText: 'Name',
                          keyboardType: TextInputType.name,
                          readOnly:
                              loginController.press.isFalse ? false : true,
                          icon: const Icon(Icons.account_circle_outlined,
                              color: AppColors.iconColor),
                          autofillHints: AutofillHints.name,
                          textCapitalizations: TextCapitalization.words,
                        ),

                        ///Phone
                        AppWidgets().inputField(
                          context,
                          controller: phoneController,
                          hintText: 'Phone',
                          keyboardType: TextInputType.phone,
                          readOnly:
                              loginController.press.isFalse ? false : true,
                          icon: const Icon(Icons.phone,
                              color: AppColors.iconColor),
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
                        SizedBox(height: h*0.03,),

                        ///Register Button
                        loginController.press.isFalse
                            ? Padding(
                          padding: EdgeInsets.only(bottom: h * 0.04),
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


                              press: (){

                                if(nameController.text != '' && phoneController.text != ''
                                    && phoneController.text.length == 11
                                    && phoneController.text.startsWith('01')) {

                                  registrationInfoController.name.value         = nameController.text.toString();
                                  registrationInfoController.phone.value        = phoneController.text.toString();
                                  registrationInfoController.from.value         = 'registration';
                                  registrationInfoController.type.value         = 'register';
                                  // registrationInfoController.profilePhoto.value = imageGet.getImage?.path;

                                  loginController.press.value = true;
                                  sendOtpRequest(context, phone: phoneController.text,
                                      type: registrationInfoController.type.toString(),
                                      from: registrationInfoController.from.toString());

                                  } else if(nameController.text == ''){
                                    AppWidgets().wrongSnackBar(context, 'error_name'.tr);
                                  } else if(phoneController.text == ''|| phoneController.text.length != 11 || !phoneController.text.startsWith('01')){
                                    AppWidgets().wrongSnackBar(context, 'error_phone'.tr);
                                  }

                              },

                          ),
                        )
                            : const Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: CupertinoActivityIndicator(radius: 20,),
                                ),
                              ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const LoginScreen()));
                          },
                          child: RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Already have an account?',
                                    style: AppStyle.title1),
                                TextSpan(
                                  text: '  Login Now.',
                                  style: AppStyle.title1,
                                ),
                              ],
                            ),
                            textScaleFactor: 0.5,
                          ),
                        ),

                        SizedBox(
                          height: h * 0.05,
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
