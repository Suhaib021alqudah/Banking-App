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

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController userNameControoler;
  late TextEditingController confirmPasswordController;
  final formKey = GlobalKey<FormState>();

  bool isPassword = true;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    userNameControoler = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    userNameControoler.dispose();
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

            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12.h),

                  const BackIcon(),
                  SizedBox(height: 28.h),
                  Text(
                    'Hello! Register to get\nstarted',
                    style: AppFontStyles.headlineStyle,
                  ),
                  SizedBox(height: 32.h),
                  CustomTextField(
                    textHint: 'Username',
                    controller: userNameControoler,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Your Username';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 12.h),
                  CustomTextField(
                    textHint: 'Email',
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Your Email';
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: 12.h),
                  CustomTextField(
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
                    isPass: isPassword,
                    textHint: 'Password',
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Your Password';
                      } else if (value.length < 8) {
                        return 'The password length should be 8 characters at least';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 12.h),
                  CustomTextField(
                    isPass: isPassword,
                    textHint: 'Confirm password',
                    controller: confirmPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Confirm Your Password';
                      }
                      if (value != passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
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
                  SizedBox(height: 32.h),
                  PrimaryButton(
                    buttonText: 'Register',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        GoRouter.of(context).pushNamed(AppRoutes.loginScreen);
                      }
                    },
                  ),
                  SizedBox(height: 33.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(width: 112.w, child: const Divider()),
                      const Text(
                        'Or Register with',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff6A707C),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 112.w, child: const Divider()),
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
                  SizedBox(height: 54.h),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                        children: <TextSpan>[
                          const TextSpan(text: 'Already have an account? '),
                          TextSpan(
                            text: 'Login Now',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff202955),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                GoRouter.of(
                                  context,
                                ).pushNamed(AppRoutes.loginScreen);
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
      ),
    );
  }
}
