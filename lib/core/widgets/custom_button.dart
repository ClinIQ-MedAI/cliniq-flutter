import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    this.text,
    this.backgroundColor,
    this.textColor,
    this.height = 48,
    this.width,
    this.borderRadius = 9,
    this.borderWidth = 0,
    this.textFontSize = 16,
    this.isOutline = false,
    this.isDisabled = false,
    this.borderColor,
    this.child,
  });

  final String? text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double height;
  final double? width;
  final double borderRadius;
  final double borderWidth;
  final double textFontSize;
  final bool isOutline;
  final bool isDisabled;
  final Color? borderColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isDisabled ? null : onPressed,
      child: Container(
        height: height.h,
        width: width?.w ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius.r),
          color: isDisabled
              ? context.theme.disabledColor
              : backgroundColor ?? context.theme.primaryColor,
          border: Border.all(
            color: isOutline
                ? borderColor ?? context.theme.primaryColor
                : Colors.transparent,
            width: borderWidth.r,
          ),
        ),
        child:
            child ??
            Center(
              child: Text(
                text?.tr() ?? '',
                style: AppTextStyles.getTextStyle(textFontSize).copyWith(
                  color: isDisabled
                      ? context.textPalette.primaryColor
                      : textColor ?? context.colorScheme.onPrimary,
                ),
              ),
            ),
      ),
    );
  }
}
