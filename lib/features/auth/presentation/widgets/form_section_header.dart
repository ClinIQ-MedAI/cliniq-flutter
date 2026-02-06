import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/widgets/horizontal_gap.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormSectionHeader extends StatelessWidget {
  final String title;
  final String? description;
  final IconData icon;

  const FormSectionHeader({
    super.key,
    required this.title,
    this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: context.colorScheme.primaryContainer.withValues(
                    alpha: 0.1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  color: context.colorScheme.primaryContainer,
                  size: 22.sp,
                ),
              ),
              const HorizontalGap(12),
              Expanded(
                child: Text(
                  title.tr(),
                  style: AppTextStyles.getTextStyle(19).copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.textPalette.primaryColor,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
            ],
          ),
          if (description != null) ...[
            const VerticalGap(8),
            Padding(
              padding: EdgeInsets.only(left: 4.w),
              child: Text(
                description!.tr(),
                style: AppTextStyles.getTextStyle(15).copyWith(
                  color: context.textPalette.secondaryColor,
                  height: 1.4,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
