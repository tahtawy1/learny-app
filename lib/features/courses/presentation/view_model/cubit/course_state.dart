part of 'course_cubit.dart';

@immutable
sealed class CourseState {}

final class CourseInitial extends CourseState {}

// أثناء جلب الكورسات
class CourseLoading extends CourseState {
  CourseLoading();
}

// تم جلب الكورسات بنجاح
class CourseLoaded extends CourseState {
  final List<CourseEntity> courses;

  CourseLoaded({required this.courses});
}

// حصل خطأ
class CourseError extends CourseState {
  final String message;

  CourseError({required this.message});
}
