import 'package:learny/features/courses/data/datasources/course_remote_data_source_impl.dart';
import 'package:learny/features/courses/data/repositories/course_repository_imp.dart';
import 'package:learny/features/courses/domain/usecases/get_courses_usecase.dart';

class CourseDependencies {
  static CourseDependencies create() {
    final remote = CourseRemoteDataSourceImpl();
    final repo = CourseRepositoryImpl(remoteDataSource: remote);

    return CourseDependencies(
      getCoursesUseCase: GetCoursesUsecase(repository: repo),
    );
  }

  final GetCoursesUsecase getCoursesUseCase;

  CourseDependencies({required this.getCoursesUseCase});
}
