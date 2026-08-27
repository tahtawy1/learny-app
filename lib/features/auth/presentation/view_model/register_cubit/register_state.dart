part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

// ================== Initial ==================
final class RegisterInitial extends RegisterState {
  RegisterInitial();
}

// ================== Register ==================
final class RegisterLoading extends RegisterState {
  RegisterLoading();
}

final class RegisterSuccess extends RegisterState {
  final UserEntity userEntity;

  RegisterSuccess({required this.userEntity});
}

final class RegisterError extends RegisterState {
  final String message;

  RegisterError({required this.message});
}
