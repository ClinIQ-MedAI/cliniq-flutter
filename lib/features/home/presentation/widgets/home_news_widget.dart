import 'package:cached_network_image/cached_network_image.dart';
import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/features/home/domain/entities/news_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeNewsWidget extends StatelessWidget {
  const HomeNewsWidget({super.key, required this.news});

  final List<NewsEntity> news;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.homeNewNews.tr(),
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
          height: 200.h,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            scrollDirection: Axis.horizontal,
            itemCount: news.length,
            separatorBuilder: (context, index) => SizedBox(width: 16.w),
            itemBuilder: (context, index) {
              final item = news[index];
              return Container(
                width: 240.w,
                decoration: BoxDecoration(
                  color: context.colorScheme.surface,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: context.colorScheme.shadow.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: item.image,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.getTextStyle(14).copyWith(
                                fontWeight: FontWeight.w600,
                                color: context.textPalette.primaryColor,
                              ),
                            ),
                            const VerticalGap(4),
                            Expanded(
                              child: Text(
                                item.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.getTextStyle(12).copyWith(
                                  color: context.textPalette.secondaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
