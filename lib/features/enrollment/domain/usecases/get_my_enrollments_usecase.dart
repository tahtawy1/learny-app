import 'package:dartz/dartz.dart';
import 'package:learny/core/error/failure.dart';
import 'package:learny/features/enrollment/domain/entities/enrollment_entity.dart';
import 'package:learny/features/enrollment/domain/repositories/enrollment_repository.dart';

class GetMyEnrollmentsUseCase {
  final EnrollmentRepository repository;

  GetMyEnrollmentsUseCase(this.repository);

  Future<Either<EnrollmentFailure, List<EnrollmentEntity>>> call() {
    return repository.getMyEnrollments();
  }
}
