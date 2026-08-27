import 'package:dartz/dartz.dart';

import 'package:learny/core/error/failure.dart';

import 'package:learny/features/auth/domain/repositories/auth_repository.dart';

class ReloadCurrentUserUseCase {
  final AuthRepository authRepository;

  ReloadCurrentUserUseCase(this.authRepository);

  Future<Either<AuthFailure, void>> call() async {
    return await authRepository.reloadCurrentUser();
  }
}
