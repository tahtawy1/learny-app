import 'package:dartz/dartz.dart';

import 'package:learny/core/error/failure.dart';
import 'package:learny/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<AuthFailure, UserEntity>> login(UserEntity userModel);
  Future<Either<AuthFailure, UserEntity>> register(UserEntity userModel);
  Future<Either<AuthFailure, void>> reloadCurrentUser();
  bool isEmailVerified();
  Future<Either<AuthFailure, void>> sendEmailVerification();
  Future<Either<AuthFailure, void>> sendPasswordResetEmail(String email);
  Future<Either<AuthFailure, void>> signOut();
}
