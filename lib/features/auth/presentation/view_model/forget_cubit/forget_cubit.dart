import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learny/core/localization/l10n/app_localization.dart';
import 'package:learny/features/auth/domain/usecases/send_password_reset_email_usecase.dart';
import 'package:meta/meta.dart';

part 'forget_state.dart';

class ForgetCubit extends Cubit<ForgetState> {
  ForgetCubit({required this.sendPasswordResetEmailUseCase})
    : super(ForgetInitial());
  static ForgetCubit get(BuildContext context) => BlocProvider.of(context);

  final SendPasswordResetEmailUseCase sendPasswordResetEmailUseCase;

  Future<void> sendPasswordResetEmail(String email) async {
    emit(ForgetLoading());

    final result = await sendPasswordResetEmailUseCase(email);

    result.fold(
      (failure) {
        emit(ForgetFailure(failure.message));
      },
      (_) {
        emit(
          ForgetSuccess(AppLocalization.instance.formForgetPageSuccessMessage),
        );
      },
    );
  }
}
