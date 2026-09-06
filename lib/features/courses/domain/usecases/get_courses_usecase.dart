import 'package:dartz/dartz.dart';
import 'package:learny/core/error/failure.dart';
import 'package:learny/features/courses/domain/entities/course_entity.dart';
import 'package:learny/features/courses/domain/repositories/course_repository.dart';

class GetCoursesUsecase {
  final CourseRepository repository;

  GetCoursesUsecase({required this.repository});

  Future<Either<CourseFailure, List<CourseEntity>>> call() async {
    return await repository.getCourses();
  }
}
