
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learny/features/auth/domain/entities/user_entity.dart';
import 'package:learny/features/auth/domain/usecases/login_usecase.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit( {required this.loginUsecase}) : super(LoginInitial());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  final LoginUsecase loginUsecase;

  Future<void> signInWithEmailAndPassword(UserEntity credentials) async {
    emit(LoginLoading());
    if (isClosed) return;
    final result = await loginUsecase(credentials);
    if (isClosed) return;
    result.fold(
      (l) => emit(LoginError(message: l.message)),
      (r) => emit(LoginSuccess(userModel: r)),
    );
  }
}
