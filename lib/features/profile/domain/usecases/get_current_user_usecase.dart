import 'package:dartz/dartz.dart';
import 'package:learny/core/error/failure.dart';
import 'package:learny/features/auth/domain/entities/user_entity.dart';
import 'package:learny/features/profile/domain/repositories/profile_repository.dart';

class GetCurrentUserUseCase {
  final ProfileRepository repository;

  GetCurrentUserUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call() async {
    return repository.getCurrentUser();
  }
}
