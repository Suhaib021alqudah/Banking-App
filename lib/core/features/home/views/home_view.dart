import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/features/card/widgets/land_card.dart';
import 'package:flutter_application_1/core/features/home/widgets/custom_card.dart';
import 'package:flutter_application_1/core/features/home/widgets/grid_container.dart';
import 'package:flutter_application_1/core/features/home/widgets/profile_imgae.dart';
import 'package:flutter_application_1/core/styling/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  // Moved to build method or initialized in initState if you need context
  // but it's fine here if AppAssets doesn't rely on context.
  List<Widget> gridContainers = [
    GridContainer(
      iconPath: AppAssets.sendIcon,
      gridHead: 'Send the Money',
      gridBody: 'Take acc to acc',
    ),
    GridContainer(
      iconPath: AppAssets.filledWalltet,
      gridHead: 'Pay the bill',
      gridBody: 'Lorem ipsum',
    ),
    GridContainer(
      iconPath: AppAssets.sendIcon,
      gridHead: 'Request',
      gridBody: 'Lorem ipsum',
    ),
    GridContainer(
      iconPath: AppAssets.people,
      gridHead: 'Contact',
      gridBody: 'Lorem ipsum',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 19.h),
              Row(
                children: [
                  const ProfileImage(),
                  SizedBox(width: 11.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome back',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: const Color(0xff9CA4AB),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Suhaib Alqudah',
                        style: TextStyle(
                          fontSize: 18.sp, // Added .sp for consistency
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: 48.w,
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: const Color(0xffFDFDFD),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xffE3E9ED),
                        width: 1.r,
                      ),
                    ),
                    child: SvgPicture.asset(
                      AppAssets.notification,
                      width: 24.w,
                      height: 24.h,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 21.h),
              CarouselSlider(
                options: CarouselOptions(
                  height: 263.0.h,
                  padEnds: false,
                  enlargeCenterPage: true,
                  viewportFraction: 0.6,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
                items: [
                  const CustomCard(),
                  LandCard(color: const Color(0xff4151A6)),
                  const CustomCard(),
                ],
              ),
              SizedBox(height: 16.h),
              Center(
                child: DotsIndicator(
                  dotsCount: 3,
                  position: currentIndex.toDouble(),
                  decorator: DotsDecorator(
                    spacing: EdgeInsets.symmetric(horizontal: 4.w),
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),

              // FIX: Wrapped GridView in Expanded to prevent unbounded height errors
              Expanded(
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                  ),
                  itemCount: gridContainers.length,
                  itemBuilder: (context, index) {
                    return gridContainers[index];
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
