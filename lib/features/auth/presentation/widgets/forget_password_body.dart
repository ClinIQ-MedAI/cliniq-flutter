import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/constants/storage_keys.dart';
import 'package:cliniq/core/helpers/app_storage_helper.dart';
import 'package:cliniq/core/helpers/get_text_palette.dart';
import 'package:cliniq/core/helpers/show_custom_snack_bar.dart';
import 'package:cliniq/core/utils/app_routes.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/success.dart';
import 'package:cliniq/core/utils/validators.dart';
import 'package:cliniq/core/widgets/custom_button.dart';
import 'package:cliniq/core/widgets/custom_under_line_text_field.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/features/auth/presentation/providers/forget_password_provider.dart';

class ForgetPasswordBody extends ConsumerStatefulWidget {
  const ForgetPasswordBody({super.key});

  @override
  ConsumerState<ForgetPasswordBody> createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends ConsumerState<ForgetPasswordBody> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(checkEmail);
  }

  void checkEmail() {
    final isFilled = emailController.text.isNotEmpty;
    if (isFilled != isButtonEnabled) {
      setState(() {
        isButtonEnabled = isFilled;
      });
    }
  }

  @override
  void dispose() {
    emailController.removeListener(checkEmail);
    emailController.dispose();
    super.dispose();
  }

  void onSendCodeTap() async {
    if (formKey.currentState!.validate()) {
      await AppStorageHelper.setString(
        StorageKeys.userEmail,
        emailController.text,
      );

      ref
          .read(forgetPasswordProvider.notifier)
          .forgetPassword(email: emailController.text);
    }
  }

  void goToVerifyCodeScreen() {
    Navigator.pushNamed(context, Routes.verifyResetCodeScreen);
  }

  void listenOnForgetPasswordProvider() {
    ref.listen(forgetPasswordProvider, (previous, next) {
      if (next is AsyncError) {
        showCustomSnackBar(context, next.error.toString().tr());
      } else if (next is AsyncData && next.value is Success) {
        goToVerifyCodeScreen();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textPalette = getTextPalette(context);
    listenOnForgetPasswordProvider();

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
              const VerticalGap(32),
              Text(
                LocaleKeys.authForgetPasswordEnterEmail.tr(),
                textAlign: TextAlign.center,
                style: AppTextStyles.getTextStyle(16).copyWith(
                  fontWeight: FontWeight.bold,
                  color: textPalette.headingColor,
                ),
              ),
              const VerticalGap(10),
              Text(
                LocaleKeys.authForgetPasswordCodeWillBeSent.tr(),
                textAlign: TextAlign.center,
                style: AppTextStyles.getTextStyle(12).copyWith(
                  fontWeight: FontWeight.bold,
                  color: textPalette.tertiaryColor,
                ),
              ),
              const VerticalGap(89),
              CustomUnderLineTextField(
                controller: emailController,
                validator: Validators.validateEmail,
              ),
              const VerticalGap(28),
              CustomButton(
                onPressed: onSendCodeTap,
                isDisabled: !isButtonEnabled,
                text: LocaleKeys.authForgetPasswordSendCode.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
