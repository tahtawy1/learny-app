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

import 'package:learny/features/courses/data/datasources/course_remote_data_source.dart';
import 'package:learny/features/courses/data/datasources/course_remote_data_source_impl.dart';
import 'package:learny/features/courses/data/repositories/course_repository_imp.dart';
import 'package:learny/features/courses/domain/repositories/course_repository.dart';
import 'package:learny/features/courses/domain/usecases/get_courses_usecase.dart';
import 'package:learny/features/courses/presentation/view_model/cubit/course_cubit.dart';
import 'package:learny/features/enrollment/data/datasources/enrollment_remote_data_source.dart';
import 'package:learny/features/enrollment/domain/repositories/enrollment_repository.dart';
import 'package:learny/features/enrollment/domain/usecases/get_my_enrollments_usecase.dart';
import 'package:learny/features/enrollment/presentation/cubit/enrollment_cubit.dart';
import 'package:learny/features/enrollment/repositories/enrollment_repository_impl.dart';
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

  // ==================== COURSES ====================

  getIt.registerLazySingleton<CourseRemoteDataSource>(
    () => CourseRemoteDataSourceImpl(),
  );

  getIt.registerLazySingleton<CourseRepository>(
    () =>
        CourseRepositoryImpl(remoteDataSource: getIt<CourseRemoteDataSource>()),
  );

  getIt.registerLazySingleton(
    () => GetCoursesUsecase(repository: getIt<CourseRepository>()),
  );

  getIt.registerFactory(
    () => CourseCubit(getCoursesUseCase: getIt<GetCoursesUsecase>()),
  );

  // ==================== ENROLLMENT ====================

  getIt.registerLazySingleton<EnrollmentRemoteDataSource>(
    () => EnrollmentRemoteDataSourceImpl(),
  );

  getIt.registerLazySingleton<EnrollmentRepository>(
    () => EnrollmentRepositoryImpl(getIt<EnrollmentRemoteDataSource>()),
  );

  getIt.registerLazySingleton<GetMyEnrollmentsUseCase>(
    () => GetMyEnrollmentsUseCase(getIt<EnrollmentRepository>()),
  );

  getIt.registerFactory<EnrollmentCubit>(
    () => EnrollmentCubit(
      getMyEnrollmentsUseCase: getIt<GetMyEnrollmentsUseCase>(),
      getCoursesUseCase: getIt<GetCoursesUsecase>(),
    ),
  );
}
