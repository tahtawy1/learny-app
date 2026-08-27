import 'package:dartz/dartz.dart';

import 'package:learny/core/error/failure.dart';
import 'package:learny/features/auth/domain/repositories/auth_repository.dart';

class SendPasswordResetEmailUseCase {
  final AuthRepository authRepository;

  SendPasswordResetEmailUseCase(this.authRepository);

  Future<Either<AuthFailure, void>> call(String email) async {
    return await authRepository.sendPasswordResetEmail(email);
  }
}
