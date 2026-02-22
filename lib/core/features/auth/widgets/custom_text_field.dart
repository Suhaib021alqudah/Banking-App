import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/styling/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.textHint,
    this.suffixIcon,
    this.width,
    this.height,
    this.isPass,
    this.controller,
    this.validator,
  });
  final String textHint;
  final Widget? suffixIcon;
  final double? width;
  final double? height;
  final bool? isPass;
  final TextEditingController? controller;
  final validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      cursorColor: AppColors.primaryColor,
      obscureText: isPass ?? false,
      decoration: InputDecoration(
        hintText: textHint,
        hintStyle: TextStyle(
          color: const Color(0xff8391A1),
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
        ),
        contentPadding: EdgeInsets.all(18.w),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: Color(0xffe8ecf4)),
        ),
        fillColor: const Color(0xfff7f8f9),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: Color(0xffe8ecf4)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: Colors.red),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
