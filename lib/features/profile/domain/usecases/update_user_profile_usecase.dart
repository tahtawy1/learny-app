import 'package:dartz/dartz.dart';
import 'package:learny/core/error/failure.dart';
import 'package:learny/features/auth/domain/entities/user_entity.dart';
import 'package:learny/features/profile/domain/repositories/profile_repository.dart';

class UpdateUserProfileUseCase {
  final ProfileRepository repository;

  UpdateUserProfileUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call({
    required String name,
  }) async {
    return repository.updateUserProfile(name: name);
  }
}
