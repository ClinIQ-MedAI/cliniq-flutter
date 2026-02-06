import 'package:cliniq/core/utils/app_constants.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/widgets/custom_card_section.dart';
import 'package:cliniq/features/auth/presentation/widgets/auth_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            AuthHeader(
              icon: Icons.mark_email_read_rounded,
              title: LocaleKeys.verifyOtpTitle,
              description: LocaleKeys.verifyOtpDescription,
              onBack: () => Navigator.pop(context),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                child: Column(
                  children: [
                    CustomCardSection(
                      children: [
                        Text(
                          widget.userEmail,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.getTextStyle(16).copyWith(
                            fontWeight: FontWeight.w700,
                            color: context.colorScheme.primary,
                          ),
                        ),
                        const VerticalGap(24),
                        CustomPinputOtp(otpController: otpController),
                        const VerticalGap(24),
                        ResendCodeButton(onResend: onResendOtpTap),
                      ],
                    ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.1),
                    const VerticalGap(32),
                    CustomButton(
                      onPressed: onConfirmOtpTap,
                      isDisabled: !isButtonEnabled,
                      text: LocaleKeys.verifyOtpVerifyOtp,
                    ).animate().fadeIn(delay: 600.ms),
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
