import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/helpers/get_text_palette.dart';
import 'package:cliniq/core/helpers/navigate_to_home_screen.dart';
import 'package:cliniq/core/helpers/show_custom_snack_bar.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/success.dart';
import 'package:cliniq/core/widgets/back_help_app_bar.dart';
import 'package:cliniq/core/widgets/custom_modal_progress_hud.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/features/auth/presentation/providers/verify_email_provider.dart';
import 'package:cliniq/features/auth/presentation/widgets/verify_email_body.dart';

class VerifyEmailScreen extends ConsumerWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(verifyEmailProvider, (previous, next) {
      if (next is AsyncData && next.value is Success) {
        navigateToHomeScreen(context);
      } else if (next is AsyncError) {
        showCustomSnackBar(context, next.error.toString());
      }
    });
    return CustomModalProgressHUD(
      inAsyncCall: ref.watch(verifyEmailProvider).isLoading,
      child: Scaffold(
        appBar: const BackHelpAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),

          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const VerticalGap(37),
                  Text(
                    LocaleKeys.authCreateAccountVerifyEmailTitle.tr(),
                    style: AppTextStyles.getTextStyle(28).copyWith(
                      fontWeight: FontWeight.w700,
                      color: getTextPalette(context).headingColor,
                    ),
                  ),
                  const VerticalGap(23),
                  const VerifyEmailBody(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
