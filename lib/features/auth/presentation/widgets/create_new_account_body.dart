import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/helpers/get_text_palette.dart';
import 'package:cliniq/core/helpers/show_custom_snack_bar.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/success.dart';
import 'package:cliniq/core/widgets/custom_step_indicator.dart';
import 'package:cliniq/core/widgets/expandable_page_view.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/features/auth/presentation/providers/sign_up_provider.dart';
import 'package:cliniq/features/auth/presentation/providers/verify_email_provider.dart';
import 'package:cliniq/features/auth/presentation/widgets/account_created_success_body.dart';
import 'package:cliniq/features/auth/presentation/widgets/sign_up_body.dart';
import 'package:cliniq/features/auth/presentation/widgets/verify_email_body.dart';

class CreateNewAccountBody extends ConsumerStatefulWidget {
  const CreateNewAccountBody({super.key});

  @override
  ConsumerState<CreateNewAccountBody> createState() =>
      _CreateNewAccountBodyState();
}

class _CreateNewAccountBodyState extends ConsumerState<CreateNewAccountBody> {
  final PageController pageController = PageController();

  String pageTitle = LocaleKeys.authCreateAccountTitle.tr();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void goToNextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  // TODO: use listenManual later
  void listenOnSignUpProvider() {
    ref.listen(signUpProvider, (previous, next) {
      if (next is AsyncError) {
        showCustomSnackBar(context, next.error.toString().tr());
      } else if (next is AsyncData && next.value is Success) {
        goToNextPage();
        setState(() {
          pageTitle = LocaleKeys.authCreateAccountVerifyEmailTitle.tr();
        });
      }
    });
  }

  void listenOnVerifyEmailProvider() {
    ref.listen(verifyEmailProvider, (previous, next) {
      if (next is AsyncError) {
        showCustomSnackBar(context, next.error.toString().tr());
      } else if (next is AsyncData && next.value is Success) {
        goToNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textPalette = getTextPalette(context);
    listenOnSignUpProvider();
    listenOnVerifyEmailProvider();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const VerticalGap(37),
              Text(
                pageTitle,
                style: AppTextStyles.getTextStyle(28).copyWith(
                  fontWeight: FontWeight.w700,
                  color: textPalette.headingColor,
                ),
              ),
              const VerticalGap(32),
              AnimatedBuilder(
                animation: pageController,
                builder: (context, child) {
                  return CustomStepIndicator(
                    count: 4,
                    currentIndex: pageController.hasClients
                        ? (pageController.page?.round() ?? 0)
                        : 0,
                  );
                },
              ),
              ExpandablePageView(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const SignUpBody(),
                  const VerifyEmailBody(),
                  const AccountCreatedSuccessBody(),
                ],
              ),
              const VerticalGap(64),
            ],
          ),
        ],
      ),
    );
  }
}
