import 'package:dartz/dartz.dart';
import 'package:learny/core/error/exceptions.dart';
import 'package:learny/core/error/failure.dart';
import 'package:learny/features/enrollment/data/datasources/enrollment_remote_data_source.dart';
import 'package:learny/features/enrollment/domain/entities/enrollment_entity.dart';
import 'package:learny/features/enrollment/domain/repositories/enrollment_repository.dart';

class EnrollmentRepositoryImpl implements EnrollmentRepository {
  final EnrollmentRemoteDataSource remoteDataSource;

  EnrollmentRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<EnrollmentFailure, List<EnrollmentEntity>>>
  getMyEnrollments() async {
    try {
      final result = await remoteDataSource.getMyEnrollments();
      return Right(result);
    } on EnrollmentException catch (e) {
      return Left(EnrollmentExceptionMapper.map(e));
    } catch (e) {
      return Left(EnrollmentFailure.unknown());
    }
  }
}
