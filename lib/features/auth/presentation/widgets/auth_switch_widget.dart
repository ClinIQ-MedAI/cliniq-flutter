import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/widgets/horizontal_gap.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AuthSwitchWidget extends StatelessWidget {
  final String text;
  final String actionText;
  final VoidCallback onActionTap;

  const AuthSwitchWidget({
    super.key,
    required this.text,
    required this.actionText,
    required this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text.tr(),
          style: AppTextStyles.getTextStyle(
            13,
          ).copyWith(color: context.textPalette.primaryColor),
        ),
        const HorizontalGap(4),
        GestureDetector(
          onTap: onActionTap,
          child: Text(
            actionText.tr(),
            style: AppTextStyles.getTextStyle(13).copyWith(
              fontWeight: FontWeight.w700,
              color: context.theme.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
