import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/constants/storage_keys.dart';
import 'package:cliniq/core/helpers/app_storage_helper.dart';
import 'package:cliniq/core/helpers/get_text_palette.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/widgets/custom_button.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/features/auth/presentation/providers/resend_verify_email_provider.dart';
import 'package:cliniq/features/auth/presentation/providers/verify_email_provider.dart';
import 'package:cliniq/features/auth/presentation/widgets/custom_pinput_otp.dart';
import 'package:cliniq/features/auth/presentation/widgets/resend_code_button.dart';

class VerifyEmailBody extends ConsumerStatefulWidget {
  const VerifyEmailBody({super.key});

  @override
  ConsumerState<VerifyEmailBody> createState() => _VerifyEmailBodyState();
}

class _VerifyEmailBodyState extends ConsumerState<VerifyEmailBody> {
  final TextEditingController otpController = TextEditingController();
  bool isButtonEnabled = false;
  late String userEmail;

  @override
  void initState() {
    super.initState();
    userEmail = AppStorageHelper.getString(StorageKeys.userEmail) ?? "";
    otpController.addListener(checkOtpLength);
  }

  void checkOtpLength() {
    final isFilled =
        otpController.text.isNotEmpty && otpController.text.length == 4;
    if (isFilled != isButtonEnabled) {
      setState(() {
        isButtonEnabled = isFilled;
      });
    }
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  void onConfirmOtpTap() {
    ref
        .read(verifyEmailProvider.notifier)
        .verifyEmail(email: userEmail, code: otpController.text);
  }

  void onResendOtpTap() {
    ref.read(resendVerifyEmailProvider(userEmail));
  }

  @override
  Widget build(BuildContext context) {
    final textPalette = getTextPalette(context);

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const VerticalGap(16),
          Text(
            LocaleKeys.authCreateAccountVerifyEmailEnterCode.tr(),
            style: AppTextStyles.getTextStyle(14).copyWith(
              fontWeight: FontWeight.w700,
              color: textPalette.primaryColor,
            ),
          ),
          const VerticalGap(10),
          Text(
            "${LocaleKeys.authVerifyOtpCodeSent.tr()} $userEmail",
            textAlign: TextAlign.center,
            style: AppTextStyles.getTextStyle(
              12,
            ).copyWith(color: textPalette.tertiaryColor),
          ),
          const VerticalGap(40),
          CustomPinputOtp(otpController: otpController),
          const VerticalGap(28),
          CustomButton(
            onPressed: onConfirmOtpTap,
            isDisabled: !isButtonEnabled,
            text: LocaleKeys.authVerifyOtpConfirm.tr(),
          ),
          const VerticalGap(16),
          ResendCodeButton(onResend: onResendOtpTap),
          const VerticalGap(24),
        ],
      ),
    );
  }
}
