import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/routing/app_routes.dart';
import 'package:flutter_application_1/core/styling/app_assets.dart';
import 'package:flutter_application_1/core/styling/app_colors.dart';
import 'package:flutter_application_1/core/styling/app_font_styles.dart';
import 'package:flutter_application_1/core/widgets/back_icon.dart';
import 'package:flutter_application_1/core/features/auth/widgets/custom_text_field.dart';
import 'package:flutter_application_1/core/widgets/primary_button.dart';
import 'package:flutter_application_1/core/features/auth/widgets/social_media_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPassword = true;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12.h),
                  const BackIcon(),
                  SizedBox(height: 28.h),
                  Text(
                    'Welcome back! \nAgain!',
                    style: AppFontStyles.headlineStyle,
                  ),
                  SizedBox(height: 32.h),

                  CustomTextField(
                    textHint: 'Enter Your Email',
                    controller: emailController,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Your Email';
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: 15.h),

                  CustomTextField(
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Your Password';
                      } else if (value.length < 8) {
                        return 'The password length should be 8 characters at least';
                      }
                      return null;
                    },
                    textHint: 'Enter Your Password',
                    isPass: isPassword,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                      icon: Icon(
                        isPassword
                            ? Icons.remove_red_eye_outlined
                            : Icons.visibility_off_outlined,
                        color: const Color(0xff6A707C),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),

                  Row(
                    children: [
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(
                            context,
                          ).pushNamed(AppRoutes.forgetPasswordScreen);
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff6A707C),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),

                  PrimaryButton(
                    buttonText: 'Login',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        GoRouter.of(context).pushNamed(AppRoutes.mainScreen);
                      }
                    },
                  ),
                  SizedBox(height: 35.h),

                  Row(
                    children: [
                      const Expanded(
                        child: Divider(color: Color(0xff6A707C), thickness: 1),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: const Text(
                          'Or Login with',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff6A707C),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Divider(color: Color(0xff6A707C), thickness: 1),
                      ),
                    ],
                  ),
                  SizedBox(height: 22.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SocialMediaContainer(iconPath: AppAssets.faceBook),
                      SocialMediaContainer(iconPath: AppAssets.gmail),
                      SocialMediaContainer(iconPath: AppAssets.apple),
                    ],
                  ),
                  SizedBox(height: 155.h),

                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                        children: <TextSpan>[
                          const TextSpan(text: 'Don’t have an account? '),
                          TextSpan(
                            text: 'Register Now',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff202955),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                GoRouter.of(
                                  context,
                                ).pushNamed(AppRoutes.registerScreen);
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
