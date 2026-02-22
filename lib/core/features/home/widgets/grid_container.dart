import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class GridContainer extends StatelessWidget {
  const GridContainer({
    super.key,
    required this.iconPath,
    required this.gridHead,
    required this.gridBody,
  });
  final String iconPath;
  final String gridHead;
  final String gridBody;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156.w,
      height: 140.h,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffE3E9ED), width: 1),
        borderRadius: BorderRadius.circular(16.r),
        color: const Color(0xffFDFDFD),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16.h),
          Container(
            width: 48.h,
            height: 48.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: const Color(0xffECF1F6),
            ),
            child: Center(
              child: SvgPicture.asset(iconPath, width: 24.w, height: 24.h),
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            gridHead,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          SizedBox(height: 4.h),
          Text(
            gridBody,
            style: const TextStyle(
              color: Color(0xff9CA4AB),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
