import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:cliniq/core/helpers/get_text_palette.dart';
import 'package:cliniq/core/utils/app_dark_colors.dart';
import 'package:cliniq/core/utils/app_light_colors.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';

class CustomPinputOtp extends StatelessWidget {
  const CustomPinputOtp({super.key, required this.otpController});

  final TextEditingController otpController;

  @override
  Widget build(BuildContext context) {
    final textPalette = getTextPalette(context);

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Pinput(
        controller: otpController,
        animationCurve: Curves.bounceIn,
        keyboardType: TextInputType.number,
        submittedPinTheme: PinTheme(
          height: 48.h,
          width: 48.h,
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? AppDarkColors.activePinFieldBackground
                : AppLightColors.activePinFieldBackground,
            borderRadius: BorderRadius.circular(8.r),
          ),
          textStyle: AppTextStyles.getTextStyle(32).copyWith(
            fontWeight: FontWeight.w600,
            color: textPalette.primaryColor,
          ),
        ),
        defaultPinTheme: PinTheme(
          height: 48.h,
          width: 48.h,
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? AppDarkColors.inActivePinFieldBackground
                : AppLightColors.inActivePinFieldBackground,
            borderRadius: BorderRadius.circular(8.r),
          ),
          textStyle: AppTextStyles.getTextStyle(32).copyWith(
            fontWeight: FontWeight.w600,
            color: textPalette.primaryColor,
          ),
        ),
      ),
    );
  }
}
