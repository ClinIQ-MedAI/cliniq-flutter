import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:flutter/material.dart';

class CustomPersonIcon extends StatelessWidget {
  const CustomPersonIcon({super.key, required this.circleAvatarRadius});

  final double circleAvatarRadius;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.person_2,
      color: context.colorScheme.primary,
      size: circleAvatarRadius * 1.5,
    );
  }
}
