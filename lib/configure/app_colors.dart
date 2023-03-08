import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors{
  static const primaryColor       = Color(0xFFF2598F);
  static const secondaryColor     = Color(0xFF669E9D);
  static const backgroundColor    = Color(0xFF0b1715);
  static const iconColor          = Color(0xFF18181B);
  static var shadowColor          = Colors.grey.shade200;
  static const appBarColor        = Colors.white;
  static const redColor           = Colors.redAccent;
  static const greyColor          = Color(0xFF8a9694);
  static const textColor          = Colors.black;
  static const primaryTextColor   = Colors.white;
  static const grayLight          = Color(0xFF8b97a2);
  static const whiteColor         = Colors.white;
  static const blackColor         = Colors.black;
  static final gradientColor      = [primaryColor, secondaryColor];
}

class AppStyle{
  static const titleText          = TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: AppColors.textColor);
  static const timingText         = TextStyle(color: Colors.white);
  static const appTitle           = 'Ict Heaven';
  static const checkOutStyle      = TextStyle(fontWeight: FontWeight.w600, fontSize: 15);
  static const checkOutTextStyle  = TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: AppColors.textColor);
  static const title1             = TextStyle(fontWeight: FontWeight.bold, fontSize: 28, color: AppColors.textColor);
  static const title2             = TextStyle(fontWeight: FontWeight.bold, fontSize: 28, color: AppColors.primaryTextColor);
  static const title3             = TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: AppColors.textColor);
  static const title3Override     = TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: AppColors.textColor);
  static const namazText          = TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.textColor);
  static const title1Override     = TextStyle(fontWeight: FontWeight.w200, fontSize: 16, color: AppColors.greyColor);
  static const bodyText1          = TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Colors.black);
  static const bodyText1Override  = TextStyle(fontWeight: FontWeight.w200, fontSize: 14, color: AppColors.textColor, letterSpacing: 1);
}

class AppSize{
  static const borderRadiusSize = 8.00;
}