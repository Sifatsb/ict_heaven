// ignore_for_file: use_build_context_synchronously
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ict_heaven/controller/registration_info_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../auth/otp_match_page.dart';
import '../configure/app_widgets.dart';
import 'image_controller/image_get.dart';
import 'internet_controller.dart';
import 'login_controller.dart';

///Get X global variable
var loginController             = Get.put(LoginController());
var internetController          = Get.put(InternetController());
var registrationInfoController  = Get.put(RegistrationInfoController());

///local
// LocalUrl  = 'http://192.168.0.240:9009';
// ServerUrl = 'https://server.shanglap.com';

// var url = 'http://192.168.0.240:9009';
var url = 'https://server.shanglap.com';

var baseUrl      = '$url/api/v1';
var baseUrlAndro = '$url/andro/api';
var otpUrl       = '$url/api/v1/common';
var imageBaseUrl = '$url/api/get/file';
var videoBaseUrl = '$url/get/video';

///Send OTP Request
Future sendOtpRequest(BuildContext context, {phone, type, from}) async {
  var url = Uri.parse('$otpUrl/send-phone-otp');
  var response = await http.post(url, body: jsonEncode(<String, String>{
    'otp_phone': phone,
    "otp_type": type
  }), headers: {
    'Content-type' : 'application/json'
  });
  var body    = json.decode(response.body);
  var status  = body['success'];
  var message = body['message'];
  try {
    switch (status) {
      case true:
        {
          loginController.press.value = false;
          AppWidgets().successSnackBar(context, message);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OtpMatchScreen(phone: '$phone',),),);
        }
        break;
      case false:
        {
          debugPrint("otp failed");
          loginController.press.value = false;
          AppWidgets().wrongSnackBar(context, message.toString());
        }
    }
  } catch (e) {
    debugPrint('Registration With Queen Error: $e');
  }
}

///OTP Match
Future matchOtp(BuildContext context, phone, otp, type, from) async {
  var url = Uri.parse('$otpUrl/match-otp');
  var response = await http.post(url, body: jsonEncode({
    'user_phone': phone,
    'otp_type'  : type,
    'otp'       : otp
  }), headers: {
    "Content-Type": "application/json",
  });

  var body    = json.decode(response.body);
  var status  = body['success'];
  var message = body['message'];
  try {
    switch (status) {
      case true:
        {
          debugPrint('OTP Matched');
          loginController.token.value = '${body['token'] ?? ''}';
          loginController.press.value = false;
          from == 'registration'
              ? registration(context,
              phone : registrationInfoController.phone.toString(),
              name  : registrationInfoController.name.toString())
              : login(context, from: from, phone: registrationInfoController.phone.toString());
        }
        break;
      case false:
        {
          loginController.press.value = false;
          AppWidgets().wrongSnackBar(context, message.toString());
        }
    }
  } catch (e) {
    debugPrint('Registration With Queen Error: $e');
    loginController.press.value = false;
    AppWidgets().wrongSnackBar(context, message.toString());
  }
}

///Registration
Future registration(BuildContext context, {name, phone,}) async {

}

///Login
Future login(BuildContext context, {phone, from}) async {

}


