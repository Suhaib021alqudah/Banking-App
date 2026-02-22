import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/routing/app_routes.dart';
import 'package:flutter_application_1/core/styling/app_colors.dart';
import 'package:flutter_application_1/core/styling/app_font_styles.dart';
import 'package:flutter_application_1/core/widgets/back_icon.dart';
import 'package:flutter_application_1/core/widgets/primary_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController otpCodeController;

  @override
  void initState() {
    otpCodeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    otpCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h),
                const BackIcon(),
                SizedBox(height: 28.h),
                Text('OTP Verification', style: AppFontStyles.headlineStyle),
                SizedBox(height: 10.h),
                Text(
                  'Enter the verification code we just sent on your \nemail address.',
                  style: AppFontStyles.subtitleStyle,
                ),
                const SizedBox(height: 32),

                PinCodeTextField(
                  appContext: context,
                  length: 4,
                  controller: otpCodeController,
                  enableActiveFill: true,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    fieldWidth: 70.w,
                    fieldHeight: 60.h,
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8.r),
                    selectedColor: AppColors.primaryColor,
                    activeColor: AppColors.primaryColor,
                    activeFillColor: Colors.white,
                    selectedFillColor: Colors.white,

                    inactiveColor: const Color(0xffF7F8F9),
                    inactiveFillColor: const Color(0xffF7F8F9),
                  ),
                ),

                const SizedBox(height: 38),
                PrimaryButton(
                  buttonText: 'Verify',
                  onPressed: () {
                    GoRouter.of(
                      context,
                    ).pushNamed(AppRoutes.createNewPasswordScreen);
                  },
                ),
                SizedBox(height: 340.h),
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                      children: <TextSpan>[
                        const TextSpan(text: 'Didn’t received code?'),
                        TextSpan(
                          text: 'Resend',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff202955),
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
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
