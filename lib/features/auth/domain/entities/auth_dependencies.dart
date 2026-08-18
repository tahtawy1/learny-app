
import 'package:learny/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:learny/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:learny/features/auth/domain/usecases/is_email_verified_usecase.dart';
import 'package:learny/features/auth/domain/usecases/login_usecase.dart';
import 'package:learny/features/auth/domain/usecases/logout_usecase.dart';
import 'package:learny/features/auth/domain/usecases/register_usecase.dart';
import 'package:learny/features/auth/domain/usecases/reload_current_user_usecase.dart';
import 'package:learny/features/auth/domain/usecases/send_email_verification_usecase.dart';
import 'package:learny/features/auth/domain/usecases/send_password_reset_email_usecase.dart';

class AuthDependencies {
  final AuthRemoteDataSourceImpl remoteDataSource;
  final AuthRepositoryImpl authRepository;
  final LoginUsecase loginUsecase;
  final RegisterUsecase registerUsecase;
  final ReloadCurrentUserUseCase reloadCurrentUserUseCase;
  final IsEmailVerifiedUseCase isEmailVerifiedUseCase;
  final SendEmailVerificationUseCase sendEmailVerificationUseCase;
  final SendPasswordResetEmailUseCase sendPasswordResetEmailUseCase;
  final LogoutUseCase logoutUseCase;

  AuthDependencies._({
    required this.remoteDataSource,
    required this.authRepository,
    required this.loginUsecase,
    required this.registerUsecase,
    required this.reloadCurrentUserUseCase,
    required this.isEmailVerifiedUseCase,
    required this.sendEmailVerificationUseCase,
    required this.sendPasswordResetEmailUseCase,
    required this.logoutUseCase,
  });

  factory AuthDependencies.create() {
    final remote = AuthRemoteDataSourceImpl();
    final repo = AuthRepositoryImpl(remote);

    return AuthDependencies._(
      remoteDataSource: remote,
      authRepository: repo,
      loginUsecase: LoginUsecase(repo),
      registerUsecase: RegisterUsecase(repo),
      reloadCurrentUserUseCase: ReloadCurrentUserUseCase(repo),
      isEmailVerifiedUseCase: IsEmailVerifiedUseCase(repo),
      sendEmailVerificationUseCase: SendEmailVerificationUseCase(repo),
      sendPasswordResetEmailUseCase: SendPasswordResetEmailUseCase(repo),
      logoutUseCase: LogoutUseCase(repo),
    );
  }
}
