import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompleteProfileHeader extends StatelessWidget {
  const CompleteProfileHeader({super.key, required this.onSkip});

  final VoidCallback onSkip;

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
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: context.colorScheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Icon(
                  Icons.medical_information_rounded,
                  color: context.colorScheme.primary,
                  size: 28.sp,
                ),
              ).animate().scale(duration: 400.ms, curve: Curves.easeOutBack),
              TextButton(
                onPressed: onSkip,
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  backgroundColor: context.colorScheme.primary.withValues(
                    alpha: 0.05,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text(
                  LocaleKeys.completeProfileSkip.tr(),
                  style: AppTextStyles.getTextStyle(14).copyWith(
                    color: context.colorScheme.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ).animate().fadeIn(delay: 200.ms),
            ],
          ),
          const VerticalGap(24),
          Text(
            LocaleKeys.completeProfileSetupTitle.tr(),
            style: AppTextStyles.getTextStyle(28).copyWith(
              fontWeight: FontWeight.w900,
              color: context.textPalette.primaryColor,
              letterSpacing: -1.0,
            ),
          ).animate().fadeIn(delay: 300.ms).slideX(begin: -0.1),
          const VerticalGap(8),
          Text(
            LocaleKeys.completeProfileSetupDescription.tr(),
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
