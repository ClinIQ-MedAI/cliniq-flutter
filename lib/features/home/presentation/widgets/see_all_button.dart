import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SeeAllButton extends StatelessWidget {
  const SeeAllButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        LocaleKeys.homeSeeAll.tr(),
        style: AppTextStyles.getTextStyle(12).copyWith(
          color: context.colorScheme.secondary,
        ),
      ),
    );
  }
}
