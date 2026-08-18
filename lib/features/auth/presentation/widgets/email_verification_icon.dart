
import 'package:flutter/material.dart';
import 'package:learny/core/extensions/build_context.dart';

class EmailVerificationIcon extends StatelessWidget {
  const EmailVerificationIcon({super.key, });



  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 125,
          height: 125,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.colors.primary.withValues(alpha: 0.04),
          ),
          child: Center(
            child: Container(
              width: 52,
              height: 42,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: context.colors.primary, width: 5),
              ),
              child: Icon(
                Icons.mail_outline,
                size: 34,
                color: context.colors.primary,
              ),
            ),
          ),
        ),

        Positioned(
          right: -8,
          bottom: -8,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.colors.surface,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.12),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Icon(Icons.check_circle, color: Colors.green, size: 24),
          ),
        ),
      ],
    );
  }
}