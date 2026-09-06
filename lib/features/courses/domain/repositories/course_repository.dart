import 'package:dartz/dartz.dart';
import 'package:learny/core/error/failure.dart';
import 'package:learny/features/courses/domain/entities/course_entity.dart';

abstract class CourseRepository {
  Future<Either<CourseFailure, List<CourseEntity>>> getCourses();
}
