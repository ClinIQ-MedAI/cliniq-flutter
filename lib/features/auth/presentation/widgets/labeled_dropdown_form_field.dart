import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:cliniq/core/helpers/get_text_palette.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/core/widgets/custom_dropdown_form_field.dart';

class LabeledDropdownFormField extends StatelessWidget {
  final String title;
  final bool isRequired;
  final String hintText;
  final String? helperText;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final String? selectedValue;
  final TextStyle? valueStyle;

  const LabeledDropdownFormField({
    super.key,
    required this.title,
    required this.hintText,
    required this.items,
    required this.onChanged,
    this.isRequired = true,
    this.helperText,
    this.contentPadding,
    this.selectedValue,
    this.valueStyle,
  });

  @override
  Widget build(BuildContext context) {
    final textPalette = getTextPalette(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title.tr(),
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
        CustomDropdownFormField(
          items: items,
          hintText: hintText,
          helperText: helperText,
          onChanged: onChanged,
          contentPadding: contentPadding,
          selectedValue: selectedValue,
          valueStyle: valueStyle,
        ),
      ],
    );
  }
}
