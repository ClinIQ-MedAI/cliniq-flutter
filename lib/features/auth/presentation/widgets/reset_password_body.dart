import 'package:cliniq/core/utils/app_images.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/features/auth/presentation/widgets/auth_page_layout.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/validators.dart';
import 'package:cliniq/core/widgets/custom_button.dart';
import 'package:cliniq/core/widgets/custom_password_text_field.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/features/auth/presentation/providers/reset_password_provider.dart';

class ResetPasswordBody extends ConsumerStatefulWidget {
  const ResetPasswordBody({super.key});

  @override
  ConsumerState<ResetPasswordBody> createState() => _ResetPasswordBodyState();
}

class _ResetPasswordBodyState extends ConsumerState<ResetPasswordBody> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    passwordController.addListener(checkPassword);
    confirmPasswordController.addListener(checkPassword);
  }

  void checkPassword() {
    final isFilled =
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty;
    if (isFilled != isButtonEnabled) {
      setState(() {
        isButtonEnabled = isFilled;
      });
    }
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void onSendCodeTap() async {
    if (formKey.currentState!.validate()) {
      ref
          .read(resetPasswordProvider.notifier)
          .resetPassword(
            newPassword: passwordController.text,
            confirmPassword: confirmPasswordController.text,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthPageLayout(
      topSection: Image.asset(AppImages.verifyEmailLogo),
      bottomSection: Form(
        key: formKey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const VerticalGap(45),
                    Text(
                      LocaleKeys.resetPasswordSetNewPassword.tr(),
                      style: AppTextStyles.getTextStyle(24).copyWith(
                        fontWeight: FontWeight.w700,
                        color: context.textPalette.primaryColor,
                      ),
                    ),
                    const VerticalGap(40),
                    CustomPasswordTextField(
                      validator: Validators.validatePassword,
                      controller: passwordController,
                      hintText: LocaleKeys.resetPasswordPasswordHint.tr(),
                    ),
                    const VerticalGap(16),
                    CustomPasswordTextField(
                      validator: (value) => Validators.confirmPasswordValidator(
                        value,
                        passwordController.text,
                      ),
                      controller: confirmPasswordController,
                      hintText: LocaleKeys.resetPasswordConfirmPasswordHint
                          .tr(),
                    ),
                    const VerticalGap(32),
                    CustomButton(
                      onPressed: onSendCodeTap,
                      isDisabled: !isButtonEnabled,
                      text: LocaleKeys.resetPasswordReset.tr(),
                    ),
                    const VerticalGap(45),
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
