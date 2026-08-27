import 'package:dartz/dartz.dart';
import 'package:learny/core/error/failure.dart';

import 'package:learny/features/auth/domain/entities/user_entity.dart';
import 'package:learny/features/auth/domain/repositories/auth_repository.dart';

class RegisterUsecase {
  final AuthRepository repository;

  RegisterUsecase(this.repository);

  Future<Either<AuthFailure, UserEntity>> call(UserEntity userModel) async {
    return repository.register(userModel);
  }
}
