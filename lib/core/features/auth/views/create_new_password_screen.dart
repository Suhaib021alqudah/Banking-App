import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/routing/app_routes.dart';
import 'package:flutter_application_1/core/styling/app_font_styles.dart';
import 'package:flutter_application_1/core/widgets/back_icon.dart';
import 'package:flutter_application_1/core/features/auth/widgets/custom_text_field.dart';
import 'package:flutter_application_1/core/widgets/primary_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  bool isPassword = true;

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h),
                const BackIcon(),
                SizedBox(height: 28.h),

                Text('Create new password', style: AppFontStyles.headlineStyle),
                SizedBox(height: 10.h),
                Text(
                  'Your new password must be unique from those previously used.',
                  style: AppFontStyles.subtitleStyle,
                ),

                SizedBox(height: 32.h),
                CustomTextField(
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
                SizedBox(height: 15.h),
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
                ),
                SizedBox(height: 38.h),
                PrimaryButton(
                  buttonText: 'Reset Password',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      GoRouter.of(
                        context,
                      ).pushNamed(AppRoutes.passwordChangeScreen);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
