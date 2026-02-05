import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/widgets/custom_button.dart';
import 'package:cliniq/core/widgets/custom_text_form_field.dart';
import 'package:cliniq/core/widgets/user_profile_image.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/features/user/data/models/user_profile_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final UserProfileModel user = UserProfileModel.mock();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _mobileController;
  late TextEditingController _heightController;
  late TextEditingController _weightController;
  late TextEditingController _ailmentsController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: user.name);
    _emailController = TextEditingController(text: user.email);
    _mobileController = TextEditingController(text: user.mobile);
    _heightController = TextEditingController(text: user.height);
    _weightController = TextEditingController(text: user.weight);
    _ailmentsController = TextEditingController(text: user.ailments);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _ailmentsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.profileUserEditProfile.tr(),
          style: AppTextStyles.getTextStyle(20).copyWith(
            fontWeight: FontWeight.w700,
            color: context.textPalette.primaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            UserProfileImage(circleAvatarRadius: 50, isEnabled: true),
            const VerticalGap(30),
            CustomTextFormField(
              controller: _nameController,
              hintText: LocaleKeys.profileUserFullName.tr(),
              prefixIcon: const Icon(Icons.person_outline),
            ),
            const VerticalGap(16),
            CustomTextFormField(
              controller: _mobileController,
              hintText: LocaleKeys.profileUserMobile.tr(),
              prefixIcon: const Icon(Icons.phone_android),
            ),
            const VerticalGap(16),
            CustomTextFormField(
              controller: _emailController,
              hintText: LocaleKeys.profileUserEmail.tr(),
              prefixIcon: const Icon(Icons.email_outlined),
            ),
            const VerticalGap(16),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    controller: _heightController,
                    hintText: LocaleKeys.profileUserHeight.tr(),
                    prefixIcon: const Icon(Icons.height),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomTextFormField(
                    controller: _weightController,
                    hintText: LocaleKeys.profileUserWeight.tr(),
                    prefixIcon: const Icon(Icons.monitor_weight_outlined),
                  ),
                ),
              ],
            ),
            const VerticalGap(16),
            CustomTextFormField(
              controller: _ailmentsController,
              hintText: LocaleKeys.profileUserAilments.tr(),
              prefixIcon: const Icon(Icons.sick_outlined),
              maxLines: 3,
            ),
            const VerticalGap(40),
            CustomButton(
              text: LocaleKeys.profileUserSave.tr(),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
