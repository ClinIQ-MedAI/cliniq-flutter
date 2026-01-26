import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/text_palette.dart';

class BackHelpAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onBackPressed;
  final VoidCallback? onHelpPressed;
  final String helpText;

  const BackHelpAppBar({
    super.key,
    this.onBackPressed,
    this.onHelpPressed,
    this.helpText = LocaleKeys.authForgetPasswordHelp,
  });

  @override
  Widget build(BuildContext context) {
    final textPalette = Theme.of(context).extension<TextPalette>()!;

    return AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: onBackPressed ?? () => Navigator.pop(context),
        icon: Icon(Icons.arrow_back, color: textPalette.headingColor),
      ),
      actionsPadding: EdgeInsetsDirectional.only(end: 16.w),
      actions: [
        GestureDetector(
          onTap: onHelpPressed,
          child: Row(
            children: [
              Text(
                helpText.tr(),
                style: AppTextStyles.getTextStyle(12).copyWith(
                  fontWeight: FontWeight.bold,
                  color: textPalette.tertiaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}
