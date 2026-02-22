import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/features/card/views/card_view.dart';
import 'package:flutter_application_1/core/features/home/views/home_view.dart';
import 'package:flutter_application_1/core/features/profile/views/profile_view.dart';
import 'package:flutter_application_1/core/features/statistics/views/statistics_view.dart';
import 'package:flutter_application_1/core/styling/app_assets.dart';
import 'package:flutter_application_1/core/styling/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const HomeView(),
      const StatisticsView(),
      const SizedBox(),
      const CardView(),
      const ProfileView(),
    ];

    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          if (value == 2) {
            return;
          }
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          _buildItem(AppAssets.home, 'Home', 0),
          _buildItem(AppAssets.statistic, 'Statistic', 1),
          BottomNavigationBarItem(
            icon: Container(
              width: 48.w,
              height: 48.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    offset: const Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/svg/Plus.svg',
                  width: 20.w,
                  height: 20.h,
                ),
              ),
            ),
            label: '',
          ),
          _buildItem(AppAssets.card, 'My Card', 3),
          _buildItem(AppAssets.profile, 'Profile', 4),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildItem(String asset, String label, int index) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        asset,
        colorFilter: ColorFilter.mode(
          currentIndex == index ? AppColors.primaryColor : Colors.grey,
          BlendMode.srcIn,
        ),
      ),
      label: label,
    );
  }
}
