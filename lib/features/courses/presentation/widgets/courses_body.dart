import 'package:flutter/material.dart';
import 'package:learny/core/extensions/build_context.dart';
import 'package:learny/core/localization/l10n/app_localizations_ar.dart';
import 'package:learny/features/courses/domain/entities/course_entity.dart';
import 'package:learny/features/courses/presentation/widgets/course_card.dart';
import 'package:learny/features/courses/presentation/widgets/courses_app_bar.dart';
import 'package:learny/features/courses/presentation/widgets/courses_filter_bar.dart';

class CoursesBody extends StatelessWidget {
  const CoursesBody({super.key, required this.courses});

  final List<CourseEntity> courses;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CoursesAppBar(),
          const CoursesFilterBar(),
          Expanded(
            child: courses.isEmpty
                ? Center(
                    child: Text(
                      AppLocalizationsAr.instance.coursesEmptyState,
                      style: context.textStyle.bodyLarge,
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    itemCount: courses.length,
                    separatorBuilder: (ctx, i) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      return CourseCard(course: courses[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
