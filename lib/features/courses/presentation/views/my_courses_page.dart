import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learny/core/extensions/build_context.dart';
import 'package:learny/core/localization/l10n/app_localization.dart';
import 'package:learny/features/courses/presentation/widgets/mycourses_body.dart';
import 'package:learny/features/enrollment/presentation/cubit/enrollment_cubit.dart';
import 'package:learny/features/enrollment/presentation/cubit/enrollment_state.dart';

class MyCoursesPage extends StatefulWidget {
  const MyCoursesPage({super.key});

  @override
  State<MyCoursesPage> createState() => _MyCoursesPageState();
}

class _MyCoursesPageState extends State<MyCoursesPage> {
  @override
  void initState() {
    super.initState();
    context.read<EnrollmentCubit>().getMyEnrollments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      body: BlocBuilder<EnrollmentCubit, EnrollmentState>(
        builder: (context, state) {
          // ── Loading / Initial ───────────────────────────────────
          if (state is EnrollmentInitial || state is EnrollmentLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // ── Error ───────────────────────────────────────────────
          if (state is EnrollmentError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
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
                      onPressed: () =>
                          context.read<EnrollmentCubit>().getMyEnrollments(),
                      child: Text(AppLocalization.instance.coursesRetry),
                    ),
                  ],
                ),
              ),
            );
          }

          // ── Empty (no enrollments) ──────────────────────────────
          if (state is EnrollmentEmpty) {
            return const MyCoursesEmptyState();
          }

          // ── Success ─────────────────────────────────────────────
          if (state is EnrollmentSuccess) {
            return MyCoursesBody(
              enrollments: state.enrollments,
              coursesMap: state.coursesMap,
              selectedFilter: state.selectedFilter,
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
