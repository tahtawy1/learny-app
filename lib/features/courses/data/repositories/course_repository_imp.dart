import 'package:dartz/dartz.dart';
import 'package:learny/core/error/exceptions.dart';
import 'package:learny/core/error/failure.dart';
import 'package:learny/features/courses/data/datasources/course_remote_data_source.dart';
import 'package:learny/features/courses/data/models/course_model.dart';
import 'package:learny/features/courses/domain/repositories/course_repository.dart';

class CourseRepositoryImpl implements CourseRepository {
  final CourseRemoteDataSource remoteDataSource;

  CourseRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<CourseFailure, List<CourseModel>>> getCourses() async {
    try {
      final courses = await remoteDataSource.getCourses();
      return Right(courses);
    } on CourseException catch (e) {
      return Left(CourseExceptionMapper.map(e));
    }
  }
}
