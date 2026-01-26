import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/constants/storage_keys.dart';
import 'package:cliniq/core/helpers/app_storage_helper.dart';
import 'package:cliniq/core/helpers/get_text_palette.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/widgets/custom_button.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/features/auth/presentation/providers/resend_reset_code_provider.dart';
import 'package:cliniq/features/auth/presentation/providers/resend_timer_provider.dart';
import 'package:cliniq/features/auth/presentation/providers/verify_reset_code_provider.dart';
import 'package:cliniq/features/auth/presentation/widgets/custom_pinput_otp.dart';
import 'package:cliniq/features/auth/presentation/widgets/resend_code_button.dart';

class VerifyResetCodeBody extends ConsumerStatefulWidget {
  const VerifyResetCodeBody({super.key});

  @override
  ConsumerState<VerifyResetCodeBody> createState() =>
      _VerifyResetCodeBodyState();
}

class _VerifyResetCodeBodyState extends ConsumerState<VerifyResetCodeBody> {
  final TextEditingController otpController = TextEditingController();
  bool isButtonEnabled = false;
  late String userEmail;

  @override
  void initState() {
    super.initState();
    userEmail = AppStorageHelper.getString(StorageKeys.userEmail) ?? "";
    otpController.addListener(checkOtpLength);

    Future.microtask(() {
      ref.read(resendTimerProvider.notifier).start(0);
    });
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
    otpController.removeListener(checkOtpLength);
    otpController.dispose();
    super.dispose();
  }

  void onConfirmOtpTap() async {
    ref
        .read(verifyResetCodeProvider.notifier)
        .verifyResetCode(email: userEmail, code: otpController.text);
  }

  void onResendOtpTap() {
    ref.read(resendResetCodeProvider(userEmail));
  }

  @override
  Widget build(BuildContext context) {
    final textPalette = getTextPalette(context);

    return Padding(
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
              LocaleKeys.authVerifyOtpEnterOtp.tr(),
              textAlign: TextAlign.center,
              style: AppTextStyles.getTextStyle(16).copyWith(
                fontWeight: FontWeight.bold,
                color: textPalette.headingColor,
              ),
            ),
            const VerticalGap(10),
            Text(
              "${LocaleKeys.authVerifyOtpCodeSent.tr()} $userEmail",
              textAlign: TextAlign.center,
              style: AppTextStyles.getTextStyle(12).copyWith(
                fontWeight: FontWeight.bold,
                color: textPalette.tertiaryColor,
              ),
            ),
            const VerticalGap(89),
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
      ),
    );
  }
}
