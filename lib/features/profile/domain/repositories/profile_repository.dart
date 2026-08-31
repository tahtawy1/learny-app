import 'package:dartz/dartz.dart';
import 'package:learny/core/error/failure.dart';
import 'package:learny/features/auth/domain/entities/user_entity.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UserEntity>> getCurrentUser();
  Future<Either<Failure, UserEntity>> updateUserProfile({
    required String name,
  });
}
