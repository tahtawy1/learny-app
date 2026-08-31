import 'package:flutter/material.dart';
import 'package:learny/core/extensions/build_context.dart';
import 'package:learny/core/theme/app_colors.dart';
import 'package:learny/core/theme/app_radius.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    super.key,
    required this.title,
    required this.icon,
    this.iconColor,
    this.iconBackgroundColor,
    this.trailing,
    this.onTap,
    this.showBorder = false,
  });

  final String title;
  final IconData icon;
  final Color? iconColor;
  final Color? iconBackgroundColor;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    final effectiveIconColor = iconColor ?? AppColors.white;
    final effectiveIconBgColor = iconBackgroundColor ?? AppColors.teal;

    return InkWell(
      onTap: onTap,
      borderRadius: AppRadius.sm,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: showBorder
              ? Border.all(color: AppColors.border.withValues(alpha: 0.7))
              : null,
          borderRadius: showBorder ? AppRadius.sm : null,
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: effectiveIconBgColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 20,
                color: effectiveIconColor,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                title,
                style: context.textStyle.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: context.colors.onSurface,
                  fontSize: 14,
                ),
              ),
            ),
            if (trailing != null)
              trailing!
            else if (onTap != null)
              const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 14,
                color: AppColors.textHint,
              ),
          ],
        ),
      ),
    );
  }
}
