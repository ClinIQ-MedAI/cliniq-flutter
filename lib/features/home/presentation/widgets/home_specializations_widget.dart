import 'package:cached_network_image/cached_network_image.dart';
import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/widgets/horizontal_gap.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/features/home/domain/entities/specialization_entity.dart';
import 'package:cliniq/features/home/presentation/widgets/see_all_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSpecializationsWidget extends StatelessWidget {
  const HomeSpecializationsWidget({super.key, required this.specializations});

  final List<SpecializationEntity> specializations;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.homeSpecialization.tr(),
                style: AppTextStyles.getTextStyle(20).copyWith(
                  fontWeight: FontWeight.w800,
                  color: context.textPalette.primaryColor,
                  letterSpacing: -0.5,
                ),
              ),
              SeeAllButton(onPressed: () {}),
            ],
          ),
        ),
        const VerticalGap(16),
        SizedBox(
          height: 120.h,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final specialization = specializations[index];
              return Column(
                children: [
                  Container(
                    width: 75.w,
                    height: 75.w,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: context.colorScheme.surface,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          color: context.colorScheme.shadow.withValues(
                            alpha: 0.08,
                          ),
                          blurRadius: 15,
                          offset: const Offset(0, 6),
                        ),
                      ],
                      border: Border.all(
                        color: context.colorScheme.primary.withValues(
                          alpha: 0.05,
                        ),
                      ),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: specialization.image,
                      fit: BoxFit.contain,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.category_rounded,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const VerticalGap(10),
                  Text(
                    specialization.name.tr(),
                    style: AppTextStyles.getTextStyle(14).copyWith(
                      fontWeight: FontWeight.w600,
                      color: context.textPalette.primaryColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => const HorizontalGap(20),
            itemCount: specializations.length,
          ),
        ),
      ],
    );
  }
}
