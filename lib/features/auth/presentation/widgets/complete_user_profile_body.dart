import 'package:cliniq/core/constants/dropdown_options.dart';
import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/utils/app_routes.dart';
import 'package:cliniq/core/widgets/custom_button.dart';
import 'package:cliniq/core/widgets/custom_divider.dart';
import 'package:cliniq/core/widgets/custom_switch_tile.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/features/auth/data/models/patient_survey_request_model.dart';
import 'package:cliniq/features/auth/domain/entities/patient_survey_request_entity.dart';
import 'package:cliniq/features/auth/presentation/providers/complete_profile_provider.dart';
import 'package:cliniq/core/widgets/form_section_header.dart';
import 'package:cliniq/core/widgets/labeled_dropdown_form_field.dart';
import 'package:cliniq/core/widgets/labeled_form_field.dart';
import 'package:cliniq/core/widgets/custom_card_section.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompleteProfileBody extends ConsumerStatefulWidget {
  const CompleteProfileBody({super.key});

  @override
  ConsumerState<CompleteProfileBody> createState() =>
      _CompleteProfileBodyState();
}

class _CompleteProfileBodyState extends ConsumerState<CompleteProfileBody> {
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final allergiesController = TextEditingController();
  final chronicController = TextEditingController();
  final emergencyNameController = TextEditingController();
  final emergencyPhoneController = TextEditingController();

  bool hasDiabetes = false;
  bool hasPressure = false;
  String? bloodType;

  final formKey = GlobalKey<FormState>();

  void onSubmit() {
    final entity = PatientSurveyRequestEntity(
      height: double.tryParse(heightController.text),
      weight: double.tryParse(weightController.text),
      hasDiabetes: hasDiabetes,
      hasPressureIssues: hasPressure,
      bloodType: bloodType,
      allergies: allergiesController.text,
      chronicConditions: chronicController.text,
      emergencyContactName: emergencyNameController.text,
      emergencyContactPhone: emergencyPhoneController.text,
    );

    ref
        .read(completeProfileProvider.notifier)
        .submitProfile(
          data: PatientSurveyRequestModel.fromEntity(entity).toJson(),
        );
  }

  void onSkip() {
    Navigator.pushReplacementNamed(context, Routes.userHomeScreen);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalGap(8),

              FormSectionHeader(
                title: LocaleKeys.completeProfileGeneralInfo,
                description: LocaleKeys.completeProfileGeneralInfoDesc,
                icon: Icons.person_outline_rounded,
              ),
              CustomCardSection(
                children: [
                  LabeledFormField(
                    controller: heightController,
                    label: LocaleKeys.completeProfileHeight,
                    hint: LocaleKeys.completeProfileHeightHint,
                    keyboardType: TextInputType.number,
                  ),
                  const VerticalGap(16),
                  LabeledFormField(
                    controller: weightController,
                    label: LocaleKeys.completeProfileWeight,
                    hint: LocaleKeys.completeProfileWeightHint,
                    keyboardType: TextInputType.number,
                  ),
                  const VerticalGap(16),
                  LabeledDropdownFormField(
                    title: LocaleKeys.completeProfileBloodType,
                    hintText: LocaleKeys.completeProfileBloodTypeHint,
                    items: DropdownOptions.bloodTypes,
                    onChanged: (v) => bloodType = v,
                  ),
                ],
              ),

              const VerticalGap(16),
              FormSectionHeader(
                title: LocaleKeys.completeProfileMedicalHistory,
                description: LocaleKeys.completeProfileMedicalHistoryDesc,
                icon: Icons.history_edu_rounded,
              ),
              CustomCardSection(
                children: [
                  LabeledFormField(
                    controller: allergiesController,
                    label: LocaleKeys.completeProfileAllergies,
                    hint: LocaleKeys.completeProfileAllergiesHint,
                  ),
                  const VerticalGap(16),
                  LabeledFormField(
                    controller: chronicController,
                    label: LocaleKeys.completeProfileChronicConditions,
                    hint: LocaleKeys.completeProfileChronicConditionsHint,
                  ),
                ],
              ),

              const VerticalGap(16),
              FormSectionHeader(
                title: LocaleKeys.completeProfileEmergencyContact,
                description: LocaleKeys.completeProfileEmergencyContactDesc,
                icon: Icons.emergency_outlined,
              ),
              CustomCardSection(
                children: [
                  LabeledFormField(
                    controller: emergencyNameController,
                    label: LocaleKeys.completeProfileEmergencyContactName,
                    hint: LocaleKeys.completeProfileEmergencyContactNameHint,
                  ),
                  const VerticalGap(16),
                  LabeledFormField(
                    controller: emergencyPhoneController,
                    label: LocaleKeys.completeProfileEmergencyContactPhone,
                    hint: LocaleKeys.completeProfileEmergencyContactPhoneHint,
                    keyboardType: TextInputType.phone,
                  ),
                ],
              ),

              const VerticalGap(16),

              FormSectionHeader(
                title: LocaleKeys.completeProfileHealthStatus,
                description: LocaleKeys.completeProfileHealthStatusDesc,
                icon: Icons.favorite_border_rounded,
              ),
              CustomCardSection(
                children: [
                  CustomSwitchTile(
                    title: LocaleKeys.completeProfileHasDiabetes.tr(),
                    value: hasDiabetes,
                    onChanged: (v) => setState(() => hasDiabetes = v),
                  ),
                  const CustomDivider(),
                  CustomSwitchTile(
                    title: LocaleKeys.completeProfileHasPressure.tr(),
                    value: hasPressure,
                    onChanged: (v) => setState(() => hasPressure = v),
                  ),
                ],
              ),

              const VerticalGap(32),

              CustomButton(
                onPressed: onSubmit,
                text: LocaleKeys.completeProfileSubmit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
