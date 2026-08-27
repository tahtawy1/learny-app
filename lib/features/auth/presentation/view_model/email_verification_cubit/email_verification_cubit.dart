import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learny/features/auth/domain/usecases/is_email_verified_usecase.dart';
import 'package:learny/features/auth/domain/usecases/reload_current_user_usecase.dart';
import 'package:learny/features/auth/domain/usecases/send_email_verification_usecase.dart';
import 'package:meta/meta.dart';

part 'email_verification_state.dart';

class EmailVerificationCubit extends Cubit<EmailVerificationState> {
  EmailVerificationCubit({
    required this.isEmailVerifiedUseCase,
    required this.sendEmailVerificationUseCase,
    required this.reloadCurrentUserUseCase,
  }) : super(EmailVerificationInitial());

  final IsEmailVerifiedUseCase isEmailVerifiedUseCase;
  final SendEmailVerificationUseCase sendEmailVerificationUseCase;
  final ReloadCurrentUserUseCase reloadCurrentUserUseCase;

  Timer? _timer;

  Future<void> init() async {
    if (isClosed) return;
    final result = await sendEmailVerificationUseCase();
if (isClosed) return;
    result.fold(
      (failure) {
        emit(EmailVerificationFailure(message: failure.message));
      },
      (_) {
        startVerificationTimer();
      },
    );
  }

  void startVerificationTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      checkEmailVerification();
    });
  }

  Future<void> checkEmailVerification() async {
    if (isClosed) return;
    final reloadResult = await reloadCurrentUserUseCase();
    if (isClosed) return;
    await reloadResult.fold(
      (failure) async {
        emit(EmailVerificationFailure(message: failure.message));
      },
      (_) async {
        final result = isEmailVerifiedUseCase();
        if (result) {
          _timer?.cancel();
          emit(EmailVerificationSuccess());
        } else {
          emit(EmailVerificationNotVerified());
        }
      },
    );
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
