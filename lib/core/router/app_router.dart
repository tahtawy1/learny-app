import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learny/core/di/service_locator.dart';
import 'package:learny/features/auth/domain/entities/user_entity.dart';
import 'package:learny/features/auth/presentation/view_model/email_verification_cubit/email_verification_cubit.dart';
import 'package:learny/features/auth/presentation/view_model/forget_cubit/forget_cubit.dart';
import 'package:learny/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:learny/features/auth/presentation/view_model/register_cubit/register_cubit.dart';
import 'package:learny/features/auth/presentation/views/email_verification_page.dart';
import 'package:learny/features/auth/presentation/views/forget_page.dart';
import 'package:learny/features/auth/presentation/views/login_page.dart';
import 'package:learny/features/auth/presentation/views/register_page.dart';
import 'package:learny/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:learny/features/profile/presentation/views/edit_profile_page.dart';
import 'package:learny/features/profile/presentation/views/profile_page.dart';
import 'package:learny/features/splash/presentation/views/splash_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashPage();
        },
      ),
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider<LoginCubit>(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginPage(),
          );
        },
        routes: [
          GoRoute(
            path: 'forget',
            builder: (BuildContext context, GoRouterState state) {
              return BlocProvider<ForgetCubit>(
                create: (context) => getIt<ForgetCubit>(),
                child: const ForgetPage(),
              );
            },
          ),
          GoRoute(
            path: 'register',
            builder: (BuildContext context, GoRouterState state) {
              return BlocProvider<RegisterCubit>(
                create: (context) => getIt<RegisterCubit>(),
                child: const RegisterPage(),
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: '/email_verification',
        builder: (BuildContext context, GoRouterState state) {
          final userEntity = state.extra as UserEntity;

          return BlocProvider<EmailVerificationCubit>(
            create: (context) => getIt<EmailVerificationCubit>()..init(),
            child: EmailVerificationPage(userEntity: userEntity),
          );
        },
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => BlocProvider.value(
          value: getIt<ProfileCubit>()..getCurrentUser(),
          child: const ProfilePage(),
        ),
      ),
      GoRoute(
        path: '/edit_profile',
        builder: (context, state) => BlocProvider.value(
          value: getIt<ProfileCubit>(),
          child: const EditProfilePage(),
        ),
      ),
    ],
  );
}
