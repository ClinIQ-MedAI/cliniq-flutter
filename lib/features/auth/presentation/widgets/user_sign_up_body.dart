import 'package:cliniq/core/enums/gender.dart';
import 'package:cliniq/core/utils/app_images.dart';
import 'package:cliniq/features/auth/presentation/widgets/auth_page_layout.dart';
import 'package:cliniq/features/auth/presentation/widgets/auth_switch_widget.dart';
import 'package:cliniq/features/auth/presentation/widgets/labeled_dropdown_form_field.dart';
import 'package:cliniq/features/auth/presentation/widgets/labeled_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cliniq/core/constants/locale_keys.dart';

import 'package:cliniq/core/utils/validators.dart';
import 'package:cliniq/core/widgets/custom_button.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/features/auth/data/models/user_sign_up_request_model.dart';
import 'package:cliniq/features/auth/domain/entities/user_sign_up_request_entity.dart';
import 'package:cliniq/features/auth/presentation/providers/sign_up_provider.dart';

class UserSignUpBody extends ConsumerStatefulWidget {
  const UserSignUpBody({super.key});

  @override
  ConsumerState<UserSignUpBody> createState() => UserSignUpBodyState();
}

class UserSignUpBodyState extends ConsumerState<UserSignUpBody> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isSignUpButtonEnabled = false;
  Gender? selectedGender;

  @override
  void initState() {
    super.initState();
    nameController.addListener(checkFormFilled);
    emailController.addListener(checkFormFilled);
    passwordController.addListener(checkFormFilled);
    confirmPasswordController.addListener(checkFormFilled);
    phoneController.addListener(checkFormFilled);
  }

  void checkFormFilled() {
    final isFilled =
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        selectedGender != null;
    if (isFilled != isSignUpButtonEnabled) {
      setState(() {
        isSignUpButtonEnabled = isFilled;
      });
    }
  }

  void onCreateAccountPressed() {
    if (formKey.currentState!.validate()) {
      final UserSignUpRequestEntity customerSignUpRequestEntity =
          UserSignUpRequestEntity(
            name: nameController.text,
            email: emailController.text,
            password: passwordController.text,
            passwordConfirm: confirmPasswordController.text,
            phone: phoneController.text,
            gender: selectedGender!,
          );

      final data = UserSignUpRequestModel.fromEntity(
        customerSignUpRequestEntity,
      ).toJson();
      ref.watch(signUpProvider.notifier).signUp(data: data);
    }
  }

  void onLoginButtonPressed() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthPageLayout(
      bottomRatio: 0.7,
      topSection: Image.asset(AppImages.signUpLogo),
      bottomSection: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalGap(24),
              LabeledFormField(
                controller: nameController,
                validator: Validators.validateNormalText,
                label: LocaleKeys.signupUserName,
                hint: LocaleKeys.signupUserNameHint,
                keyboardType: TextInputType.name,
              ),

              const VerticalGap(15),
              LabeledFormField(
                controller: emailController,
                label: LocaleKeys.signupUserEmail,
                hint: LocaleKeys.signupUserEmailHint,
                validator: Validators.validateEmail,
              ),
              const VerticalGap(15),
              LabeledDropdownFormField(
                title: LocaleKeys.signupUserGender,
                hintText: LocaleKeys.signupUserGenderHint,
                items: Gender.values.map((e) => e.name).toList(),
                validator: Validators.validateNormalText,
                onChanged: (value) {
                  setState(() {
                    selectedGender = Gender.values.firstWhere(
                      (e) => e.name == value,
                    );
                  });
                },
                selectedValue: selectedGender?.name,
              ),
              const VerticalGap(15),
              LabeledFormField(
                controller: phoneController,
                label: LocaleKeys.signupUserPhone,
                hint: LocaleKeys.signupUserPhoneHint,
                validator: Validators.validatePhoneNumber,
              ),

              const VerticalGap(15),
              LabeledFormField(
                controller: passwordController,
                label: LocaleKeys.signupUserPassword,
                hint: LocaleKeys.signupUserPasswordHint,
                isPassword: true,
                validator: Validators.validatePassword,
              ),

              const VerticalGap(15),
              LabeledFormField(
                controller: confirmPasswordController,
                label: LocaleKeys.signupUserConfirmPassword,
                hint: LocaleKeys.signupUserConfirmPasswordHint,
                isPassword: true,
                validator: (value) => Validators.confirmPasswordValidator(
                  value,
                  passwordController.text,
                ),
              ),
              const VerticalGap(25),
              CustomButton(
                isDisabled: !isSignUpButtonEnabled,
                onPressed: onCreateAccountPressed,
                text: LocaleKeys.signupUserSubmitButton,
              ),
              const VerticalGap(16),
              AuthSwitchWidget(
                text: LocaleKeys.signupUserAlreadyHaveAccount,
                actionText: LocaleKeys.signupUserLoginButton,
                onActionTap: onLoginButtonPressed,
              ),
              const VerticalGap(32),
            ],
          ),
        ),
      ),
    );
  }
}
