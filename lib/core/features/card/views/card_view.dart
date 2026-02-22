import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/features/card/widgets/land_card.dart';
import 'package:flutter_application_1/core/features/card/widgets/nav_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardView extends StatefulWidget {
  const CardView({super.key});

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              const NavBar(text: 'My Cards'),
              SizedBox(height: 24.h),
              LandCard(),
              const SizedBox(height: 24),
              LandCard(color: const Color(0xff4151A6)),
            ],
          ),
        ),
      ),
    );
  }
}
