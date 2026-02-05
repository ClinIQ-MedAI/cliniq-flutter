import 'package:cached_network_image/cached_network_image.dart';
import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/widgets/horizontal_gap.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/features/home/domain/entities/specialization_entity.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.homeSpecialization.tr(),
                style: AppTextStyles.getTextStyle(16).copyWith(
                  fontWeight: FontWeight.w700,
                  color: context.textPalette.primaryColor,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  LocaleKeys.homeSeeAll.tr(),
                  style: AppTextStyles.getTextStyle(12).copyWith(
                    fontWeight: FontWeight.w400,
                    color: context.colorScheme.secondary,
                  ),
                ),
              ),
            ],
          ),
        ),
        const VerticalGap(16),
        SizedBox(
          height: 100.h,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final specialization = specializations[index];
              return Column(
                children: [
                  Container(
                    width: 60.w,
                    height: 60.w,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: context.colorScheme.surface,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: context.colorScheme.shadow.withValues(
                            alpha: 0.05,
                          ),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: CachedNetworkImage(
                      imageUrl: specialization.image,
                      fit: BoxFit.contain,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  const VerticalGap(8),
                  Text(
                    specialization.name.tr(),
                    style: AppTextStyles.getTextStyle(12).copyWith(
                      fontWeight: FontWeight.w500,
                      color: context.textPalette.primaryColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => const HorizontalGap(16),
            itemCount: specializations.length,
          ),
        ),
      ],
    );
  }
}
