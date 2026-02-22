import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/styling/app_colors.dart';
import 'package:flutter_application_1/core/styling/app_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFontStyles {
  static TextStyle headlineStyle = TextStyle(
    fontSize: 30.sp,
    fontFamily: AppFonts.mainFont,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );

  static TextStyle subtitleStyle = TextStyle(
    fontSize: 16.sp,
    fontFamily: AppFonts.mainFont,
    fontWeight: FontWeight.w500,
    color: AppColors.secondryColor,
  );

  static TextStyle containerHedaTextStyle = TextStyle(
    fontSize: 16.sp,
    fontFamily: AppFonts.mainFont,
    fontWeight: FontWeight.w500,
    color: AppColors.containerTextColor,
  );

  static TextStyle containerBodyTextStyle = TextStyle(
    fontSize: 12.sp,
    fontFamily: AppFonts.mainFont,
    fontWeight: FontWeight.w500,
    color: AppColors.containerBodyTextColor,
  );

  static TextStyle forgroundButtonTextStyle = TextStyle(
    fontFamily: AppFonts.mainFont,
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static TextStyle forgroundOutlinedButtonTextStyle = TextStyle(
    fontFamily: AppFonts.mainFont,
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
    color: const Color(0xff617AFD),
  );

  static TextStyle textButtonTextStyle = TextStyle(
    fontFamily: AppFonts.mainFont,
    fontSize: 15.sp,
    fontWeight: FontWeight.bold,
    color: const Color(0xff202955),
    decoration: TextDecoration.underline,
  );
}
