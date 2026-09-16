import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learny/core/extensions/build_context.dart';
import 'package:learny/core/localization/l10n/app_localizations_ar.dart';
import 'package:learny/features/courses/domain/entities/course_entity.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({super.key, required this.course});

  final CourseEntity course;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: context.colors.shadow.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // صورة الكورس
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              course.imageUrl,
              height: 150,
              fit: BoxFit.cover,
              errorBuilder: (ctx, err, st) => Container(
                height: 150,
                color: context.colors.primaryContainer,
                child: Icon(
                  Icons.book_rounded,
                  size: 60,
                  color: context.colors.primary,
                ),
              ),
            ),
          ),
          // معلومات الكورس
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  course.title,
                  textAlign: TextAlign.right,
                  style: context.textStyle.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  course.subtitle,
                  textAlign: TextAlign.right,
                  style: context.textStyle.bodySmall?.copyWith(
                    color: context.colors.onSurface.withValues(alpha: 0.6),
                  ),
                ),
                const SizedBox(height: 12),
                // مدة الكورس وعدد الطلاب
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _InfoChip(
                      icon: Icons.people_outline,
                      label:
                          '${course.studentsCount} ${AppLocalizationsAr.instance.courseCardStudentsSuffix}',
                      color: context.colors.primary,
                    ),
                    const SizedBox(width: 12),
                    _InfoChip(
                      icon: Icons.access_time,
                      label:
                          '${course.durationMinutes} ${AppLocalizationsAr.instance.courseCardHoursSuffix}',
                      color: context.colors.primary,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Divider(),
                const SizedBox(height: 8),
                // السعر وخصم إن وجد
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (course.oldPrice != null) ...[
                      Text(
                        '${course.oldPrice!.toStringAsFixed(0)} ${AppLocalizationsAr.instance.courseCardCurrencySuffix}',
                        style: context.textStyle.bodySmall?.copyWith(
                          color: context.colors.onSurface.withValues(
                            alpha: 0.4,
                          ),
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                    Text(
                      course.isFree
                          ? AppLocalizationsAr.instance.courseCardFree
                          : '${course.price.toStringAsFixed(0)} ${AppLocalizationsAr.instance.courseCardCurrencySuffix}',
                      style: context.textStyle.titleMedium?.copyWith(
                        color: context.colors.primary,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // أزرار الشراء والمحتوى
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          context.push('/course_details', extra: course);
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: context.colors.primary),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: Text(
                          AppLocalizationsAr.instance.courseCardViewContent,
                          style: TextStyle(color: context.colors.primary),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: context.colors.primary,
                          foregroundColor: context.colors.onPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: Text(
                          course.isFree
                              ? AppLocalizationsAr.instance.courseCardFreeEnroll
                              : AppLocalizationsAr.instance.courseCardBuy,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({
    required this.icon,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: context.textStyle.bodySmall?.copyWith(
            color: context.colors.onSurface.withValues(alpha: 0.6),
          ),
        ),
        const SizedBox(width: 4),
        Icon(icon, size: 16, color: color),
      ],
    );
  }
}
