import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learny/features/courses/domain/entities/course_entity.dart';
import 'package:learny/features/courses/domain/usecases/get_courses_usecase.dart';

part 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit({required this.getCoursesUseCase}) : super(CourseInitial());
  final GetCoursesUsecase getCoursesUseCase;

  static CourseCubit get(BuildContext context) => BlocProvider.of(context);
  void getCourses() async {
    emit(CourseLoading());
    if (isClosed) {
      return;
    }
    final result = await getCoursesUseCase();
    if (isClosed) {
      return;
    }
    result.fold(
      (ifLeft) {
        emit(CourseError(message: ifLeft.message));
      },
      (list) {
        emit(CourseLoaded(courses: list));
      },
    );
  }
}
