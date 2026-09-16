import 'package:flutter/material.dart';
import 'package:learny/core/localization/l10n/app_localizations_ar.dart';

class LessonNavigation extends StatelessWidget {
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;
  final VoidCallback? onComplete;
  final bool hasPrevious;
  final bool hasNext;
  final bool isCompleted;
  final String? progressText;

  const LessonNavigation({
    super.key,
    this.onPrevious,
    this.onNext,
    this.onComplete,
    this.hasPrevious = false,
    this.hasNext = false,
    this.isCompleted = false,
    this.progressText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color(0xFFF1F5F9), width: 1.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Previous Lesson (Right side in RTL)
          InkWell(
            onTap: hasPrevious ? onPrevious : null,
            borderRadius: BorderRadius.circular(8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppLocalizationsAr.instance.lessonNavigationPrevious,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: hasPrevious
                        ? const Color(0xFF475569)
                        : const Color(0xFF94A3B8),
                  ),
                ),
                const SizedBox(width: 6),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 13,
                  color: hasPrevious
                      ? const Color(0xFF475569)
                      : const Color(0xFF94A3B8),
                ),
              ],
            ),
          ),

          // Progress text: "الدرس 5 من 15" (Center)
          if (progressText != null)
            Text(
              progressText!,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF94A3B8),
                fontWeight: FontWeight.w500,
              ),
            ),

          // Next Lesson (Left side in RTL)
          InkWell(
            onTap: hasNext ? onNext : null,
            borderRadius: BorderRadius.circular(8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 13,
                  color: hasNext
                      ? const Color(0xFF0D9488)
                      : const Color(0xFF94A3B8),
                ),
                const SizedBox(width: 6),
                Text(
                  AppLocalizationsAr.instance.lessonNavigationNext,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: hasNext
                        ? const Color(0xFF0D9488)
                        : const Color(0xFF94A3B8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
