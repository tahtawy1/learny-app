import 'package:learny/core/services/firebase_service.dart';
import 'package:learny/features/enrollment/data/models/enrollment_model.dart';

abstract class EnrollmentRemoteDataSource {
  Future<List<EnrollmentModel>> getMyEnrollments();
}

class EnrollmentRemoteDataSourceImpl implements EnrollmentRemoteDataSource {
  EnrollmentRemoteDataSourceImpl();

  @override
  Future<List<EnrollmentModel>> getMyEnrollments() async {
    return FirebaseService.getMyEnrollments();
  }
}
