import 'dart:math';

import 'package:cliniq/core/constants/storage_keys.dart';
import 'package:cliniq/core/helpers/app_storage_helper.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/features/onboarding/presentation/widgets/onboarding_progress_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cliniq/core/utils/app_routes.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/features/onboarding/data/sources/onboarding_local_data_source.dart';
import 'package:cliniq/features/onboarding/presentation/widgets/custom_onboarding_item.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  final PageController pageController = PageController();
  int currentIndex = 0;

  late AnimationController _animationController;
  late Animation<double> _sweepAnimation;
  double _previousSweepAngle = 0;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _sweepAnimation = Tween<double>(begin: 0, end: 0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    pageController.dispose();
    super.dispose();
  }

  void animateSweep(double newSweepAngle) {
    _sweepAnimation =
        Tween<double>(begin: _previousSweepAngle, end: newSweepAngle).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );

    _animationController
      ..reset()
      ..forward();

    _previousSweepAngle = newSweepAngle;
  }

  onNextButtonPressed() async {
    if (currentIndex < onboardingList.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      await AppStorageHelper.setBool(StorageKeys.isOnboardingCompleted, true);
      navigateToLoginScreen();
    }
  }

  navigateToLoginScreen() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      Routes.loginScreen,
      (route) => false,
    );
  }

  double getSweepAngle(int index) {
    switch (index) {
      case 0:
        return 0;
      case 1:
        return 210 * pi / 180;
      case 2:
        return 330 * pi / 180;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: onboardingList.length,
              onPageChanged: (index) {
                animateSweep(getSweepAngle(index));
                setState(() => currentIndex = index);
              },
              itemBuilder: (context, index) {
                final item = onboardingList[index];
                return CustomOnboardingItem(
                  image: item.image,
                  title: item.title,
                  description: item.description,
                );
              },
            ),
          ),

          const VerticalGap(20),
          GestureDetector(
            onTap: onNextButtonPressed,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 76.w,
                  height: 76.w,
                  child: AnimatedBuilder(
                    animation: _sweepAnimation,
                    builder: (context, child) {
                      return CustomPaint(
                        painter: OnboardingProgressPainter(
                          sweepAngle: _sweepAnimation.value,
                          color: Theme.of(context).primaryColor,
                          strokeWidth: 5,
                        ),
                      );
                    },
                  ),
                ),

                Container(
                  width: 56.w,
                  height: 56.w,
                  decoration: BoxDecoration(
                    color: context.theme.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: context.colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),

          const VerticalGap(20),
        ],
      ),
    );
  }
}
