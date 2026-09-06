import 'package:learny/core/services/firebase_service.dart';
import 'package:learny/features/courses/data/datasources/course_remote_data_source.dart';
import 'package:learny/features/courses/data/models/course_model.dart';

class CourseRemoteDataSourceImpl implements CourseRemoteDataSource {
  CourseRemoteDataSourceImpl();

  @override
  Future<List<CourseModel>> getCourses() async {
    return await FirebaseService.getCourses();
  }
}
