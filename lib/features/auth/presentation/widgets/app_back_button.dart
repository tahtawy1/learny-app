import 'package:flutter/material.dart';
import 'package:learny/core/extensions/build_context.dart';

class AppBackButton extends StatelessWidget {
  final VoidCallback? onPressed;

  final Color? backgroundColor;
  final Color? iconColor;
  final double size;
  final double iconSize;
  final double blurRadius;
  final double shadowOpacity;

  const AppBackButton({
    super.key,

    this.onPressed,
    this.backgroundColor,
    this.iconColor,
    this.size = 48,
    this.iconSize = 20,
    this.blurRadius = 5,
    this.shadowOpacity = 0.15,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor ?? context.colors.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: shadowOpacity),
            blurRadius: blurRadius,
            spreadRadius: .5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        style: IconButton.styleFrom(
          foregroundColor: iconColor ?? context.colors.onSurface,
          backgroundColor: backgroundColor ?? context.colors.surface,
          shape: const CircleBorder(),
        ),
        icon: Icon(Icons.arrow_forward_ios, size: iconSize),
      ),
    );
  }
}
