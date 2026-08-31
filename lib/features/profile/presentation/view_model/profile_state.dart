part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

// Get Profile states
final class ProfileLoading extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final UserEntity user;

  ProfileSuccess({required this.user});
}

final class ProfileError extends ProfileState {
  final String message;

  ProfileError({required this.message});
}

// Update Profile states
final class ProfileUpdateLoading extends ProfileState {}

final class ProfileUpdateSuccess extends ProfileState {
  final UserEntity user;

  ProfileUpdateSuccess({required this.user});
}

final class ProfileUpdateError extends ProfileState {
  final String message;

  ProfileUpdateError({required this.message});
}

// Logout states
final class ProfileLogoutLoading extends ProfileState {}

final class ProfileLogoutSuccess extends ProfileState {}

final class ProfileLogoutError extends ProfileState {
  final String message;

  ProfileLogoutError({required this.message});
}
