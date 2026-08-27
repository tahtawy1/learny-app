import 'package:learny/features/auth/domain/repositories/auth_repository.dart';

class IsEmailVerifiedUseCase {
  final AuthRepository authRepository;

  IsEmailVerifiedUseCase(this.authRepository);

  bool call() {
    return authRepository.isEmailVerified();
  }
}
