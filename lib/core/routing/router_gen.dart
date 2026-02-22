import 'package:flutter_application_1/core/features/auth/views/create_new_password_screen.dart';
import 'package:flutter_application_1/core/features/auth/views/forget_password.dart';
import 'package:flutter_application_1/core/features/auth/views/login_screen.dart';
import 'package:flutter_application_1/core/features/auth/views/on_boarding.dart';
import 'package:flutter_application_1/core/features/home/views/home_view.dart';
import 'package:flutter_application_1/core/features/otp/screen/otp_verification_screen.dart';
import 'package:flutter_application_1/core/features/auth/views/password_changes_screen.dart';
import 'package:flutter_application_1/core/features/auth/views/register_screen.dart';
import 'package:flutter_application_1/core/features/main/views/main_screen.dart';
import 'package:flutter_application_1/core/routing/app_routes.dart';
import 'package:go_router/go_router.dart';

class RouterGen {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.onBoardingScreen,
    routes: [
      GoRoute(
        path: AppRoutes.onBoardingScreen,
        name: AppRoutes.onBoardingScreen,
        builder: (context, state) {
          return const OnBoardingScreen();
        },
      ),

      GoRoute(
        path: AppRoutes.loginScreen,
        name: AppRoutes.loginScreen,
        builder: (context, state) {
          return const LoginScreen();
        },
      ),

      GoRoute(
        path: AppRoutes.mainScreen,
        name: AppRoutes.mainScreen,
        builder: (context, state) {
          return const MainScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.registerScreen,
        name: AppRoutes.registerScreen,
        builder: (context, state) {
          return const RegisterScreen();
        },
      ),

      GoRoute(
        path: AppRoutes.forgetPasswordScreen,
        name: AppRoutes.forgetPasswordScreen,
        builder: (context, state) {
          return const ForgetPassword();
        },
      ),

      GoRoute(
        path: AppRoutes.otpVerificationScreen,
        name: AppRoutes.otpVerificationScreen,
        builder: (context, state) {
          return const OtpVerificationScreen();
        },
      ),

      GoRoute(
        path: AppRoutes.passwordChangeScreen,
        name: AppRoutes.passwordChangeScreen,
        builder: (context, state) {
          return const PasswordChangesScreen();
        },
      ),

      GoRoute(
        path: AppRoutes.createNewPasswordScreen,
        name: AppRoutes.createNewPasswordScreen,
        builder: (context, state) {
          return const CreateNewPasswordScreen();
        },
      ),

      GoRoute(
        path: AppRoutes.homeView,
        name: AppRoutes.homeView,
        builder: (context, state) {
          return const HomeView();
        },
      ),
    ],
  );
}
