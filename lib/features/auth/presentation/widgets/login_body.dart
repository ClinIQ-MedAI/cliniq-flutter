import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/widgets/custom_button.dart';
import 'package:cliniq/core/widgets/custom_card_section.dart';
import 'package:cliniq/core/widgets/custom_password_text_field.dart';
import 'package:cliniq/core/widgets/custom_text_form_field.dart';
import 'package:cliniq/features/auth/presentation/widgets/auth_header.dart';
import 'package:cliniq/features/auth/presentation/widgets/auth_switch_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/utils/app_routes.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            AuthHeader(
              icon: Icons.login_rounded,
              title: LocaleKeys.authLoginTitle,
              description: LocaleKeys.authLoginDescription,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomCardSection(
                      children: [
                        CustomTextFormField(
                          controller: emailController,
                          hintText: LocaleKeys.authLoginEmailHint,
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: context.colorScheme.primary,
                          ),
                        ),
                        const VerticalGap(16),
                        CustomPasswordTextField(
                          controller: passwordController,
                          hintText: LocaleKeys.authLoginPasswordHint,
                        ),
                        const VerticalGap(12),
                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: TextButton(
                            onPressed: onForgotPasswordTap,
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              LocaleKeys.authLoginForgotPassword.tr(),
                              style: AppTextStyles.getTextStyle(13).copyWith(
                                color: context.theme.primaryColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.1),
                    const VerticalGap(32),
                    CustomButton(
                      text: LocaleKeys.authLoginButton,
                      onPressed: submitLoginForm,
                      isDisabled: !isButtonEnabled,
                    ).animate().fadeIn(delay: 600.ms),
                    const VerticalGap(24),
                    AuthSwitchWidget(
                      text: LocaleKeys.authLoginDontHaveAnAccount,
                      actionText: LocaleKeys.authLoginSignUp,
                      onActionTap: onCreateNewAccountTap,
                    ).animate().fadeIn(delay: 700.ms),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
