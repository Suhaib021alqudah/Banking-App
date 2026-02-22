import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/routing/app_routes.dart';
import 'package:flutter_application_1/core/styling/app_colors.dart';
import 'package:flutter_application_1/core/styling/app_font_styles.dart';
import 'package:flutter_application_1/core/widgets/back_icon.dart';
import 'package:flutter_application_1/core/features/auth/widgets/custom_text_field.dart';
import 'package:flutter_application_1/core/widgets/primary_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  late TextEditingController emailController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h),
                const BackIcon(),
                SizedBox(height: 28.h),
                Text('Forgot Password?', style: AppFontStyles.headlineStyle),
                SizedBox(height: 10.h),
                Text(
                  'Don\'t worry! It occurs. Please enter the email address linked with your account.',
                  style: AppFontStyles.subtitleStyle,
                ),
                const SizedBox(height: 32),
                CustomTextField(
                  textHint: 'Enter your email',
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Your Email';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 38),
                PrimaryButton(
                  buttonText: 'Send Code',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      GoRouter.of(
                        context,
                      ).pushNamed(AppRoutes.otpVerificationScreen);
                    }
                  },
                ),
                SizedBox(height: 361.h),
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                      children: <TextSpan>[
                        const TextSpan(text: 'Remember Password? '),
                        TextSpan(
                          text: 'Login',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff202955),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              if (formKey.currentState!.validate()) {
                                GoRouter.of(
                                  context,
                                ).pushNamed(AppRoutes.loginScreen);
                              }
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
