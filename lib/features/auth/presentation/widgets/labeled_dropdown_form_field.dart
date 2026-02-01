import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/core/widgets/custom_dropdown_form_field.dart';

class LabeledDropdownFormField extends StatelessWidget {
  final String title;
  final String hintText;
  final String? helperText;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final String? selectedValue;
  final TextStyle? valueStyle;
  final String? Function(String?)? validator;

  const LabeledDropdownFormField({
    super.key,
    required this.title,
    required this.hintText,
    required this.items,
    required this.onChanged,
    this.helperText,
    this.contentPadding,
    this.selectedValue,
    this.valueStyle,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.tr(),
          style: AppTextStyles.getTextStyle(16).copyWith(
            fontWeight: FontWeight.w600,
            color: context.textPalette.primaryColor,
          ),
        ),
        const VerticalGap(16),
        CustomDropdownFormField(
          items: items,
          hintText: hintText,
          helperText: helperText,
          onChanged: onChanged,
          contentPadding: contentPadding,
          selectedValue: selectedValue,
          valueStyle: valueStyle,
          validator: validator,
        ),
      ],
    );
  }
}
