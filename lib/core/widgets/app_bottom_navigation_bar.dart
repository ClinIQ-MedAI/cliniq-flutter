import 'package:cliniq/core/constants/dropdown_options.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });
  final int selectedIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.onSurface.withValues(alpha: 0.1),
            offset: const Offset(0, -12),
            blurRadius: 13,
            spreadRadius: 0,
          ),
        ],
      ),
      child: CurvedNavigationBar(
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Colors.transparent,
        color: context.theme.scaffoldBackgroundColor,
        buttonBackgroundColor: context.theme.scaffoldBackgroundColor,
        height: 85.h,
        index: selectedIndex,
        items: DropdownOptions.bottomNavItems.map((item) {
          if (item.isCenter) {
            return CurvedNavigationBarItem(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(item.icon),
                  Text(
                    item.label!.tr(),
                    style: AppTextStyles.getTextStyle(12).copyWith(
                      color: context.theme.primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            );
          }

          return CurvedNavigationBarItem(child: SvgPicture.asset(item.icon));
        }).toList(),
        onTap: onTap,
      ),
    );
  }
}
