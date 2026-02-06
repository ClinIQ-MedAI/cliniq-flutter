import 'package:cliniq/core/utils/app_constants.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showCustomSnackBar(
  BuildContext context,
  String message, {
  Color? backgroundColor,
  bool showCloseIcon = true,
  int durationDay = 0,
}) {
  final snackBar = SnackBar(
    content: Text(
      message.tr(),
      style: AppTextStyles.getTextStyle(
        15,
      ).copyWith(color: Colors.white, fontWeight: FontWeight.w500),
    ),
    behavior: SnackBarBehavior.floating,
    showCloseIcon: showCloseIcon,
    closeIconColor: Colors.white,
    elevation: 8,
    margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
    duration: Duration(
      seconds: AppConstants.snackBarDuration,
      days: durationDay,
    ),
    backgroundColor: backgroundColor ?? context.colorScheme.primary,
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
