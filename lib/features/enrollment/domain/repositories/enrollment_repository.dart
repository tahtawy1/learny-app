import 'package:dartz/dartz.dart';
import 'package:learny/core/error/failure.dart';
import 'package:learny/features/enrollment/domain/entities/enrollment_entity.dart';

abstract class EnrollmentRepository {
  Future<Either<EnrollmentFailure, List<EnrollmentEntity>>> getMyEnrollments();
}
