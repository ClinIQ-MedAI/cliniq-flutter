import 'package:cached_network_image/cached_network_image.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/widgets/custom_person_icon.dart';
import 'package:cliniq/features/home/presentation/providers/bottom_nav_index_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProfileImage extends ConsumerWidget {
  const UserProfileImage({
    super.key,
    this.circleAvatarRadius = 30,
    this.profilePicUrl,
    this.isEnabled = true,
    this.isCurrentUser = false,
  });

  final double circleAvatarRadius;
  final String? profilePicUrl;
  final bool isEnabled;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: !isEnabled
          ? null
          : () {
              ref.read(bottomNavIndexProvider.notifier).setIndex(4);
            },
      child: CircleAvatar(
        radius: circleAvatarRadius,
        backgroundColor: context.colorScheme.onPrimary,
        child: ClipOval(
          child: profilePicUrl != null
              ? CachedNetworkImage(
                  imageUrl: profilePicUrl!,
                  fit: BoxFit.cover,
                  width: circleAvatarRadius * 2,
                  height: circleAvatarRadius * 2,
                  errorWidget: (context, error, stackTrace) {
                    return CustomPersonIcon(
                      circleAvatarRadius: circleAvatarRadius,
                    );
                  },
                )
              : CustomPersonIcon(circleAvatarRadius: circleAvatarRadius),
        ),
      ),
    );
  }
}
