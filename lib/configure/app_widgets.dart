import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import '../auth/login.dart';
import '../controller/api_controller.dart';
import '../controller/image_controller/image_get.dart';
import 'app_colors.dart';

class AppWidgets {

  ///for button
  button(BuildContext context, {text, press, height, width, top, left, right, bottom, color, radius, style}){
    return Center(
      child: Container(
        width: width,
        height: height,
        margin: EdgeInsets.only(top: top ?? 0, left: left ?? 0, right: right ?? 0, bottom: bottom ?? 0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.only(top: 5,bottom: 5),
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius ?? 5)),
                backgroundColor: color ?? const Color(0xff0ce0ff)
            ),
            onPressed: press,
            child: Text(text,
              style: style ?? AppStyle.title1,
            )
        ),
      ),
    );
  }

  ///for input field
  inputField(BuildContext context, {controller, hintText, keyboardType, icon, autofillHints, obscureText, suffixIcon, readOnly, maxLine, textCapitalizations,}){
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 15, left: 25, right: 25),
      child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 1),
          height: 60,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppSize.borderRadiusSize),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(1, 1),
                  blurRadius: 10,
                ),
                BoxShadow(
                  color: Colors.transparent,
                  offset: Offset(-1, -1),
                  blurRadius: 10,
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(right: 10, bottom: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(.35),
                                blurRadius: 2,
                                spreadRadius: 1.5,
                                offset: const Offset(0, 2.0))
                          ]),
                      child: icon
                  ),

                  Expanded(
                    child: TextField(
                      controller: controller,
                      keyboardType: keyboardType,
                      textCapitalization: textCapitalizations ?? TextCapitalization.none,
                      obscureText: obscureText ?? false,
                      autofillHints: [autofillHints],
                      readOnly: readOnly ?? false,
                      textInputAction: TextInputAction.done,
                      maxLines: maxLine ?? 1,
                      style: const TextStyle(fontSize: 17, letterSpacing: 1),
                      decoration: InputDecoration(
                          hintText: hintText,
                          isCollapsed: true,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          suffixIcon: suffixIcon,
                          contentPadding: const EdgeInsets.only(top: 8, bottom: 18, left: 10)),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }

  ///Message Field
  msgInputField(BuildContext context, {controller, hintText, keyboardType, icon, obscureText, suffixIcon, readOnly, maxLine, minLine}){
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
        padding: const EdgeInsets.only(left: 3, right: 3, top: 3, bottom: 1),

        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(h*0.025),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(1, 1),
                blurRadius: 10,
              ),
              BoxShadow(
                color: Colors.transparent,
                offset: Offset(-1, -1),
                blurRadius: 10,
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [

                Expanded(
                  child: TextField(
                    controller: controller,
                    keyboardType: keyboardType,
                    obscureText: obscureText ?? false,
                    readOnly: readOnly ?? false,
                    textInputAction: TextInputAction.done,
                    minLines: minLine ?? 1,
                    maxLines: maxLine ?? 1,
                    style: const TextStyle(fontSize: 17, letterSpacing: 1),
                    decoration: InputDecoration(
                        hintText: hintText,
                        isCollapsed: true,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        suffixIcon: suffixIcon,
                        contentPadding: const EdgeInsets.only(top: 5, bottom: 8, left: 7)),
                  ),
                ),

                Container(
                    margin: const EdgeInsets.only(right: 10, bottom: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,),
                    child: icon
                ),

              ],
            ),
          ],
        ));
  }

  ///App Bar
  appBar(BuildContext context){
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.secondaryColor,
      leading: IconButton(onPressed: () {
        Navigator.pop(context);
      }, icon: const Icon(Icons.arrow_back, color: Colors.white,),),
    );
  }


  ///for submit button
  submitButton(BuildContext context, {required text, required press}) {
    return MaterialButton(
      onPressed: press,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 11,
        padding: const EdgeInsets.only(top: 5, right: 14, bottom: 18),
        child: Material(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$text',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            )),
      ),
    );
  }

  ///for drawer items
  drawerItems({required icon, required title, required onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: CircleAvatar(
          radius: 15,
          backgroundColor: AppColors.primaryColor,
          child: Icon(
            icon,
            color: AppColors.backgroundColor,
            size: 18,
          ),
        ),
        // leading: Icon(icon, color: AppColors.primaryColor),
        title: Text(
          title,
          style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }


  /// Profile image picker
  profileImageStack(BuildContext context) {
    final imageGet = Provider.of<ImageGet>(context, listen: true);
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        imageGet.getImage == null
            ? Container(
          width: h * 0.22,
          height: h * 0.22,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.primaryColor,
              width: 5.0,
            ),
            shape: BoxShape.circle,
            color: Colors.white70,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(h * 0.12),
            child: Image.asset(
              'assets/images/person.png',
              fit: BoxFit.contain,
            ),
          ),
        )
            : Stack(
          children: [
            Container(
              width: h * 0.22,
              height: h * 0.22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.green,
                  width: 5.0,
                ),
                color: Colors.white70,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(h * 0.12),
                child: Image.file(
                  imageGet.getImage,
                  fit: BoxFit.contain,
                ),
              ),
            )



          ],
        ),
        Positioned(
          top: h * 0.16,
          left: h * 0.15,
          child: AppWidgets().iconButton(
            context,
            press: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  actions: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {
                            imageGet.imagePick(from: 'gallery');
                            Navigator.pop(context, 'Gallery');
                          },
                          child: const Text('Gallery'),
                        ),
                        TextButton(
                          onPressed: () {
                            imageGet.imagePick(from: 'camera');
                            Navigator.pop(context, 'Camera');
                          },
                          child: const Text('Camera'),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
            icon: const Icon(
              Icons.camera_alt_outlined,
              size: 26,
            ),
          ),
        ),
      ],
    );
  }

  ///Show Loader Dialog
  loader(BuildContext context){
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
      AlertDialog alert = AlertDialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconColor: Colors.transparent,
        content: Center(child: Lottie.asset('assets/images/loader1.json')),
      );

    showDialog(
      barrierDismissible: false,
      context: context,
      barrierColor: AppColors.secondaryColor.withOpacity(0.15),
      builder: (BuildContext context){
        return alert;
      },
    );

  }

  ///for Icon Button
  iconButton(BuildContext context, {icon, press, size}){
    return GestureDetector(
      onTap: press,
      child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(right: 10, bottom: 8, left: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.35),
                    blurRadius: 2,
                    spreadRadius: 1.5,
                    offset: const Offset(0, 2.0))
              ]),
          child: icon
      ),
    );
  }

  ///for Simple Icon Button
  simpleIconButton(BuildContext context, {icon, press, size, color}){
      return GestureDetector(
      onTap: press,
      child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: icon),
    );
  }

  ///for snack bar
  successSnackBar(BuildContext context, String exp){
    return Get.snackbar('Success', exp,
      icon: const Icon(Icons.check, color: Colors.white),
      snackPosition: SnackPosition.TOP,
      borderRadius: 8,
      margin: const EdgeInsets.all(15),
      backgroundColor: Colors.green,
      colorText: Colors.white,
      duration: const Duration(seconds: 4),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }

  ///for wrong snack bar
  wrongSnackBar(BuildContext context, String exp){
    return Get.snackbar('Something wrong', exp,
      icon: const Icon(Icons.error_outline, color: Colors.white),
      snackPosition: SnackPosition.TOP,
      borderRadius: 8,
      margin: const EdgeInsets.all(15),
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: const Duration(seconds: 4),
      isDismissible: true,
      dismissDirection: DismissDirection.vertical,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }

  ///for exit alert dialog
  exitAlertDialog(BuildContext context, {required from}) async {
    bool exitApp = await showCupertinoDialog(
        context: context,
        builder: (context){
          return CupertinoAlertDialog(
            title: const Text('Confirmation'),
            content: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'Are you sure want to ${from == 'exit' ? 'exit' : 'logout'} from '),
                  TextSpan(
                    text: from == 'exit' ? 'Ict Heaven?' : '${loginController.name}?',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: ()=> Navigator.of(context).pop(false),
                  child: Text(from == 'exit' ? 'NO' : 'CANCEL',style: const  TextStyle(color: AppColors.primaryColor),)
              ),
              TextButton(
                  onPressed: (){
                    from == 'exit' ? SystemNavigator.pop() : logout(context);
                  },
                  child: Text(from == 'exit' ? 'EXIT' : 'LOGOUT',style: const TextStyle(color: AppColors.redColor),)
              ),
            ],
          );
        }
    );
    return exitApp;
  }
  logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', '');
    await prefs.setString('email', '');
    await prefs.setString('password', '');
    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoginScreen()), (route) => false);
  }

  ///No More Trainings are Available
  noMorePosts(BuildContext context, hasMore){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Center(
        child: hasMore ? shimmerSkeleton(context) : const Text('No More Posts are Available'),
        // child: shimmerSkeleton(context),
      ),
    );
  }

  ///Icon show with text
  customRow(BuildContext context, {icon, text, onTap}){
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, size: 22, color: Colors.grey,),
          const SizedBox(height: 3),
          Text(text, style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
              letterSpacing: 1,
              fontWeight: FontWeight.bold
          ),)
        ],
      ),
    );
  }

  ///OTP Field
  otpField(BuildContext context, controller){
    return SizedBox(
      height: Get.width * 0.15,
      // height: 60,
      child: AspectRatio(
        aspectRatio: 1.0,

        child: TextField(
          controller: controller,
          autofocus: true,
          onChanged: (value){
            if(value.length == 1){
              FocusScope.of(context).nextFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          // maxLength: 1,
          inputFormatters: [LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            counter: const Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Colors.purple),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }

  ///Back Button
  backButton(BuildContext context, {color}){
    return Align(
      alignment: Alignment.topLeft,
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Icon(
          Icons.arrow_back,
          size: 32,
          color: color,
        ),
      ),
    );
  }

  ///Divider
  customDivider(BuildContext context, {color, thickness, height, width}) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height ?? h,
      width: width ?? w,
      child: Divider(
        color: color ?? Colors.redAccent,
        thickness: thickness ?? 0.05,
      ),
    );
  }

  /// Circular Logo
  circularLogo(BuildContext context, {outerRadius, innerRadius}) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return CircleAvatar(
      backgroundColor: AppColors.secondaryColor,
      radius: outerRadius,
      child: CircleAvatar(
        backgroundColor: Colors.white70,
        radius: innerRadius,
        backgroundImage: const AssetImage('assets/images/logo.png'),
      ),
    );
  }

  /// No internet connection
  noInternet() {
    return Center(
      child: Container(
        height: Get.height,
        color: Colors.white,
        child: Lottie.asset('assets/jsons/no_internet.json'),
      ),
    );
  }

  ///Shimmer View
  shimmerSkeleton(BuildContext context){
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 3,
      separatorBuilder: (context, index) => SizedBox(height: h*0.01),
      itemBuilder: (BuildContext context, index){
        return Shimmer.fromColors(
            baseColor: Colors.black.withOpacity(0.1),
            highlightColor: Colors.black.withOpacity(0.15),
            child: Column(
              children: [
                Row(children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15, right: 10, top: 10, bottom: 10),
                    child: CircleAvatar(
                      radius: 24,
                    ),
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: h * 0.03,
                        width: w * 0.55,
                        color: Colors.red,
                      ),

                      Container(
                        margin: EdgeInsets.only(top: h * 0.01,),
                        height: h * 0.02,
                        width: w * 0.4,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ],),
                Container(
                  height: h * 0.2,
                  width: w * 0.65,
                  margin: EdgeInsets.symmetric(vertical: h * 0.005),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5)
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 6, bottom: 20),
                  height: h * 0.05,
                  width: w * 0.9,
                  color: Colors.red,
                ),
              ],
            )
        );
      },
    );
  }
}


