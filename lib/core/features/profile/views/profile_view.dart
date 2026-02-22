import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/features/profile/widgets/image_profile.dart';
import 'package:flutter_application_1/core/features/profile/widgets/navi_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NaviBar(),
              SizedBox(height: 40.h),

              const Center(child: ImageProfile()),
              SizedBox(height: 9.h),
              const Fields(head: 'Full Name', body: 'Suhaib ALqudah'),
              SizedBox(height: 16.h),

              const Fields(head: 'Email', body: 'alqudahsuhaib@gmail.com'),
              SizedBox(height: 16.h),

              const Fields(head: 'Phone Number', body: '0786216781'),
              SizedBox(height: 16.h),

              const Fields(head: 'Address', body: 'Amman - Jordan'),
            ],
          ),
        ),
      ),
    );
  }
}

class Fields extends StatelessWidget {
  const Fields({super.key, required this.head, required this.body});
  final String head;
  final String body;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          head,
          style: TextStyle(
            color: const Color(0xff9CA4AB),
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          body,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 6.h),
        const Divider(color: Color(0xffF2F2F5)),
      ],
    );
  }
}
