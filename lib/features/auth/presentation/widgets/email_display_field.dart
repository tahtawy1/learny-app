import 'package:flutter/material.dart';
import 'package:learny/core/extensions/build_context.dart';
import 'package:learny/core/theme/app_colors.dart';

class EmailDisplayField extends StatelessWidget {
  final String email;
  final IconData icon;

  const EmailDisplayField({
    super.key,
    required this.email,
    this.icon = Icons.mail_outline,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.colors.outline),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              email,
              textAlign: TextAlign.center,
              style: context.textStyle.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: context.colors.onSurface,
              ),
            ),
          ),
          Icon(
            icon,
            size: 30,
            color: context.colors.primary.withValues(alpha: 0.55),
          ),
        ],
      ),
    );
  }
}
