import 'package:flutter/material.dart';
import 'package:learny/core/extensions/build_context.dart';
import 'package:learny/core/theme/app_colors.dart';
import 'package:learny/core/theme/app_radius.dart';
import 'package:learny/features/auth/domain/entities/user_entity.dart';
import 'package:learny/features/profile/presentation/widgets/user_avatar.dart';

class ProfileHeaderCard extends StatelessWidget {
  const ProfileHeaderCard({
    super.key,
    required this.user,
    this.onEditTap,
  });

  final UserEntity user;
  final VoidCallback? onEditTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 20, bottom: 28),
      decoration: const BoxDecoration(
        gradient: AppColors.primaryGradient,
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            UserAvatar(
              name: user.name,
              size: 90,
              showEditBadge: true,
              onEditTap: onEditTap,
            ),
            const SizedBox(height: 14),
            Text(
              user.name ?? 'أحمد محمد',
              style: context.textStyle.headlineSmall?.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.white.withValues(alpha: 0.18),
                borderRadius: AppRadius.full,
              ),
              child: Text(
                'الصف الثالث الثانوي',
                style: context.textStyle.bodySmall?.copyWith(
                  color: AppColors.white.withValues(alpha: 0.95),
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
