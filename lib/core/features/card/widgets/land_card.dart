import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/styling/app_assets.dart';
import 'package:flutter_application_1/core/styling/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class LandCard extends StatelessWidget {
  LandCard({super.key, this.color});
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 179.h,
      decoration: BoxDecoration(
        color: color ?? AppColors.primaryColor,

        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            offset: const Offset(0, 4),
            color: Colors.black.withValues(alpha: 0.25),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: SvgPicture.asset(AppAssets.circles, fit: BoxFit.fill),
          ),

          Positioned(
            left: 24.w,
            right: 24.w,
            top: 24.h,
            bottom: 24.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'X - Card',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 18.h),
                Text(
                  'Balance',
                  style: TextStyle(
                    color: const Color(0xffFDFDFD),
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                const Text(
                  '23400 JD',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 24.sp,
            bottom: 17.sp,
            child: Text(
              '****  3434',
              style: TextStyle(
                color: const Color(0xffFDFDFD),
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ),
          ),
          Positioned(
            bottom: 26.h,
            right: 24.w,
            child: Text(
              '12/24',
              style: TextStyle(
                color: const Color(0xffFDFDFD),
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
              ),
            ),
          ),

          Positioned(
            top: 26.h,
            right: 29.w,
            child: SvgPicture.asset(AppAssets.visa),
          ),
        ],
      ),
    );
  }
}
