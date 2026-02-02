import 'package:cliniq/core/utils/app_images.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/features/auth/presentation/widgets/auth_page_layout.dart';
import 'package:cliniq/features/auth/presentation/widgets/labeled_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/helpers/show_custom_snack_bar.dart';
import 'package:cliniq/core/utils/app_routes.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/success.dart';
import 'package:cliniq/core/utils/validators.dart';
import 'package:cliniq/core/widgets/custom_button.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/features/auth/presentation/providers/forget_password_provider.dart';

class ForgetPasswordBody extends ConsumerStatefulWidget {
  const ForgetPasswordBody({super.key});

  @override
  ConsumerState<ForgetPasswordBody> createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends ConsumerState<ForgetPasswordBody> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(checkEmail);
  }

  void checkEmail() {
    final isFilled = emailController.text.isNotEmpty;
    if (isFilled != isButtonEnabled) {
      setState(() {
        isButtonEnabled = isFilled;
      });
    }
  }

  @override
  void dispose() {
    emailController.removeListener(checkEmail);
    emailController.dispose();
    super.dispose();
  }

  void onSendCodeTap() {
    if (formKey.currentState!.validate()) {
      ref
          .read(forgetPasswordProvider.notifier)
          .forgetPassword(email: emailController.text);
    }
  }

  void goToVerifyCodeScreen() {
    Navigator.pushNamed(
      context,
      Routes.verifyResetCodeScreen,
      arguments: {'email': emailController.text},
    );
  }

  void listenOnForgetPasswordProvider() {
    ref.listen(forgetPasswordProvider, (previous, next) {
      if (next is AsyncError) {
        showCustomSnackBar(context, next.error.toString());
      } else if (next is AsyncData && next.value is Success) {
        goToVerifyCodeScreen();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    listenOnForgetPasswordProvider();

    return AuthPageLayout(
      topSection: Image.asset(AppImages.forgetPasswordLogo),
      bottomSection: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalGap(35),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.forgetPasswordForgetPassword.tr(),
                    style: AppTextStyles.getTextStyle(
                      20,
                    ).copyWith(color: context.textPalette.primaryColor),
                  ),
                ],
              ),
              const VerticalGap(43),
              LabeledFormField(
                label: LocaleKeys.forgetPasswordEmail,
                hint: LocaleKeys.forgetPasswordEmailHint,
                controller: emailController,
                validator: Validators.validateEmail,
              ),
              const VerticalGap(50),
              CustomButton(
                onPressed: onSendCodeTap,
                isDisabled: !isButtonEnabled,
                text: LocaleKeys.forgetPasswordSendOtp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
