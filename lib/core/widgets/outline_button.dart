import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/styling/app_colors.dart';
import 'package:flutter_application_1/core/styling/app_font_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OutlineButton extends StatelessWidget {
  const OutlineButton({super.key, required this.buttonText, this.onPressed});
  final String buttonText;

  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        side: const BorderSide(color: AppColors.primaryColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8.r),
        ),
        fixedSize: Size(331.w, 56.h),
      ),
      child: Text(
        buttonText,
        style: AppFontStyles.forgroundOutlinedButtonTextStyle,
      ),
    );
  }
}
