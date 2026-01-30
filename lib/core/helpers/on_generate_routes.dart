import 'dart:developer';
import 'package:cliniq/features/auth/presentation/screens/user_sign_up_screen.dart';
import 'package:cliniq/features/home/presentation/screens/user_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:cliniq/core/widgets/undefined_route_page.dart';
import 'package:cliniq/core/utils/app_routes.dart';
import 'package:cliniq/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:cliniq/features/auth/presentation/screens/login_screen.dart';
import 'package:cliniq/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:cliniq/features/auth/presentation/screens/verify_email_screen.dart';
import 'package:cliniq/features/auth/presentation/screens/verify_reset_code_screen.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings, BuildContext context) {
  log("Navigating to ${settings.name}");

  switch (settings.name) {
    case Routes.loginScreen:
      return MaterialPageRoute(builder: (_) => const LoginScreen());

    case Routes.userSignUpScreen:
      return MaterialPageRoute(builder: (_) => const UserSignUpScreen());

    case Routes.forgetPasswordScreen:
      return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());

    case Routes.resetPasswordScreen:
      return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());

    case Routes.verifyResetCodeScreen:
      return MaterialPageRoute(builder: (_) => const VerifyResetCodeScreen());

    case Routes.verifyEmailScreen:
      return MaterialPageRoute(builder: (_) => const VerifyEmailScreen());

    case Routes.userHomeScreen:
      return MaterialPageRoute(builder: (_) => const UserHomeScreen());

    default:
      return MaterialPageRoute(
        builder: (context) => const UndefinedRoutePage(),
      );
  }
}
