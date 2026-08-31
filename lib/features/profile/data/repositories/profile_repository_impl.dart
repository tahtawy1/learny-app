import 'package:dartz/dartz.dart';
import 'package:learny/core/error/exceptions.dart';
import 'package:learny/core/error/failure.dart';
import 'package:learny/features/auth/domain/entities/user_entity.dart';
import 'package:learny/features/profile/data/datasource/profile_remote_data_source.dart';
import 'package:learny/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    try {
      final user = await remoteDataSource.getCurrentUser();
      return Right(user);
    } on AuthException catch (e) {
      return Left(AuthExceptionMapper.map(e));
    } catch (e) {
      return Left(AuthFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> updateUserProfile({
    required String name,
  }) async {
    try {
      final user = await remoteDataSource.updateUserProfile(
        name: name,
      );
      return Right(user);
    } on AuthException catch (e) {
      return Left(AuthExceptionMapper.map(e));
    } catch (e) {
      return Left(AuthFailure.unknown(e.toString()));
    }
  }
}
