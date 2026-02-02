import 'package:cliniq/core/utils/app_constants.dart';
import 'package:cliniq/core/utils/app_images.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/features/auth/presentation/widgets/auth_page_layout.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/widgets/custom_button.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/features/auth/presentation/providers/resend_reset_code_provider.dart';
import 'package:cliniq/features/auth/presentation/providers/resend_timer_provider.dart';
import 'package:cliniq/features/auth/presentation/providers/verify_reset_code_provider.dart';
import 'package:cliniq/features/auth/presentation/widgets/custom_pinput_otp.dart';
import 'package:cliniq/features/auth/presentation/widgets/resend_code_button.dart';

class VerifyResetCodeBody extends ConsumerStatefulWidget {
  const VerifyResetCodeBody({super.key, required this.userEmail});

  final String userEmail;

  @override
  ConsumerState<VerifyResetCodeBody> createState() =>
      _VerifyResetCodeBodyState();
}

class _VerifyResetCodeBodyState extends ConsumerState<VerifyResetCodeBody> {
  final TextEditingController otpController = TextEditingController();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    otpController.addListener(checkOtpLength);

    Future.microtask(() {
      ref.read(resendTimerProvider.notifier).start(0);
    });
  }

  void checkOtpLength() {
    final isFilled =
        otpController.text.isNotEmpty &&
        otpController.text.length == AppConstants.pinCodeLength;
    if (isFilled != isButtonEnabled) {
      setState(() {
        isButtonEnabled = isFilled;
      });
    }
  }

  @override
  void dispose() {
    otpController.removeListener(checkOtpLength);
    otpController.dispose();
    super.dispose();
  }

  void onConfirmOtpTap() async {
    ref
        .read(verifyResetCodeProvider.notifier)
        .verifyResetCode(email: widget.userEmail, code: otpController.text);
  }

  void onResendOtpTap() {
    ref.read(resendResetCodeProvider(widget.userEmail));
  }

  @override
  Widget build(BuildContext context) {
    return AuthPageLayout(
      topSection: Image.asset(AppImages.verifyEmailLogo),
      bottomSection: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VerticalGap(24),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "${LocaleKeys.verifyOtpCodeSent.tr()} ",
                    style: AppTextStyles.getTextStyle(18).copyWith(
                      fontWeight: FontWeight.w700,
                      color: context.textPalette.primaryColor,
                    ),
                  ),
                  TextSpan(
                    text: widget.userEmail,
                    style: AppTextStyles.getTextStyle(
                      18,
                    ).copyWith(color: context.textPalette.secondaryColor),
                  ),
                ],
              ),
            ),
            const VerticalGap(40),
            CustomPinputOtp(otpController: otpController),
            const VerticalGap(40),
            ResendCodeButton(onResend: onResendOtpTap),
            const VerticalGap(25),
            CustomButton(
              onPressed: onConfirmOtpTap,
              isDisabled: !isButtonEnabled,
              text: LocaleKeys.verifyOtpVerifyOtp,
            ),

            const VerticalGap(24),
          ],
        ),
      ),
    );
  }
}
