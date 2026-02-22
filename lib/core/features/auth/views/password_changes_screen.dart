import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/routing/app_routes.dart';
import 'package:flutter_application_1/core/styling/app_font_styles.dart';
import 'package:flutter_application_1/core/widgets/primary_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class PasswordChangesScreen extends StatelessWidget {
  const PasswordChangesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/svg/Successmark.svg'),
            SizedBox(height: 35.h),
            Text('Password Changed!', style: AppFontStyles.headlineStyle),
            SizedBox(height: 8.h),
            Text(
              'Your password has been changed successfully.!',
              style: AppFontStyles.subtitleStyle,
            ),
            SizedBox(height: 40.h),

            PrimaryButton(
              buttonText: 'Back to Login',
              onPressed: () {
                GoRouter.of(context).pushReplacement(AppRoutes.loginScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
