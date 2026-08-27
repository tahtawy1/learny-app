part of 'forget_cubit.dart';

@immutable
sealed class ForgetState {}

class ForgetInitial extends ForgetState {}

class ForgetLoading extends ForgetState {}

class ForgetSuccess extends ForgetState {
  final String message;
  ForgetSuccess(this.message);
}

class ForgetFailure extends ForgetState {
  final String message;

  ForgetFailure(this.message);
}
