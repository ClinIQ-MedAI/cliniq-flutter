import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:cliniq/core/helpers/get_text_palette.dart';
import 'package:cliniq/core/utils/app_text_field_theme.dart';
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
    this.isRequired = true,
    this.isPassword = false,
    this.validator,
    this.keyboardType,
  });

  final TextEditingController? controller;
  final String label;
  final String hint;
  final bool isRequired;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    final textPalette = getTextPalette(context);
    final AppTextFieldTheme appTextFieldTheme = Theme.of(
      context,
    ).extension<AppTextFieldTheme>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label.tr(),
              style: AppTextStyles.getTextStyle(16).copyWith(
                fontWeight: FontWeight.w600,
                color: textPalette.primaryColor,
              ),
            ),
            if (isRequired)
              Text(
                "*",
                style: AppTextStyles.getTextStyle(16).copyWith(
                  fontWeight: FontWeight.w600,
                  color: textPalette.alertColor,
                ),
              ),
          ],
        ),
        const VerticalGap(16),
        if (isPassword)
          CustomPasswordTextField(
            controller: controller,
            validator: validator,
            borderRadius: 8,
            backgroundColor: appTextFieldTheme.highLightBackgroundColor,
            keyboardType: keyboardType,
            hintStyle: AppTextStyles.getTextStyle(
              16,
            ).copyWith(color: textPalette.helperColor),
            textStyle: AppTextStyles.getTextStyle(
              16,
            ).copyWith(color: textPalette.paragraphColor),
          )
        else
          CustomTextFormField(
            controller: controller,
            validator: validator,
            hintText: hint.tr(),
            keyboardType: keyboardType,
            borderRadius: 8,
            backgroundColor: appTextFieldTheme.highLightBackgroundColor,
            hintStyle: AppTextStyles.getTextStyle(
              16,
            ).copyWith(color: textPalette.helperColor),
            textStyle: AppTextStyles.getTextStyle(
              16,
            ).copyWith(color: textPalette.paragraphColor),
          ),
      ],
    );
  }
}
