import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/routing/app_routes.dart';
import 'package:flutter_application_1/core/styling/app_assets.dart';
import 'package:flutter_application_1/core/styling/app_font_styles.dart';
import 'package:flutter_application_1/core/widgets/outline_button.dart';
import 'package:flutter_application_1/core/widgets/primary_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.imageOnBoarding,
                  width: 450.w,
                  height: 500.h,
                ),
                SizedBox(height: 21.h),
                Column(
                  children: [
                    PrimaryButton(
                      onPressed: () => context.pushNamed(AppRoutes.loginScreen),
                      buttonText: 'Login',
                    ),
                    SizedBox(height: 15.h),
                    OutlineButton(
                      buttonText: 'Register',
                      onPressed: () =>
                          context.pushNamed(AppRoutes.registerScreen),
                    ),
                    SizedBox(height: 46.h),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Continue as a guest',
                        style: AppFontStyles.textButtonTextStyle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
