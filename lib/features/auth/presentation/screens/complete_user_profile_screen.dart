import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/helpers/navigate_to_home_screen.dart';
import 'package:cliniq/core/helpers/show_custom_snack_bar.dart';
import 'package:cliniq/core/utils/app_routes.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/utils/success.dart';
import 'package:cliniq/core/widgets/custom_modal_progress_hud.dart';
import 'package:cliniq/features/auth/presentation/providers/complete_profile_provider.dart';
import 'package:cliniq/features/auth/presentation/widgets/complete_user_profile_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompleteUserProfileScreen extends ConsumerWidget {
  const CompleteUserProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(completeProfileProvider, (prev, next) {
      if (next is AsyncData && next.value is Success) {
        Navigator.pushReplacementNamed(context, Routes.userHomeScreen);
      } else if (next is AsyncError) {
        showCustomSnackBar(context, next.error.toString());
      }
    });

    return CustomModalProgressHUD(
      inAsyncCall: ref.watch(completeProfileProvider).isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  context.theme.primaryColor,
                  context.colorScheme.primaryContainer,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
          centerTitle: true,
          toolbarHeight: 80.h,
          title: Text(
            LocaleKeys.completeProfileTitle.tr(),
            style: AppTextStyles.getTextStyle(22).copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: TextButton(
                onPressed: () {
                  navigateToHomeScreen(context);
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white.withValues(alpha: 0.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  LocaleKeys.completeProfileSkip.tr(),
                  style: AppTextStyles.getTextStyle(
                    14,
                  ).copyWith(fontWeight: FontWeight.w600, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        body: const CompleteProfileBody(),
      ),
    );
  }
}
