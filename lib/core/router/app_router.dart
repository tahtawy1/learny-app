import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learny/features/auth/domain/entities/auth_dependencies.dart';
import 'package:learny/features/auth/domain/entities/user_entity.dart';
import 'package:learny/features/auth/presentation/view_model/email_verification_cubit/email_verification_cubit.dart';
import 'package:learny/features/auth/presentation/view_model/forget_cubit/forget_cubit.dart';
import 'package:learny/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:learny/features/auth/presentation/view_model/register_cubit/register_cubit.dart';
import 'package:learny/features/auth/presentation/views/email_verification_page.dart';
import 'package:learny/features/auth/presentation/views/forget_page.dart';
import 'package:learny/features/auth/presentation/views/login_page.dart';
import 'package:learny/features/auth/presentation/views/register_page.dart';
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
            create: (context) {
              final authDependencies = AuthDependencies.create();
              return LoginCubit(loginUsecase: authDependencies.loginUsecase);
            },
            child: const LoginPage(),
          );
        },
        routes: [
          GoRoute(
            path: 'forget',
            builder: (BuildContext context, GoRouterState state) {
              return BlocProvider<ForgetCubit>(
                create: (context) {
                  final authDependencies = AuthDependencies.create();
                  return ForgetCubit(
                    sendPasswordResetEmailUseCase:
                        authDependencies.sendPasswordResetEmailUseCase,
                  );
                },
                child: const ForgetPage(),
              );
            },
          ),
          GoRoute(
            path: 'register',
            builder: (BuildContext context, GoRouterState state) {
              return BlocProvider<RegisterCubit>(
                create: (context) {
                  final authDependencies = AuthDependencies.create();
                  return RegisterCubit(authDependencies.registerUsecase);
                },
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
            create: (context) {
              final authDependencies = AuthDependencies.create();
              return EmailVerificationCubit(
                isEmailVerifiedUseCase: authDependencies.isEmailVerifiedUseCase,
                sendEmailVerificationUseCase:
                    authDependencies.sendEmailVerificationUseCase,
                reloadCurrentUserUseCase:
                    authDependencies.reloadCurrentUserUseCase,
              )..init();
            },
            child: EmailVerificationPage(userEntity: userEntity),
          );
        },
      ),
    ],
  );
}
