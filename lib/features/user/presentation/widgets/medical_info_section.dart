import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/widgets/horizontal_gap.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/features/user/presentation/widgets/profile_info_row.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MedicalInfoSection extends StatelessWidget {
  const MedicalInfoSection({
    super.key,
    required this.bloodGroup,
    required this.ailments,
    required this.medicalId,
  });

  final String bloodGroup;
  final String ailments;
  final String medicalId;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 4.w,
              height: 20.h,
              decoration: BoxDecoration(
                color: context.colorScheme.secondary,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const HorizontalGap(12),
            Text(
              LocaleKeys.profileUserMedicalInfo.tr(),
              style: AppTextStyles.getTextStyle(18).copyWith(
                fontWeight: FontWeight.w800,
                color: context.textPalette.primaryColor,
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
        const VerticalGap(20),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: BorderRadius.circular(28.r),
            boxShadow: [
              BoxShadow(
                color: context.colorScheme.secondary.withValues(alpha: 0.05),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
            border: Border.all(
              color: context.colorScheme.secondary.withValues(alpha: 0.05),
            ),
          ),
          child: Column(
            children: [
              ProfileInfoRow(
                title: LocaleKeys.profileUserBloodGroup,
                value: bloodGroup,
                icon: Icons.bloodtype_rounded,
                iconColor: Colors.redAccent,
              ),
              const Divider(height: 32, thickness: 1, color: Color(0xFFF1F5F9)),
              ProfileInfoRow(
                title: LocaleKeys.profileUserMedicalId,
                value: medicalId,
                icon: Icons.badge_rounded,
                iconColor: Colors.blueAccent,
              ),
              const Divider(height: 32, thickness: 1, color: Color(0xFFF1F5F9)),
              ProfileInfoRow(
                title: LocaleKeys.profileUserAilments,
                value: ailments,
                icon: Icons.health_and_safety_rounded,
                iconColor: Colors.orangeAccent,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
