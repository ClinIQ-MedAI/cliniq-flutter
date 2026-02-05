import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/utils/app_svgs.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/widgets/custom_text_form_field.dart';
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
        preferredSize: Size.fromHeight(180.h),
        child: AppBar(
          backgroundColor: context.theme.primaryColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListTile(
                    leading: const UserProfileImage(),
                    title: Text(
                      LocaleKeys.homeWelcomeBack.tr(),
                      style: AppTextStyles.getTextStyle(20).copyWith(
                        fontWeight: FontWeight.w700,
                        color: context.colorScheme.onPrimary,
                      ),
                    ),
                    subtitle: Text(
                      'Dr. Ahmed',
                      style: AppTextStyles.getTextStyle(
                        14,
                      ).copyWith(color: context.colorScheme.onSecondary),
                    ),
                    trailing: IconButton(
                      icon: SvgPicture.asset(AppSvgs.notificationIcon),
                      onPressed: () {},
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                  const VerticalGap(24),
                  CustomTextFormField(
                    prefixIcon: Icon(
                      Icons.search,
                      color: context.inputTheme.iconColor,
                    ),
                    hintText: LocaleKeys.homeSearchHint.tr(),
                    hintStyle: AppTextStyles.getTextStyle(
                      14,
                    ).copyWith(color: context.inputTheme.hintColor),
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
                padding: const EdgeInsets.only(top: 24, bottom: 24),
                children: [
                  HomeAppointmentsWidget(
                    appointments: homeData.examinationAppointments,
                  ),
                  const VerticalGap(24),
                  HomeSpecializationsWidget(
                    specializations: homeData.specializations,
                  ),
                  const VerticalGap(24),
                  HomeDoctorsWidget(doctors: homeData.suggestedDoctors),
                  const VerticalGap(24),
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
