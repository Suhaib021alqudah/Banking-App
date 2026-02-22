import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/styling/app_assets.dart';
import 'package:flutter_application_1/core/widgets/back_icon.dart'
    show BackIcon;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const BackIcon(),
        Text(
          text,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
        ),
        Container(
          width: 48.w,
          height: 48.h,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: SvgPicture.asset(AppAssets.dots, fit: BoxFit.scaleDown),
        ),
      ],
    );
  }
}
