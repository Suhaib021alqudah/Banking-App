import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/styling/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialMediaContainer extends StatelessWidget {
  const SocialMediaContainer({super.key, required this.iconPath});
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105.w,
      height: 56.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: BoxBorder.all(color: AppColors.borderColor),
      ),
      child: Center(child: SvgPicture.asset(iconPath)),
    );
  }
}
