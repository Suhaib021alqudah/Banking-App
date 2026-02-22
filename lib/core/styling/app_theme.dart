import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/styling/app_colors.dart';
import 'package:flutter_application_1/core/styling/app_fonts.dart';
import 'package:flutter_application_1/core/styling/app_font_styles.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: AppFonts.mainFont,
    textTheme: TextTheme(
      titleLarge: AppFontStyles.headlineStyle,
      titleMedium: AppFontStyles.subtitleStyle,
    ),

    buttonTheme: const ButtonThemeData(buttonColor: AppColors.primaryColor),
  );
}
