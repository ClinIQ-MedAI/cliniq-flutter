import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/helpers/get_text_palette.dart';
import 'package:cliniq/core/utils/app_routes.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/widgets/custom_button.dart';
import 'package:cliniq/core/widgets/custom_text_form_field.dart';
import 'package:cliniq/core/widgets/custom_password_text_field.dart';
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
    emailController.removeListener(checkFormFilled);
    passwordController.removeListener(checkFormFilled);
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
    Navigator.pushNamed(context, Routes.createNewAccountScreen);
  }

  @override
  Widget build(BuildContext context) {
    final textPalette = getTextPalette(context);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 19.w),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  LocaleKeys.authLoginLogin.tr(),
                  style: AppTextStyles.getTextStyle(24).copyWith(
                    fontWeight: FontWeight.bold,
                    color: textPalette.primaryColor,
                  ),
                ),
                const VerticalGap(32),
                Row(
                  children: [
                    Text(
                      LocaleKeys.authLoginEmailAddress.tr(),
                      style: AppTextStyles.getTextStyle(
                        11,
                      ).copyWith(color: textPalette.secondaryColor),
                    ),
                  ],
                ),
                const VerticalGap(5),
                CustomTextFormField(controller: emailController),
                const VerticalGap(19),
                Row(
                  children: [
                    Text(
                      LocaleKeys.authLoginPassword.tr(),
                      style: AppTextStyles.getTextStyle(
                        11,
                      ).copyWith(color: textPalette.secondaryColor),
                    ),
                  ],
                ),
                const VerticalGap(5),
                CustomPasswordTextField(controller: passwordController),
                const VerticalGap(9),
                GestureDetector(
                  onTap: onForgotPasswordTap,
                  child: Text(
                    LocaleKeys.authLoginForgotPassword.tr(),
                    style: AppTextStyles.getTextStyle(11).copyWith(
                      color: textPalette.secondaryColor,
                      fontWeight: FontWeight.w300,
                      decoration: TextDecoration.underline,
                      decorationColor: textPalette.secondaryColor,
                    ),
                  ),
                ),
                const VerticalGap(33),
                CustomButton(
                  text: LocaleKeys.authLoginLogin.tr(),
                  textColor: textPalette.contentBackgroundColor,
                  onPressed: submitLoginForm,
                  isDisabled: !isButtonEnabled,
                ),
                const VerticalGap(16),
                GestureDetector(
                  onTap: onCreateNewAccountTap,
                  child: Text(
                    LocaleKeys.authLoginCreateNewAccount.tr(),
                    style: AppTextStyles.getTextStyle(16).copyWith(
                      color: Theme.of(context).primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor: Theme.of(context).primaryColor,
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
