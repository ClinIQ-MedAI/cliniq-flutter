import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/utils/app_images.dart';
import 'package:cliniq/features/onboarding/domain/entities/onboarding_entity.dart';

const List<OnboardingEntity> onboardingList = [
  OnboardingEntity(
    image: AppImages.onboarding1,
    title: LocaleKeys.onboardingTitle1,
    description: LocaleKeys.onboardingDescription1,
  ),
  OnboardingEntity(
    image: AppImages.onboarding2,
    title: LocaleKeys.onboardingTitle2,
    description: LocaleKeys.onboardingDescription2,
  ),
  OnboardingEntity(
    image: AppImages.onboarding3,
    title: LocaleKeys.onboardingTitle3,
    description: LocaleKeys.onboardingDescription3,
  ),
];
