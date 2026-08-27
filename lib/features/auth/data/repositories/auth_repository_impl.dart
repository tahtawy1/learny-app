import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:learny/core/error/exceptions.dart';
import 'package:learny/core/error/failure.dart';
import 'package:learny/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:learny/features/auth/data/models/user_model.dart';
import 'package:learny/features/auth/domain/entities/user_entity.dart';
import 'package:learny/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AuthFailure, UserEntity>> login(UserEntity entity) async {
    try {
      final result = await remoteDataSource.login(UserModel.fromEntity(entity));
      return Right(result);
    } on AuthException catch (e) {
      return Left(AuthExceptionMapper.map(e));
    } catch (e) {
      return Left(AuthFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, UserEntity>> register(UserEntity entity) async {
    try {
      final user = await remoteDataSource.register(UserModel.fromEntity(entity));
      return Right(user);
    } on AuthException catch (e) {
      return Left(AuthExceptionMapper.map(e));
    } catch (e) {
      return Left(AuthFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, void>> reloadCurrentUser() async {
    try {
      await remoteDataSource.reloadCurrentUser();
      return const Right(null);
    } on AuthException catch (e) {
      return Left(AuthExceptionMapper.map(e));
    } catch (e) {
      return Left(AuthFailure.unknown(e.toString()));
    }
  }

  @override
  bool isEmailVerified() => remoteDataSource.isEmailVerified();

  @override
  Future<Either<AuthFailure, void>> sendEmailVerification() async {
    try {
      await remoteDataSource.sendEmailVerification();
      return const Right(null);
    } on AuthException catch (e) {
      return Left(AuthExceptionMapper.map(e));
    } catch (e) {
      return Left(AuthFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, void>> sendPasswordResetEmail(String email) async {
    try {
      await remoteDataSource.sendPasswordResetEmail(email);
      return const Right(null);
    } on AuthException catch (e) {
      return Left(AuthExceptionMapper.map(e));
    } catch (e) {
      return Left(AuthFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, void>> signOut() async {
    try {
      await remoteDataSource.signOut();
      return const Right(null);
    } on AuthException catch (e) {
      return Left(AuthExceptionMapper.map(e));
    } catch (e) {
      return Left(AuthFailure.unknown(e.toString()));
    }
  }
}
