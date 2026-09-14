import 'package:flutter/material.dart';
import 'package:learny/core/extensions/build_context.dart';
import 'package:learny/core/localization/l10n/app_localizations_ar.dart';
import 'package:learny/core/theme/app_colors.dart';
import 'package:learny/features/enrollment/domain/entities/enrollment_entity.dart';

class MyCourseCard extends StatelessWidget {
  const MyCourseCard({
    super.key,
    required this.enrollment,
    this.onContinue,
  });

  final EnrollmentEntity enrollment;
  final VoidCallback? onContinue;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizationsAr.instance;
    final completed = enrollment.isCompleted;
    final progress = enrollment.progress;
    final completedCount = enrollment.completedLessonsCount.toInt();
    final totalCount = enrollment.totalLessonsCount.toInt();
    final percentage = (progress * 100).round();

    return Container(
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.07),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Course image ──────────────────────────────────────────
          SizedBox(
            height: 120,
            width: double.infinity,
            child: enrollment.courseImageUrl != null &&
                    enrollment.courseImageUrl!.isNotEmpty
                ? Image.network(
                    enrollment.courseImageUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => _PlaceholderImage(context),
                  )
                : _PlaceholderImage(context),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Status badge ──────────────────────────────────
                _StatusBadge(isCompleted: completed),

                const SizedBox(height: 8),

                // ── Course title ──────────────────────────────────
                Text(
                  enrollment.courseTitle ?? enrollment.courseId,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: context.textStyle.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: context.colors.onSurface,
                  ),
                ),

                const SizedBox(height: 10),

                // ── Progress stats ────────────────────────────────
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$percentage%',
                      style: context.textStyle.bodySmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: context.colors.primary,
                      ),
                    ),
                    Text(
                      '$completedCount / $totalCount ${loc.myCoursesLessonSuffix}',
                      style: context.textStyle.bodySmall?.copyWith(
                        color: context.colors.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                // ── Progress bar ──────────────────────────────────
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 6,
                    backgroundColor:
                        context.colors.surfaceContainerHighest,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      completed
                          ? AppColors.success
                          : context.colors.primary,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // ── Action button ─────────────────────────────────
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: completed
                      ? OutlinedButton.icon(
                          onPressed: null, // certificate: placeholder
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: AppColors.success),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          icon: const Icon(Icons.verified_outlined,
                              size: 16, color: AppColors.success),
                          label: Text(
                            loc.myCoursesViewCertificate,
                            style: const TextStyle(color: AppColors.success),
                          ),
                        )
                      : ElevatedButton.icon(
                          onPressed: onContinue,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: context.colors.primary,
                            foregroundColor: context.colors.onPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          icon: const Icon(Icons.play_circle_outline,
                              size: 16),
                          label: Text(loc.myCoursesContinueButton),
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

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.isCompleted});
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizationsAr.instance;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isCompleted
            ? AppColors.successLight
            : context.colors.primaryContainer,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        isCompleted ? loc.myCoursesStatusCompleted : loc.myCoursesStatusInProgress,
        style: context.textStyle.labelSmall?.copyWith(
          color: isCompleted
              ? AppColors.success
              : context.colors.onPrimaryContainer,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _PlaceholderImage extends StatelessWidget {
  const _PlaceholderImage(this.context);
  final BuildContext context;

  @override
  Widget build(BuildContext ctx) {
    return Container(
      color: ctx.colors.primaryContainer,
      child: Center(
        child: Icon(
          Icons.menu_book_rounded,
          size: 48,
          color: ctx.colors.primary,
        ),
      ),
    );
  }
}
