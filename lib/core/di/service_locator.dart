import 'package:get_it/get_it.dart';

import 'package:learny/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:learny/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:learny/features/auth/domain/repositories/auth_repository.dart';
import 'package:learny/features/auth/domain/usecases/is_email_verified_usecase.dart';
import 'package:learny/features/auth/domain/usecases/login_usecase.dart';
import 'package:learny/features/auth/domain/usecases/logout_usecase.dart';
import 'package:learny/features/auth/domain/usecases/register_usecase.dart';
import 'package:learny/features/auth/domain/usecases/reload_current_user_usecase.dart';
import 'package:learny/features/auth/domain/usecases/send_email_verification_usecase.dart';
import 'package:learny/features/auth/domain/usecases/send_password_reset_email_usecase.dart';

import 'package:learny/features/auth/presentation/view_model/email_verification_cubit/email_verification_cubit.dart';
import 'package:learny/features/auth/presentation/view_model/forget_cubit/forget_cubit.dart';
import 'package:learny/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:learny/features/auth/presentation/view_model/register_cubit/register_cubit.dart';
import 'package:learny/features/profile/data/datasource/profile_remote_data_source.dart';

import 'package:learny/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:learny/features/profile/domain/repositories/profile_repository.dart';
import 'package:learny/features/profile/domain/usecases/get_current_user_usecase.dart';
import 'package:learny/features/profile/domain/usecases/update_user_profile_usecase.dart';
import 'package:learny/features/profile/presentation/view_model/profile_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupLocators() async {
  // ==================== AUTH ====================

  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt<AuthRemoteDataSource>()),
  );

  getIt.registerLazySingleton(() => LoginUsecase(getIt<AuthRepository>()));

  getIt.registerLazySingleton(() => RegisterUsecase(getIt<AuthRepository>()));

  getIt.registerLazySingleton(
    () => ReloadCurrentUserUseCase(getIt<AuthRepository>()),
  );

  getIt.registerLazySingleton(
    () => IsEmailVerifiedUseCase(getIt<AuthRepository>()),
  );

  getIt.registerLazySingleton(
    () => SendEmailVerificationUseCase(getIt<AuthRepository>()),
  );

  getIt.registerLazySingleton(
    () => SendPasswordResetEmailUseCase(getIt<AuthRepository>()),
  );

  getIt.registerLazySingleton(() => LogoutUseCase(getIt<AuthRepository>()));

  getIt.registerFactory(() => LoginCubit(loginUsecase: getIt<LoginUsecase>()));

  getIt.registerFactory(() => RegisterCubit(getIt<RegisterUsecase>()));

  getIt.registerFactory(
    () => ForgetCubit(
      sendPasswordResetEmailUseCase: getIt<SendPasswordResetEmailUseCase>(),
    ),
  );

  getIt.registerFactory(
    () => EmailVerificationCubit(
      isEmailVerifiedUseCase: getIt<IsEmailVerifiedUseCase>(),
      sendEmailVerificationUseCase: getIt<SendEmailVerificationUseCase>(),
      reloadCurrentUserUseCase: getIt<ReloadCurrentUserUseCase>(),
    ),
  );

  // ==================== PROFILE ====================

  getIt.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(),
  );

  getIt.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(getIt<ProfileRemoteDataSource>()),
  );

  getIt.registerLazySingleton(
    () => GetCurrentUserUseCase(getIt<ProfileRepository>()),
  );

  getIt.registerLazySingleton(
    () => UpdateUserProfileUseCase(getIt<ProfileRepository>()),
  );
  getIt.registerLazySingleton<ProfileCubit>(
    () => ProfileCubit(
      getCurrentUserUseCase: getIt<GetCurrentUserUseCase>(),
      updateUserProfileUseCase: getIt<UpdateUserProfileUseCase>(),
      logoutUseCase: getIt<LogoutUseCase>(),
    ),
  );
}
