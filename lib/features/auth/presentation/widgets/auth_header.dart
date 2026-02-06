import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.onBack,
    this.action,
  });

  final IconData icon;
  final String title;
  final String description;
  final VoidCallback? onBack;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(24.w, 40.h, 24.w, 32.h),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32.r),
          bottomRight: Radius.circular(32.r),
        ),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.primary.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (onBack != null) ...[
                    IconButton(
                      onPressed: onBack,
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: context.colorScheme.primary,
                        size: 22.sp,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: context.colorScheme.primary.withValues(
                          alpha: 0.05,
                        ),
                        padding: EdgeInsets.all(12.w),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                  ],
                  Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: context.colorScheme.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Icon(
                      icon,
                      color: context.colorScheme.primary,
                      size: 28.sp,
                    ),
                  ).animate().scale(
                    duration: 400.ms,
                    curve: Curves.easeOutBack,
                  ),
                ],
              ),
              if (action != null) action!,
            ],
          ),
          const VerticalGap(24),
          Text(
            title.tr(),
            style: AppTextStyles.getTextStyle(28).copyWith(
              fontWeight: FontWeight.w900,
              color: context.textPalette.primaryColor,
              letterSpacing: -1.0,
            ),
          ).animate().fadeIn(delay: 300.ms).slideX(begin: -0.1),
          const VerticalGap(8),
          Text(
            description.tr(),
            style: AppTextStyles.getTextStyle(15).copyWith(
              color: context.textPalette.secondaryColor,
              height: 1.5,
              fontWeight: FontWeight.w500,
            ),
          ).animate().fadeIn(delay: 400.ms).slideX(begin: -0.1),
        ],
      ),
    );
  }
}
