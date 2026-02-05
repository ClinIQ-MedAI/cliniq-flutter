import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/utils/app_svgs.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/widgets/custom_text_form_field.dart';
import 'package:cliniq/core/widgets/horizontal_gap.dart';
import 'package:cliniq/core/widgets/user_profile_image.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/features/home/presentation/providers/get_home_data_provider.dart';
import 'package:cliniq/features/home/presentation/widgets/home_appointments_widget.dart';
import 'package:cliniq/features/home/presentation/widgets/home_doctors_widget.dart';
import 'package:cliniq/features/home/presentation/widgets/home_news_widget.dart';
import 'package:cliniq/features/home/presentation/widgets/home_specializations_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class UserHomeView extends ConsumerWidget {
  const UserHomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.h),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                context.colorScheme.primaryContainer,
                Color.lerp(context.colorScheme.primary, Colors.black, 0.15)!,
                context.colorScheme.primary,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(36.r),
              bottomRight: Radius.circular(36.r),
            ),
            boxShadow: [
              BoxShadow(
                color: context.colorScheme.primary.withValues(alpha: 0.15),
                blurRadius: 30,
                offset: const Offset(0, 15),
                spreadRadius: -5,
              ),
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const UserProfileImage(circleAvatarRadius: 28),
                      const HorizontalGap(16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LocaleKeys.homeWelcomeBack.tr(),
                              style: AppTextStyles.getTextStyle(16).copyWith(
                                color: context.colorScheme.onPrimary.withValues(
                                  alpha: 0.8,
                                ),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              'Dr. Ahmed',
                              style: AppTextStyles.getTextStyle(24).copyWith(
                                fontWeight: FontWeight.w800,
                                color: context.colorScheme.onPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: IconButton(
                          icon: SvgPicture.asset(
                            AppSvgs.notificationIcon,
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  const VerticalGap(28),
                  CustomTextFormField(
                    backgroundColor: Colors.white.withValues(alpha: 0.15),
                    borderRadius: 16,
                    borderColor: Colors.transparent,
                    focusedBorderColor: Colors.white.withValues(alpha: 0.3),
                    prefixIcon: const Icon(
                      Icons.search_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                    hintText: LocaleKeys.homeSearchHint.tr(),
                    hintStyle: AppTextStyles.getTextStyle(
                      16,
                    ).copyWith(color: Colors.white.withValues(alpha: 0.6)),
                    textStyle: AppTextStyles.getTextStyle(
                      16,
                    ).copyWith(color: Colors.white),
                    contentHorizontalPadding: 20,
                    contentVerticalPadding: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: ref
          .watch(getHomeDataProvider)
          .when(
            data: (result) => result.fold(
              (failure) => Center(child: Text(failure.message)),
              (homeData) => ListView(
                padding: const EdgeInsets.only(top: 24, bottom: 40),
                children: [
                  HomeAppointmentsWidget(
                    appointments: homeData.examinationAppointments,
                  ),
                  const VerticalGap(32),
                  HomeSpecializationsWidget(
                    specializations: homeData.specializations,
                  ),
                  const VerticalGap(32),
                  HomeDoctorsWidget(doctors: homeData.suggestedDoctors),
                  const VerticalGap(32),
                  HomeNewsWidget(news: homeData.news),
                ],
              ),
            ),
            error: (error, stack) => Center(child: Text(error.toString())),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
    );
  }
}
