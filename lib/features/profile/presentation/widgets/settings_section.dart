import 'package:flutter/material.dart';
import 'package:learny/core/extensions/build_context.dart';
import 'package:learny/core/theme/app_colors.dart';
import 'package:learny/core/theme/app_radius.dart';
import 'package:learny/features/profile/presentation/widgets/profile_menu_item.dart';

class SettingsSection extends StatefulWidget {
  const SettingsSection({super.key});

  @override
  State<SettingsSection> createState() => _SettingsSectionState();
}

class _SettingsSectionState extends State<SettingsSection> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: AppRadius.lg,
        border: Border.all(color: AppColors.border.withValues(alpha: 0.8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 4),
            child: Row(
              children: [
                const Icon(
                  Icons.settings_outlined,
                  size: 20,
                  color: AppColors.textSecondary,
                ),
                const SizedBox(width: 8),
                Text(
                  'الإعدادات',
                  style: context.textStyle.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colors.onSurface,
                  ),
                ),
              ],
            ),
          ),
          ProfileMenuItem(
            title: 'تفضيلات الإشعارات',
            icon: Icons.notifications_none_rounded,
            iconBackgroundColor: AppColors.teal,
            onTap: () {
              // Notification preferences
            },
          ),
          Divider(height: 1, color: AppColors.border.withValues(alpha: 0.5)),
          ProfileMenuItem(
            title: 'الوضع الداكن',
            icon: Icons.nightlight_round_outlined,
            iconBackgroundColor: const Color(0xFF6366F1),
            trailing: Transform.scale(
              scale: 0.8,
              child: Switch(
                value: _isDarkMode,
                activeThumbColor: AppColors.primary,
                onChanged: (val) {
                  setState(() {
                    _isDarkMode = val;
                  });
                },
              ),
            ),
          ),
          Divider(height: 1, color: AppColors.border.withValues(alpha: 0.5)),
          ProfileMenuItem(
            title: 'اللغة',
            icon: Icons.language_rounded,
            iconBackgroundColor: const Color(0xFF3B82F6),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'العربية',
                  style: context.textStyle.bodySmall?.copyWith(
                    color: AppColors.textHint,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 6),
                const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 13,
                  color: AppColors.textHint,
                ),
              ],
            ),
            onTap: () {
              // Language switch
            },
          ),
        ],
      ),
    );
  }
}
