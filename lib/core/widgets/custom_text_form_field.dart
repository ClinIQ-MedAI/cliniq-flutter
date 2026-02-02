import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final VoidCallback? onSuffixTap;
  final VoidCallback? onTap;
  final AutovalidateMode? autovalidateMode;
  final int? maxLines;
  final double contentHorizontalPadding;
  final double contentVerticalPadding;
  final FocusNode? focusNode;
  final double? labelTextSize;
  final ValueChanged<String>? onChanged;
  final double borderRadius;
  final double? borderWidth;
  final double focusedBorderWidth;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? helperStyle;


  const CustomTextFormField({
    super.key,
    this.onTap,
    this.readOnly,
    this.hintText,
    this.labelText,
    this.helperText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.controller,
    this.onSuffixTap,
    this.autovalidateMode,
    this.maxLines = 1,
    this.contentHorizontalPadding = 16,
    this.contentVerticalPadding = 12,
    this.focusNode,
    this.labelTextSize = 16,
    this.onChanged,
    this.borderRadius = 9,
    this.borderWidth,
    this.focusedBorderWidth = 2,
    this.borderColor,
    this.focusedBorderColor,
    this.backgroundColor,
    this.textStyle,
    this.hintStyle,
    this.labelStyle,
    this.helperStyle,
  });

  InputBorder _buildBorder(Color color, double width) {
    if (width == 0) return InputBorder.none;
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius.r),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  @override
  Widget build(BuildContext context) {
    final inputTheme = context.inputTheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius.r),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        readOnly: readOnly ?? false,
        obscureText: obscureText,
        onChanged: onChanged,
        validator: validator,
        keyboardType: keyboardType,
        maxLines: maxLines,
        onTap: onTap,
        autovalidateMode: autovalidateMode,
        style:
            textStyle ??
            AppTextStyles.getTextStyle(
              14,
            ).copyWith(color: inputTheme.textColor),
        decoration: InputDecoration(
          filled: true,
          fillColor: backgroundColor ?? inputTheme.backgroundColor,
          labelText: labelText?.tr(),
          hintText: hintText?.tr(),
          helperText: helperText?.tr(),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon != null
              ? GestureDetector(onTap: onSuffixTap, child: suffixIcon)
              : null,
          contentPadding: EdgeInsets.symmetric(
            vertical: contentVerticalPadding.r,
            horizontal: contentHorizontalPadding.r,
          ),
          hintStyle: hintStyle,
          labelStyle: labelStyle,
          helperStyle: helperStyle,
          border: _buildBorder(
            borderColor ?? inputTheme.borderColor,
            borderWidth ?? 0,
          ),
          enabledBorder: _buildBorder(
            borderColor ?? inputTheme.borderColor,
            borderWidth ?? 0,
          ),
          focusedBorder: _buildBorder(
            focusedBorderColor ?? inputTheme.focusedBorderColor,
            focusedBorderWidth,
          ),
          errorBorder: _buildBorder(
            inputTheme.errorBorderColor,
            borderWidth ?? 1,
          ),
          disabledBorder: _buildBorder(
            borderColor ?? inputTheme.borderColor,
            borderWidth ?? 0,
          ),
        ),
      ),
    );
  }
}
