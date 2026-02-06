import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileStatWidget extends StatelessWidget {
  const ProfileStatWidget({
    super.key,
    required this.label,
    required this.value,
    required this.unit,
    required this.icon,
    required this.color,
  });

  final String label;
  final String value;
  final String unit;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.w,
      padding: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.1),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
        border: Border.all(color: color.withValues(alpha: 0.1)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 20.sp),
          ),
          const VerticalGap(12),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: value,
                  style: AppTextStyles.getTextStyle(18).copyWith(
                    fontWeight: FontWeight.w800,
                    color: context.textPalette.primaryColor,
                  ),
                ),
                TextSpan(
                  text: ' $unit',
                  style: AppTextStyles.getTextStyle(12).copyWith(
                    fontWeight: FontWeight.w600,
                    color: context.textPalette.secondaryColor,
                  ),
                ),
              ],
            ),
          ),
          const VerticalGap(4),
          Text(
            label,
            style: AppTextStyles.getTextStyle(12).copyWith(
              fontWeight: FontWeight.w500,
              color: context.textPalette.secondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
