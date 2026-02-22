import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/routing/router_gen.dart';
import 'package:flutter_application_1/core/styling/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp.router(
          theme: AppTheme.lightTheme,
          routerConfig: RouterGen.goRouter,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
