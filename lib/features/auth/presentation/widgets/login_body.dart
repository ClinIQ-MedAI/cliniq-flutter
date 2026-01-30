import 'package:cliniq/core/utils/app_images.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/widgets/custom_button.dart';
import 'package:cliniq/core/widgets/custom_password_text_field.dart';
import 'package:cliniq/core/widgets/custom_text_form_field.dart';
import 'package:cliniq/features/auth/presentation/widgets/auth_page_layout.dart';
import 'package:cliniq/features/auth/presentation/widgets/auth_switch_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/utils/app_routes.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/features/auth/presentation/providers/login_provider.dart';

class LoginBody extends ConsumerStatefulWidget {
  const LoginBody({super.key});

  @override
  ConsumerState<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends ConsumerState<LoginBody> {
  final passwordController = TextEditingController();

  final emailController = TextEditingController();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(checkFormFilled);
    passwordController.addListener(checkFormFilled);
  }

  void checkFormFilled() {
    final isFilled =
        emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
    if (isFilled != isButtonEnabled) {
      setState(() {
        isButtonEnabled = isFilled;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void submitLoginForm() {
    ref
        .read(loginProvider.notifier)
        .loginWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
  }

  void onForgotPasswordTap() {
    Navigator.pushNamed(context, Routes.forgetPasswordScreen);
  }

  void onGoogleLoginTap() {}

  void onCreateNewAccountTap() {
    Navigator.pushNamed(context, Routes.userSignUpScreen);
  }

  @override
  Widget build(BuildContext context) {
    return AuthPageLayout(
      topSection: Image.asset(AppImages.loginLogo),
      bottomSection: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VerticalGap(45),
            CustomTextFormField(
              controller: emailController,
              hintText: LocaleKeys.authLoginEmailHint,
            ),
            const VerticalGap(32),
            CustomPasswordTextField(
              controller: passwordController,
              hintText: LocaleKeys.authLoginPasswordHint,
            ),
            const VerticalGap(12),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: context.isDark
                        ? Color(0xFFFFFFFF).withValues(alpha: 0.1)
                        : Color(0xFF000000).withValues(alpha: 0.1),
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: onForgotPasswordTap,
                child: Text(
                  LocaleKeys.authLoginForgotPassword.tr(),
                  style: AppTextStyles.getTextStyle(
                    10,
                  ).copyWith(color: context.theme.primaryColor),
                ),
              ),
            ),
            const VerticalGap(85),
            CustomButton(
              text: LocaleKeys.authLoginButton.tr(),
              onPressed: submitLoginForm,
              isDisabled: !isButtonEnabled,
            ),
            const VerticalGap(16),
            AuthSwitchWidget(
              text: LocaleKeys.authLoginDontHaveAnAccount,
              actionText: LocaleKeys.authLoginSignUp,
              onActionTap: onCreateNewAccountTap,
            ),
          ],
        ),
      ),
    );
  }
}
