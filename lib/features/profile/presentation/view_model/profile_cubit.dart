import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learny/features/auth/domain/entities/user_entity.dart';
import 'package:learny/features/auth/domain/usecases/logout_usecase.dart';
import 'package:learny/features/profile/domain/usecases/get_current_user_usecase.dart';
import 'package:learny/features/profile/domain/usecases/update_user_profile_usecase.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({
    required this.getCurrentUserUseCase,
    required this.updateUserProfileUseCase,
    required this.logoutUseCase,
  }) : super(ProfileInitial());

  static ProfileCubit get(BuildContext context) => BlocProvider.of(context);

  final GetCurrentUserUseCase getCurrentUserUseCase;
  final UpdateUserProfileUseCase updateUserProfileUseCase;
  final LogoutUseCase logoutUseCase;

  UserEntity? user;

  Future<void> getCurrentUser() async {
    emit(ProfileLoading());

    if (isClosed) return;

    final result = await getCurrentUserUseCase();

    if (isClosed) return;

    result.fold((failure) => emit(ProfileError(message: failure.message)), (
      currentUser,
    ) {
      user = currentUser;
      emit(ProfileSuccess(user: currentUser));
    });
  }

  Future<void> updateUserProfile({required String name}) async {
    emit(ProfileUpdateLoading());

    if (isClosed) return;

    final result = await updateUserProfileUseCase(name: name);

    if (isClosed) return;

    result.fold(
      (failure) => emit(ProfileUpdateError(message: failure.message)),
      (updatedUser) {
        user = updatedUser;
        emit(ProfileUpdateSuccess(user: updatedUser));
      },
    );
  }

  Future<void> logout() async {
    final result = await logoutUseCase();

    if (isClosed) return;

    result.fold(
      (failure) => emit(ProfileError(message: failure.message)),
      (_) {},
    );
  }
}
