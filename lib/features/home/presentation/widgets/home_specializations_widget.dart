import 'package:cached_network_image/cached_network_image.dart';
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
    return SizedBox(
      height: 130.h,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        scrollDirection: Axis.horizontal,
        itemCount: specializations.length,
        separatorBuilder: (context, index) => const HorizontalGap(20),
        itemBuilder: (context, index) {
          final specialization = specializations[index];
          return Column(
            children: [
              Container(
                width: 80.w,
                height: 80.w,
                decoration: BoxDecoration(
                  color: context.colorScheme.surface,
                  borderRadius: BorderRadius.circular(24.r),
                  boxShadow: [
                    BoxShadow(
                      color: context.colorScheme.primary.withValues(
                        alpha: 0.08,
                      ),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                  border: Border.all(
                    color: context.colorScheme.primary.withValues(alpha: 0.1),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24.r),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: -10,
                        right: -10,
                        child: Icon(
                          Icons.medical_services_rounded,
                          size: 40,
                          color: context.colorScheme.primary.withValues(
                            alpha: 0.05,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18),
                        child: CachedNetworkImage(
                          imageUrl: specialization.image,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.category_rounded,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const VerticalGap(12),
              Text(
                specialization.name.tr(),
                style: AppTextStyles.getTextStyle(13).copyWith(
                  fontWeight: FontWeight.w700,
                  color: context.textPalette.primaryColor,
                  letterSpacing: -0.2,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          );
        },
      ),
    );
  }
}
