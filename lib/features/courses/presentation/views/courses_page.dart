import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:learny/core/extensions/build_context.dart';
import 'package:learny/core/localization/l10n/app_localizations_ar.dart';
import 'package:learny/features/courses/presentation/view_model/cubit/course_cubit.dart';
import 'package:learny/features/courses/presentation/widgets/courses_body.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      body: BlocBuilder<CourseCubit, CourseState>(
        builder: (context, state) {
          if (state is CourseLoading || state is CourseInitial) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is CourseError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64,
                    color: context.colors.error,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    state.message,
                    style: context.textStyle.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      CourseCubit.get(context).getCourses();
                    },
                    child: Text(AppLocalizationsAr.instance.coursesRetry),
                  ),
                ],
              ),
            );
          }

          if (state is CourseLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                CourseCubit.get(context).getCourses();
              },
              child: CoursesBody(courses: state.courses),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
