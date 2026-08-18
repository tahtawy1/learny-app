import 'package:dartz/dartz.dart';

import 'package:learny/core/error/failure.dart';
import 'package:learny/features/auth/domain/repositories/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository authRepository;

  LogoutUseCase(this.authRepository);

  Future<Either<AuthFailure, void>> call() async {
    return await authRepository.signOut();
  }
}
