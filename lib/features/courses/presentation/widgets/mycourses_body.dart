import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learny/core/extensions/build_context.dart';
import 'package:learny/core/localization/l10n/app_localizations_ar.dart';
import 'package:learny/core/theme/app_colors.dart';
import 'package:learny/features/enrollment/domain/entities/enrollment_entity.dart';
import 'package:learny/features/enrollment/domain/enums/enrollment_status.dart';
import 'package:learny/features/enrollment/presentation/cubit/enrollment_cubit.dart';
import 'my_course_card.dart';

class MyCoursesBody extends StatelessWidget {
  const MyCoursesBody({
    super.key,
    required this.enrollments,
    required this.selectedFilter,
  });

  final List<EnrollmentEntity> enrollments;
  final EnrollmentFilter selectedFilter;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizationsAr.instance;

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ── Page title ────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
            child: Text(
              loc.myCoursesPageTitle,
              textAlign: TextAlign.right,
              style: context.textStyle.headlineSmall?.copyWith(
                fontWeight: FontWeight.w800,
                color: context.colors.onSurface,
              ),
            ),
          ),

          // ── Filter bar ────────────────────────────────────────────
          _FilterBar(selected: selectedFilter),

          const SizedBox(height: 14),

          // ── Course list ───────────────────────────────────────────
          Expanded(
            child: enrollments.isEmpty
                ? _EmptyFiltered(filter: selectedFilter)
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 4,
                    ),
                    itemCount: enrollments.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final enrollment = enrollments[index];
                      return MyCourseCard(
                        enrollment: enrollment,
                        // TODO: wire to course detail route when available
                        onContinue: null,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

// ─── Filter bar ────────────────────────────────────────────────────────────────

class _FilterBar extends StatelessWidget {
  const _FilterBar({required this.selected});
  final EnrollmentFilter selected;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizationsAr.instance;
    final items = [
      (EnrollmentFilter.all, loc.myCoursesFilterAll),
      (EnrollmentFilter.inProgress, loc.myCoursesFilterInProgress),
      (EnrollmentFilter.completed, loc.myCoursesFilterCompleted),
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      reverse: true, // RTL — start from right
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: items.map((item) {
          final (filter, label) = item;
          final isSelected = selected == filter;
          return Padding(
            padding: const EdgeInsetsDirectional.only(start: 8),
            child: GestureDetector(
              onTap: () =>
                  context.read<EnrollmentCubit>().changeFilter(filter),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected
                      ? context.colors.primary
                      : context.colors.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  label,
                  style: context.textStyle.bodySmall?.copyWith(
                    color: isSelected
                        ? context.colors.onPrimary
                        : context.colors.onSurface,
                    fontWeight:
                        isSelected ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// ─── Empty state for filtered result ─────────────────────────────────────────

class _EmptyFiltered extends StatelessWidget {
  const _EmptyFiltered({required this.filter});
  final EnrollmentFilter filter;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizationsAr.instance;
    final message = filter == EnrollmentFilter.completed
        ? loc.myCoursesEmptyCompleted
        : filter == EnrollmentFilter.inProgress
            ? loc.myCoursesEmptyInProgress
            : loc.myCoursesEmptySubtitle;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.school_outlined,
            size: 72,
            color: AppColors.primary.withValues(alpha: 0.4),
          ),
          const SizedBox(height: 16),
          Text(
            message,
            style: context.textStyle.bodyLarge?.copyWith(
              color: context.colors.onSurface.withValues(alpha: 0.6),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// ─── Full empty state (no enrollments at all) ─────────────────────────────────

class MyCoursesEmptyState extends StatelessWidget {
  const MyCoursesEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizationsAr.instance;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.auto_stories_outlined,
              size: 96,
              color: AppColors.primary.withValues(alpha: 0.35),
            ),
            const SizedBox(height: 24),
            Text(
              loc.myCoursesEmptyTitle,
              style: context.textStyle.headlineSmall?.copyWith(
                fontWeight: FontWeight.w800,
                color: context.colors.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              loc.myCoursesEmptySubtitle,
              style: context.textStyle.bodyMedium?.copyWith(
                color: context.colors.onSurface.withValues(alpha: 0.6),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () => context.go('/courses'),
              style: ElevatedButton.styleFrom(
                backgroundColor: context.colors.primary,
                foregroundColor: context.colors.onPrimary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.explore_outlined),
              label: Text(
                loc.myCoursesEmptyExploreButton,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
