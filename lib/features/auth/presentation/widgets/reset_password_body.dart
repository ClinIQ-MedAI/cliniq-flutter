import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/helpers/get_text_palette.dart';
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
    passwordController.removeListener(checkPassword);
    confirmPasswordController.removeListener(checkPassword);
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
    final textPalette = getTextPalette(context);

    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 19.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const VerticalGap(45),
              Text(
                LocaleKeys.authForgetPasswordResetPassword.tr(),
                style: AppTextStyles.getTextStyle(24).copyWith(
                  fontWeight: FontWeight.w700,
                  color: textPalette.primaryColor,
                ),
              ),
              const VerticalGap(65),
              Row(
                children: [
                  Text(
                    LocaleKeys.authResetPasswordEnterNewPassword.tr(),
                    style: AppTextStyles.getTextStyle(
                      20,
                    ).copyWith(color: textPalette.headingColor),
                  ),
                ],
              ),
              const VerticalGap(10),
              CustomPasswordTextField(
                validator: Validators.validatePassword,
                controller: passwordController,
                hintText: LocaleKeys.authResetPasswordPassword.tr(),
              ),
              const VerticalGap(16),
              CustomPasswordTextField(
                validator: (value) => Validators.confirmPasswordValidator(
                  value,
                  passwordController.text,
                ),
                controller: confirmPasswordController,
                hintText: LocaleKeys.authResetPasswordConfirmPassword.tr(),
              ),
              const VerticalGap(28),
              CustomButton(
                onPressed: onSendCodeTap,
                isDisabled: !isButtonEnabled,
                text: LocaleKeys.authResetPasswordConfirm.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
