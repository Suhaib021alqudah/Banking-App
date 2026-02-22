import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/styling/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pop();
      },
      child: Container(
        width: 41.w,
        height: 41.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: BoxBorder.all(color: AppColors.borderColor),
        ),

        child: const Icon(Icons.arrow_back, color: AppColors.primaryColor),
      ),
    );
  }
}
