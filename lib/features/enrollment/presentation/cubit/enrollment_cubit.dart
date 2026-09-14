import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learny/features/courses/domain/usecases/get_courses_usecase.dart';
import 'package:learny/features/enrollment/domain/entities/enrollment_entity.dart';
import 'package:learny/features/enrollment/domain/enums/enrollment_status.dart';
import 'package:learny/features/enrollment/domain/usecases/get_my_enrollments_usecase.dart';
import 'package:learny/features/enrollment/presentation/cubit/enrollment_state.dart';

class EnrollmentCubit extends Cubit<EnrollmentState> {
  final GetMyEnrollmentsUseCase getMyEnrollmentsUseCase;
  final GetCoursesUsecase? getCoursesUseCase;

  EnrollmentCubit({
    required this.getMyEnrollmentsUseCase,
    this.getCoursesUseCase,
  }) : super(const EnrollmentInitial());

  List<EnrollmentEntity> _allEnrollments = [];
  EnrollmentFilter _currentFilter = EnrollmentFilter.all;

  EnrollmentFilter get currentFilter => _currentFilter;

  Future<void> getMyEnrollments() async {
    emit(const EnrollmentLoading());

    final enrollmentResult = await getMyEnrollmentsUseCase();

    if (isClosed) return;

    await enrollmentResult.fold(
      (failure) async {
        emit(EnrollmentError(failure.message));
      },
      (enrollments) async {
        if (enrollments.isEmpty) {
          _allEnrollments = [];
          emit(const EnrollmentEmpty());
          return;
        }

        // Single batch fetch of courses to enrich enrollments with title/image
        // Avoids N+1 — one getCourses call total
        List<EnrollmentEntity> enrichedEnrollments = enrollments;
        if (getCoursesUseCase != null) {
          final coursesResult = await getCoursesUseCase!();
          if (!isClosed) {
            coursesResult.fold(
              (_) {},
              (courses) {
                final courseMap = {for (final c in courses) c.id: c};
                enrichedEnrollments = enrollments.map((e) {
                  final course = courseMap[e.courseId];
                  if (course == null) return e;
                  return e.copyWith(
                    courseTitle: e.courseTitle ?? course.title,
                    courseImageUrl: e.courseImageUrl ?? course.imageUrl,
                  );
                }).toList();
              },
            );
          }
        }

        _allEnrollments = enrichedEnrollments;
        _emitFilteredState();
      },
    );
  }

  void changeFilter(EnrollmentFilter filter) {
    if (_currentFilter == filter) return;
    _currentFilter = filter;
    _emitFilteredState();
  }

  void _emitFilteredState() {
    if (_allEnrollments.isEmpty) {
      emit(const EnrollmentEmpty());
      return;
    }

    final filtered = _allEnrollments.where((e) {
      switch (_currentFilter) {
        case EnrollmentFilter.all:
          return true;
        case EnrollmentFilter.inProgress:
          return !e.isCompleted;
        case EnrollmentFilter.completed:
          return e.isCompleted;
      }
    }).toList();

    emit(EnrollmentSuccess(
      enrollments: filtered,
      selectedFilter: _currentFilter,
    ));
  }
}
