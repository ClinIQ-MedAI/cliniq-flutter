import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/widgets/horizontal_gap.dart';
import 'package:cliniq/features/auth/presentation/providers/resend_timer_provider.dart';

class ResendCodeButton extends ConsumerWidget {
  final VoidCallback onResend;
  final int seconds;

  const ResendCodeButton({
    super.key,
    required this.onResend,
    this.seconds = 60,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final remaining = ref.watch(resendTimerProvider);
    final isEnabled = remaining == 0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LocaleKeys.verifyEmailDidntReceiveCode.tr(),
          style: AppTextStyles.getTextStyle(
            13,
          ).copyWith(color: context.textPalette.primaryColor),
        ),
        const HorizontalGap(4),
        InkWell(
          onTap: isEnabled
              ? () {
                  onResend();
                  ref.read(resendTimerProvider.notifier).start(seconds);
                }
              : null,
          child: Text(
            LocaleKeys.verifyOtpResendCode.tr(),
            style: AppTextStyles.getTextStyle(14).copyWith(
              color: isEnabled
                  ? context.theme.primaryColor
                  : context.textPalette.secondaryColor,
            ),
          ),
        ),

        if (!isEnabled) ...[
          const HorizontalGap(8),
          Text(
            _formatTime(remaining),
            style: AppTextStyles.getTextStyle(
              13,
            ).copyWith(color: context.textPalette.secondaryColor),
          ),
        ],
      ],
    );
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:'
        '${remainingSeconds.toString().padLeft(2, '0')}';
  }
}
