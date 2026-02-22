import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/features/card/widgets/nav_bar.dart';
import 'package:flutter_application_1/core/features/home/widgets/grid_container.dart';
import 'package:flutter_application_1/core/features/statistics/widgets/monthly_bar.dart';
import 'package:flutter_application_1/core/styling/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatisticsView extends StatefulWidget {
  const StatisticsView({super.key});

  @override
  State<StatisticsView> createState() => _StatisticsViewState();
}

class _StatisticsViewState extends State<StatisticsView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              const NavBar(text: 'Relaod'),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Jan 28 - May 28, 2025 ',
                    style: TextStyle(
                      color: const Color(0xff9CA4AB),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const DropDownButton(),
                ],
              ),
              SizedBox(
                width: 327.w,
                height: 236.h,
                child: const MonthlyBarChart(),
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GridContainer(
                    iconPath: AppAssets.download,
                    gridHead: '15000 JD',
                    gridBody: 'Income',
                  ),

                  GridContainer(
                    iconPath: AppAssets.upload,
                    gridHead: '3500 JD',
                    gridBody: 'OutCome',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DropDownButton extends StatefulWidget {
  const DropDownButton({super.key});

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  @override
  Widget build(BuildContext context) {
    String selectedValue = 'Monthly';
    return Container(
      width: 101.w,
      height: 38.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xffB9C4FF),
      ),
      child: Center(
        child: DropdownButton(
          value: selectedValue,
          items: ['Daily', 'Weekly', 'Monthly', 'Yearly']
              .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: const Color(0xff1F2C37),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              })
              .toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue!;
            });
          },
        ),
      ),
    );
  }
}
