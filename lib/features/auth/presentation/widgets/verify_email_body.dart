import 'package:cliniq/core/utils/app_constants.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/widgets/custom_card_section.dart';
import 'package:cliniq/features/auth/presentation/widgets/auth_header.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/widgets/custom_button.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/features/auth/presentation/providers/resend_verify_email_provider.dart';
import 'package:cliniq/features/auth/presentation/providers/verify_email_provider.dart';
import 'package:cliniq/features/auth/presentation/widgets/custom_pinput_otp.dart';
import 'package:cliniq/features/auth/presentation/widgets/resend_code_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyEmailBody extends ConsumerStatefulWidget {
  const VerifyEmailBody({super.key, required this.email});

  final String email;

  @override
  ConsumerState<VerifyEmailBody> createState() => _VerifyEmailBodyState();
}

class _VerifyEmailBodyState extends ConsumerState<VerifyEmailBody> {
  final TextEditingController otpController = TextEditingController();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();

    otpController.addListener(checkOtpLength);
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
    otpController.dispose();
    super.dispose();
  }

  void onConfirmOtpTap() {
    ref
        .read(verifyEmailProvider.notifier)
        .verifyEmail(email: widget.email, code: otpController.text);
  }

  void onResendOtpTap() {
    ref.read(resendVerifyEmailProvider(widget.email));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            AuthHeader(
              icon: Icons.mark_email_read_rounded,
              title: LocaleKeys.verifyEmailTitle,
              description: LocaleKeys.verifyEmailDescription,
              onBack: () => Navigator.pop(context),
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
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "${LocaleKeys.verifyEmailCodeSent.tr()} ",
                                style: AppTextStyles.getTextStyle(16).copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: context.textPalette.primaryColor,
                                ),
                              ),
                              TextSpan(
                                text: widget.email,
                                style: AppTextStyles.getTextStyle(16).copyWith(
                                  color: context.colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ).animate().fadeIn(delay: 500.ms),
                        const VerticalGap(24),
                        CustomPinputOtp(otpController: otpController)
                            .animate()
                            .fadeIn(delay: 600.ms)
                            .scale(begin: const Offset(0.9, 0.9)),
                        const VerticalGap(24),
                        ResendCodeButton(
                          onResend: onResendOtpTap,
                        ).animate().fadeIn(delay: 700.ms),
                      ],
                    ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.05),
                    const VerticalGap(32),
                    CustomButton(
                      onPressed: onConfirmOtpTap,
                      isDisabled: !isButtonEnabled,
                      text: LocaleKeys.verifyEmailVerifyOtp,
                    ).animate().fadeIn(delay: 800.ms),
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
