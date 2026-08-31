import 'package:flutter/material.dart';
import 'package:learny/core/theme/app_colors.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    required this.name,
    this.size = 90,
    this.showEditBadge = true,
    this.onEditTap,
  });

  final String? name;
  final double size;
  final bool showEditBadge;
  final VoidCallback? onEditTap;

  String _getInitials(String? text) {
    if (text == null || text.trim().isEmpty) return 'أح';
    final parts = text.trim().split(RegExp(r'\s+'));
    if (parts.length == 1) {
      return parts[0].characters.take(2).toString();
    }
    final first = parts[0].isNotEmpty ? parts[0].characters.first : '';
    final second = parts[1].isNotEmpty ? parts[1].characters.first : '';
    return '$first$second';
  }

  @override
  Widget build(BuildContext context) {
    final initials = _getInitials(name);

    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.teal.withValues(alpha: 0.35),
              border: Border.all(
                color: AppColors.white.withValues(alpha: 0.3),
                width: 2,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              initials,
              style: TextStyle(
                fontSize: size * 0.36,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
          ),
          if (showEditBadge)
            Positioned(
              top: -2,
              right: -2,
              child: GestureDetector(
                onTap: onEditTap,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.15),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.edit_outlined,
                    size: 15,
                    color: AppColors.primaryDark,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
