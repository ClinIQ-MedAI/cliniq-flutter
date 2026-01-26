import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/helpers/get_text_palette.dart';
import 'package:cliniq/core/utils/app_svgs.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/widgets/horizontal_gap.dart';

class ConfirmTermsAndConditionsSignUp extends StatefulWidget {
  const ConfirmTermsAndConditionsSignUp({
    super.key,
    required this.initialValue,
    this.onChanged,
  });
  final bool initialValue;
  final ValueChanged<bool>? onChanged;

  @override
  State<ConfirmTermsAndConditionsSignUp> createState() =>
      _ConfirmTermsAndConditionsSignUpState();
}

class _ConfirmTermsAndConditionsSignUpState
    extends State<ConfirmTermsAndConditionsSignUp> {
  bool value = false;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  void _onChanged(bool newValue) {
    setState(() {
      value = newValue;
    });
    widget.onChanged?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    final textPalette = getTextPalette(context);

    return Row(
      children: [
        GestureDetector(
          onTap: () => _onChanged(!value),
          behavior: HitTestBehavior.translucent,
          child: SvgPicture.asset(
            height: 9.h,
            width: 9.w,
            value ? AppSvgs.activeCheckbox : AppSvgs.inactiveCheckbox,
          ),
        ),
        const HorizontalGap(10),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: AppTextStyles.getTextStyle(
                11,
              ).copyWith(color: textPalette.primaryColor),
              children: [
                TextSpan(
                  text: LocaleKeys.authCreateAccountCustomerSignupAgreeTerms
                      .tr(),
                ),
                TextSpan(
                  text:
                      " ${LocaleKeys.authCreateAccountCustomerSignupAgreeTermsText.tr()}",
                  style: AppTextStyles.getTextStyle(11).copyWith(
                    color: textPalette.primaryColor,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // TODO: implement onTap
                    },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
