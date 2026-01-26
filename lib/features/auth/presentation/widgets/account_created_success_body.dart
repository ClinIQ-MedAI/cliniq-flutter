import 'package:cliniq/core/helpers/navigate_to_home_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/helpers/get_text_palette.dart';
import 'package:cliniq/core/utils/app_animations.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';

class AccountCreatedSuccessBody extends StatefulWidget {
  const AccountCreatedSuccessBody({super.key});

  @override
  State<AccountCreatedSuccessBody> createState() =>
      _AccountCreatedSuccessBodyState();
}

class _AccountCreatedSuccessBodyState extends State<AccountCreatedSuccessBody>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        navigateToHomeScreen(context);
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textPallete = getTextPalette(context);

    return Column(
      children: [
        const VerticalGap(122),
        Text(
          LocaleKeys.authCreateAccountVerifyEmailSuccessRegistration.tr(),
          style: AppTextStyles.getTextStyle(20).copyWith(
            fontWeight: FontWeight.w600,
            color: textPallete.primaryColor,
          ),
        ),
        Lottie.asset(
          AppAnimations.successAnimation,
          controller: _animationController,
          height: 200.h,
          width: 200.w,
          fit: BoxFit.cover,
          repeat: false,
          onLoaded: (composition) {
            _animationController
              ..duration = composition.duration * 1.5
              ..forward();
          },
        ),
      ],
    );
  }
}
