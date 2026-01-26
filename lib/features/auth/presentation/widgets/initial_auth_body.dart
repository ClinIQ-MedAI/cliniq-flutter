import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/helpers/get_text_palette.dart';
import 'package:cliniq/core/utils/app_images.dart';
import 'package:cliniq/core/utils/app_routes.dart';
import 'package:cliniq/core/utils/app_svgs.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/widgets/custom_button.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';

class InitialAuthBody extends StatelessWidget {
  const InitialAuthBody({super.key});

  @override
  Widget build(BuildContext context) {
    final textPalette = getTextPalette(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const VerticalGap(39),
        SvgPicture.asset(AppSvgs.san3aLogo),
        Image.asset(AppImages.initialAuthLogo),
        const VerticalGap(27),
        Text(
          LocaleKeys.authInitialLetStart.tr(),
          style: AppTextStyles.getTextStyle(32).copyWith(
            fontWeight: FontWeight.w700,
            color: textPalette.headingColor,
          ),
        ),
        const VerticalGap(12),
        Text(
          LocaleKeys.authInitialBestCraftsmenTitle.tr(),
          style: AppTextStyles.getTextStyle(
            12,
          ).copyWith(color: textPalette.headingColor),
        ),
        const VerticalGap(25),
        RPadding(
          padding: const EdgeInsets.symmetric(horizontal: 44),
          child: Column(
            children: [
              CustomButton(
                text: LocaleKeys.authInitialLoginButton.tr(),
                borderRadius: 8,
                onPressed: () {
                  Navigator.pushNamed(context, Routes.loginScreen);
                },
              ),
              const VerticalGap(7),
              CustomButton(
                text: LocaleKeys.authInitialCreateAccountButton.tr(),
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                textColor: Theme.of(context).primaryColor,
                isOutline: true,
                borderRadius: 8,
                onPressed: () {
                  Navigator.pushNamed(context, Routes.createNewAccountScreen);
                },
              ),
            ],
          ),
        ),
        const VerticalGap(16),
        Text(
          LocaleKeys.authInitialCreateAccountAgreeText.tr(),
          style: AppTextStyles.getTextStyle(
            12,
          ).copyWith(color: textPalette.paragraphColor),
        ),
        Text(
          LocaleKeys.authInitialTermsAndConditions.tr(),
          style: AppTextStyles.getTextStyle(12).copyWith(
            color: textPalette.paragraphColor,
            decoration: TextDecoration.underline,
          ),
        ),
        const VerticalGap(27),
      ],
    );
  }
}
