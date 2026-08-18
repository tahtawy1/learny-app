part of 'login_cubit.dart';

@immutable
sealed class LoginState {}
final class LoginInitial extends LoginState {
   LoginInitial();
}

// ================== Login ==================

final class LoginLoading extends LoginState {
   LoginLoading();
}

final class LoginSuccess extends LoginState {
  final UserEntity userModel;

   LoginSuccess({required this.userModel});


}

final class LoginError extends LoginState {
  final String message;

   LoginError({required this.message});

  
}
