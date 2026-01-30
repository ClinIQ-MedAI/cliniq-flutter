import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthPageLayout extends StatelessWidget {
  final Widget topSection;
  final Widget bottomSection;
  final double bottomRatio;

  const AuthPageLayout({
    super.key,
    required this.topSection,
    required this.bottomSection,
    this.bottomRatio = 0.5,
  }) : assert(bottomRatio > 0 && bottomRatio < 1);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final bottomHeight = height * bottomRatio;
    final topHeight = height * (1 - bottomRatio);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: topHeight,
            width: double.infinity,
            color: context.theme.primaryColor,
            child: topSection,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: bottomHeight,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              decoration: BoxDecoration(
                color: context.theme.scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.r),
                  topRight: Radius.circular(25.r),
                ),
              ),
              child: bottomSection,
            ),
          ),
        ],
      ),
    );
  }
}
