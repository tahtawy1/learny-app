import 'package:learny/core/services/firebase_service.dart';
import 'package:learny/features/auth/data/models/user_model.dart';

abstract class ProfileRemoteDataSource {
  Future<UserModel> getCurrentUser();

  Future<UserModel> updateUserProfile({required String name});
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  ProfileRemoteDataSourceImpl();

  @override
  Future<UserModel> getCurrentUser() async {
    return FirebaseService.getCurrentUser();
  }

  @override
  Future<UserModel> updateUserProfile({required String name}) async {
    return FirebaseService.updateUserProfile(name: name);
  }
}
