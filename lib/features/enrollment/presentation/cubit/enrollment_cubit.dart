import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learny/features/courses/domain/entities/course_entity.dart';
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
  Map<String, CourseEntity> _coursesMap = {};
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
          _coursesMap = {};
          emit(const EnrollmentEmpty());
          return;
        }

        _allEnrollments = enrollments;
        _coursesMap = {};

        if (getCoursesUseCase != null) {
          final coursesResult = await getCoursesUseCase!();
          if (!isClosed) {
            coursesResult.fold(
              (_) {},
              (courses) {
                _coursesMap = {for (final c in courses) c.id: c};
              },
            );
          }
        }

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
      coursesMap: _coursesMap,
      selectedFilter: _currentFilter,
    ));
  }
}
