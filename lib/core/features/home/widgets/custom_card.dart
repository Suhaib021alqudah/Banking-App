import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/styling/app_assets.dart';
import 'package:flutter_application_1/core/styling/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 207.w,
      height: 263.h,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        // image: DecorationImage(
        //   image: AssetImage(AppAssets.circles),

        // ),
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
            child: SvgPicture.asset(AppAssets.circles),
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
                const SizedBox(height: 57),
                Text(
                  'Balance',
                  style: TextStyle(
                    color: const Color(0xffFDFDFD),
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
                const SizedBox(height: 8),
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
            bottom: 24.sp,
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
        ],
      ),
    );
  }
}
