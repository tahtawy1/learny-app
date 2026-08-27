import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learny/features/auth/domain/entities/user_entity.dart';
import 'package:learny/features/auth/domain/usecases/register_usecase.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerUsecase) : super(RegisterInitial());

  static RegisterCubit get(BuildContext context) => BlocProvider.of(context);

  final RegisterUsecase registerUsecase;

  Future<void> createUserWithEmailAndPassword(UserEntity userEntity) async {
    emit(RegisterLoading());
    if (isClosed) return;
    final result = await registerUsecase(userEntity);
    if (isClosed) return;
    result.fold(
      (l) => emit(RegisterError(message: l.message)),
      (r) => emit(RegisterSuccess(userEntity: r)),
    );
  }
}
