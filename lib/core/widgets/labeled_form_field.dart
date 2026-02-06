import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/widgets/custom_password_text_field.dart';
import 'package:cliniq/core/widgets/custom_text_form_field.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';

class LabeledFormField extends StatelessWidget {
  const LabeledFormField({
    super.key,
    this.controller,
    required this.label,
    required this.hint,
    this.isPassword = false,
    this.validator,
    this.keyboardType,
    this.isLight = false,
    this.maxLines = 1,
    this.prefixIcon,
  });

  final TextEditingController? controller;
  final String label;
  final String hint;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool isLight;
  final int maxLines;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.tr(),
          style: AppTextStyles.getTextStyle(17).copyWith(
            fontWeight: FontWeight.w600,
            color: context.textPalette.primaryColor,
          ),
        ),
        const VerticalGap(16),
        if (isPassword)
          CustomPasswordTextField(
            controller: controller,
            hintText: hint,
            validator: validator,
            keyboardType: keyboardType,
            isLight: isLight,
          )
        else
          CustomTextFormField(
            controller: controller,
            validator: validator,
            hintText: hint,
            keyboardType: keyboardType,
            isLight: isLight,
            maxLines: maxLines,
            prefixIcon: prefixIcon,
          ),
      ],
    );
  }
}
