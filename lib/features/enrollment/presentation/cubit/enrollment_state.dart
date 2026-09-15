import 'package:equatable/equatable.dart';
import 'package:learny/features/courses/domain/entities/course_entity.dart';
import 'package:learny/features/enrollment/domain/entities/enrollment_entity.dart';
import 'package:learny/features/enrollment/domain/enums/enrollment_status.dart';

abstract class EnrollmentState extends Equatable {
  const EnrollmentState();

  @override
  List<Object?> get props => [];
}

class EnrollmentInitial extends EnrollmentState {
  const EnrollmentInitial();
}

class EnrollmentLoading extends EnrollmentState {
  const EnrollmentLoading();
}

class EnrollmentEmpty extends EnrollmentState {
  const EnrollmentEmpty();
}

class EnrollmentSuccess extends EnrollmentState {
  final List<EnrollmentEntity> enrollments;
  final Map<String, CourseEntity> coursesMap;
  final EnrollmentFilter selectedFilter;

  const EnrollmentSuccess({
    required this.enrollments,
    this.coursesMap = const {},
    this.selectedFilter = EnrollmentFilter.all,
  });

  @override
  List<Object?> get props => [enrollments, coursesMap, selectedFilter];
}

class EnrollmentError extends EnrollmentState {
  final String message;

  const EnrollmentError(this.message);

  @override
  List<Object?> get props => [message];
}
