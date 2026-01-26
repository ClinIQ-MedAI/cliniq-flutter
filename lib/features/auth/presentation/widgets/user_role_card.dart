import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';

class UserRoleCard extends StatelessWidget {
  const UserRoleCard({
    super.key,
    required this.role,
    required this.description,
    required this.onTap,
  });

  final String role;
  final String description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 215.h,
        width: 227.w,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          children: [
            const VerticalGap(48),
            Text(
              role.tr(),
              textAlign: TextAlign.center,
              style: AppTextStyles.getTextStyle(32).copyWith(
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const VerticalGap(24),
            RPadding(
              padding: const EdgeInsets.symmetric(horizontal: 42),
              child: Text(
                description.tr(),
                textAlign: TextAlign.center,
                style: AppTextStyles.getTextStyle(
                  16,
                ).copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
            ),
            const VerticalGap(39),
          ],
        ),
      ),
    );
  }
}
